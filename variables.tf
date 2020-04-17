# Set the prefix variable to e.g. your initials to ensure creation of unique resources.
variable "prefix" {
  type    = string
}

# Set the name of the AD app and SP created manually.
variable "ad_app" {
  type    = string
}

# set variable password to the secret associated with the above app/SP.
variable "password" {
  type = string
}

# define credentials and ssh key for the linux user of the AKS nodes.
variable "linuxuser" {
   type = string 
}

variable "mysshkey" {
   type   = string
}

# Default location for the entire setup is "West Europe".
variable "location" {
  type    = string
  default = "West Europe"
}

variable "k8sversion" {
  type    = string
  default = "1.16"
}

# Below are suffixes you can modify but which generally take sensible defaults.

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
  default = "5875aksacr"
}

variable "lb-name" {
  type = string 
  default = "aks-lb" 
}

variable "clustername" {
  type    = string
  default = "aks-cluster"
}
