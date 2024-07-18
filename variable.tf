variable "rgname" {
  description = "Name of the resource group"
  type = string
  default="rgtf"
}
variable "location" {
  type= string
  default="East US"
}
variable "virtualnet_name" {
  type = string
  default = "pipenet"
}
variable "subnetname" {
  type=string
  default="subtf"
}
