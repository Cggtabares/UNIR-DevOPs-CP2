#Usar modulo de TF para crear las SSH keys
resource "tls_private_key" "admin_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Guardar fichero de ssh (private_key)  en la VM local
resource "local_file" "linuxkey" {
  filename = "linuxkey.pem"
  content  = tls_private_key.admin_ssh.private_key_pem
}

#Crear una maquina Virtual
resource "azurerm_linux_virtual_machine" "myVm1" {
  name                = "myVmLinux1"
  resource_group_name = azurerm_resource_group.Caso_Practico_2.name
  location            = var.location
  size                = var.vm_size
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.myNic1.id,
  ]
  computer_name                   = "CP2-VM-1"


  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.admin_ssh.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  depends_on = [tls_private_key.admin_ssh]

}

#Asociar el  security group al interface de red
resource "azurerm_network_interface_security_group_association" "asoc1" {
  network_interface_id      = azurerm_network_interface.myNic1.id
  network_security_group_id = azurerm_network_security_group.SecG1.id
}
