resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_dbs
  name                         = each.value.server_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
}

resource "azurerm_mssql_database" "sql_db" {
  for_each     = var.sql_dbs
  name         = each.key
  server_id    = azurerm_mssql_server.sql_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"
}
