#Creamos el Azure Container Registry
resource "azurerm_container_registry" "CP2-ACR" {
  name                          = "CP2Containerreg"
  resource_group_name           = azurerm_resource_group.Caso_Practico_2.name
  location                      = var.location
  sku                           = "Basic"
  admin_enabled                 = true
  public_network_access_enabled = true
}