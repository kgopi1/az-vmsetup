variable "tags" {
  default = {
    owner       = "Owner1"
    email       = "Owner@sainsburys.co.uk"
    project     = "dev"
    environment = "dev"
    costcentre  = "XXXX"
    live        = "no"
  }
  description = "Map of tags to be assigned to the resources"
}

variable "rgname" {
  default = "cloudopslab-rg"
}

variable "rglocation" {
  default = "westeurope"
}
