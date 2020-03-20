variable "rg-name" {
  type    = string
  default = "aks-rg"
}

variable "acr-name" {
  type = string
  default = "ahacrngx"
}

variable "lb-name" {
  type = string 
  default = "aks-lb" 
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "clustername" {
  type    = string
  default = "aks-cluster"
}

variable "password" {
  type = string 
}
