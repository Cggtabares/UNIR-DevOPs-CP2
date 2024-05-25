#Outputs de los diferentes modulos
#direccion del ACR
output "acr_login_server" {
  value = azurerm_container_registry.CP2-ACR.login_server
}

#

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.myAks1.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.myAks1.kube_config_raw

  sensitive = true
}

output "private_key" {
  value = tls_private_key.admin_ssh.private_key_pem
  sensitive = true
  
}