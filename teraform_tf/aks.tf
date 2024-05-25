#Crear el cluster de Kubernetes
resource "azurerm_kubernetes_cluster" "myAks1" {
  name                = "AKS-CP2"
  location            = var.location
  resource_group_name = azurerm_resource_group.Caso_Practico_2.name
  dns_prefix          = "AKS-DNS-CP2"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "CP2"
  }
}