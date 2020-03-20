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

# Default location for the entire setup is "West Europe".
variable "location" {
  type    = string
  default = "West Europe"
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
  default = "aksacr"
}

variable "lb-name" {
  type = string 
  default = "aks-lb" 
}

variable "clustername" {
  type    = string
  default = "aks-cluster"
}
