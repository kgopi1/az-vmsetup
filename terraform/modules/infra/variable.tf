variable "rgname" {}
variable "rglocation" {}
variable "vnetname" {}
variable "vnetaddress" {}
variable "subnetname" {}
variable "subnetrange" {}
variable "tags" {
  type        = "map"
  description = "Map of tags to be assigned to the resources"
}
variable "vmcount" {}
variable "vmhostname" {}
variable "disksgacct01" {}
variable "ddiskcount" {}
