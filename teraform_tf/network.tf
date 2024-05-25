#Creamos la red
resource "azurerm_virtual_network" "myNet" {
  name                = "network_CP2"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.Caso_Practico_2.name

  tags = {
    environment = "CP2"
  }
}

#Creacion de subnet
resource "azurerm_subnet" "mySubNet" {
  name                 = "subnet_CP2"
  resource_group_name  = azurerm_resource_group.Caso_Practico_2.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

#Creacion de Interfaz de red (NIC)
resource "azurerm_network_interface" "myNic1" {
  name                = "vmnic1"
  location            = var.location
  resource_group_name = azurerm_resource_group.Caso_Practico_2.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mySubNet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.10"
    public_ip_address_id          = azurerm_public_ip.myPublicIp1.id

  }

  tags = {
    environment = "CP2"
  }
}

#Creacion de IP publica
resource "azurerm_public_ip" "myPublicIp1" {
  name                = "vmip1"
  location            = azurerm_resource_group.Caso_Practico_2.location
  resource_group_name = azurerm_resource_group.Caso_Practico_2.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

  tags = {
    environment = "CP2"
  }

}
