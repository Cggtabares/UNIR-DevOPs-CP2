#Variables para las diferentes conf

#Variables de archivo Main
variable "location" {
  type        = string
  description = "Region de Azure donde crearemos la infraestructura"
  default     = "eastus"
}



#Variables de VM
variable "vm_size" {
  type        = string
  description = "Size and type  of VMs"
  default     = "Standard_D2s_v3" #2vcpus, 8GiB memory
}