resource "azurerm_resource_group" "resourcegroups" {
  for_each = var.rgs
  name     = each.key
  location = each.value.location
}
