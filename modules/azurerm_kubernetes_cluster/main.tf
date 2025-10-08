resource "azurerm_container_registry" "acr" {
  for_each            = var.aksmap
  name                = each.value.azurerm_container_registry_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  sku                 = "Basic"
}

resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aksmap
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

}

resource "azurerm_role_assignment" "acrole" {
  for_each                         = var.aksmap
  principal_id                     = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr[each.key].id
  skip_service_principal_aad_check = true
}
