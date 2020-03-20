variable "prefix" {
  type    = string
  default = "ah" 
}

variable "rg-name" {
  type    = string
  default = "aks-rg"
}

variable "aks-sg-name" {
  type    = string
  default = "aks-sg"
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

variable "ad_app" {
  type    = string 
}

variable "password" {
  type = string 
}
