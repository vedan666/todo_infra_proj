rgs = {
  rg-dev-todoapp-01 = {
    location = "central india"
  }
}

aksmap = {
  aksdevtodoapp01 = {
    azurerm_container_registry_name = "acrdevtodoappved6942001"
    resource_group_name             = "rg-dev-todoapp-01"
    location                        = "central india"
    dns_prefix                      = "aksdevtodoapp01"
  }
}

sql_dbs = {
sqldb-dev-todoapp69420 = {
      server_name                  = "sqldb-dev-todoapp-server"
      resource_group_name          = "rg-dev-todoapp-01"
      location                     = "centralindia"
      administrator_login          = "devopsadmin"
      administrator_login_password = "P@ssw01rd@123"
      max_size_gb                  = 2
    }
}
