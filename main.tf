provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg_vm" {
  name     = "${var.prefix}-rg"
  location = var.region
}

resource "azurerm_virtual_network" "vnet_vm" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg_vm.location
  resource_group_name = azurerm_resource_group.rg_vm.name
}

resource "azurerm_subnet" "subnet_vm" {
  name                 = "${var.prefix}-internal-subnet"
  resource_group_name  = azurerm_resource_group.rg_vm.name
  virtual_network_name = azurerm_virtual_network.vnet_vm.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "public_ip_vm" {
  name                = "${var.prefix}-public-ip"
  resource_group_name = azurerm_resource_group.rg_vm.name
  location            = azurerm_resource_group.rg_vm.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic_vm" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.rg_vm.location
  resource_group_name = azurerm_resource_group.rg_vm.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet_vm.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip_vm.id
  }
}

resource "azurerm_network_security_group" "nsg_vm" {
  name                = "${var.prefix}-sg-ssh"
  location            = azurerm_resource_group.rg_vm.location
  resource_group_name = azurerm_resource_group.rg_vm.name

  security_rule {
    name                       = "ssh-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg_vm" {
  subnet_id                 = azurerm_subnet.subnet_vm.id
  network_security_group_id = azurerm_network_security_group.nsg_vm.id
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  name                = "${var.prefix}-vm"
  resource_group_name = azurerm_resource_group.rg_vm.name
  location            = azurerm_resource_group.rg_vm.location
  size                = var.vm_model
  admin_username      = var.username

  network_interface_ids = [
    azurerm_network_interface.nic_vm.id,
  ]

  admin_ssh_key {
    username   = var.username
    public_key = file(var.ssh_public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }
}

module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = azurerm_resource_group.rg_vm.name
  location            = azurerm_resource_group.rg_vm.location
  prefix              = var.prefix
  admin_username      = var.pg_admin_username
  admin_password      = var.pg_admin_password
  sku_name            = "GP_Standard_D2s_v3"
  storage_mb          = 32768
  delegated_subnet_id = azurerm_subnet.subnet_vm.id
}

