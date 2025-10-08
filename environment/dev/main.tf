module "rgs" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}
module "aks" {
  depends_on = [ module.rgs ]
  source          = "../../modules/azurerm_kubernetes_cluster"
  aksmap          = var.aksmap
}