output "server_id_list" {
  value       = [for s in values(azurerm_mssql_server.sql_server) : s.id]
}