module "infra" {
  source = "../../modules/infra"
  rglocation = "${var.rglocation}"
  rgname = "${var.rgname}"
  vnetname = "${var.vnetname}"
  vnetaddress = "${var.vnetaddress}"
  subnetname = "${var.subnetname}"
  subnetrange = "${var.subnetrange}"
  tags = "${var.tags}"
  vmcount = "${var.vmcount}"
  vmhostname = "${var.vmhostname}"
  disksgacct01 = "${var.disksgacct01}"
  ddiskcount = "${var.ddiskcount}"
}
