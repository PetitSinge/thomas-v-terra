resource_group_name     = "my-resource-group"
location                = "East US"
address_space           = ["10.0.0.0/16"]
db_admin_username       = "adminuser"
db_admin_password       = "securepassword123"
db_sku_name             = "GP_Gen5_2"
db_storage_mb           = 51200
storage_account_name    = "mystorageaccount"
storage_account_sku     = "Standard_LRS"
prefix = "myproject"
tags = {
  environment = "staging"
  project     = "terraform"
}
subscription_id = "0696952d-ddcb-4855-a2de-0068909dbc91" 
