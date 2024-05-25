#Creamos el Security Group
resource "azurerm_network_security_group" "SecG1" {
  name                = "SecurityGroup1"
  location            = var.location
  resource_group_name = azurerm_resource_group.Caso_Practico_2.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "CP2"
  }
}

