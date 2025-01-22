resource_group_name     = "my-resource-group"
location                = "East US"
address_space           = ["10.0.0.0/16"]
db_admin_username       = "adminuser"
db_admin_password       = "securepassword123"
db_sku_name = "GP_Standard_D2s_v3"
db_storage_mb           = 32768
storage_account_sku     = "Standard_LRS"
prefix = "myproject"
tags = {
  environment = "staging"
  project     = "terraform"
}
subscription_id = "0696952d-ddcb-4855-a2de-0068909dbc91" 
storage_account_name = "myprojectstorage"
account_name = "myprojectstorage"