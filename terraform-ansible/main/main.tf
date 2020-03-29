provider "google" {
    credentials = "${file("../../googlecloud/credential.json")}"
    project     = "${var.project}"
}

module "vpc" {
    source                 = "../modules/global"
    var_env                = "${var.env}"
    var_company            = "${var.company}"
    var_region_name        = "${var.region_name}"
    var_ue1_public_subnet  = "${var.ue1_public_subnet}"
    var_ue1_private_subnet = "${var.ue1_private_subnet}"
}

module "ue1" {
    source                 = "../modules/ue1"
    var_env                = "${var.env}"
    var_company            = "${var.company}"
    var_region_name        = "${var.region_name}"
    var_ue1_public_subnet  = "${var.ue1_public_subnet}"
    var_ue1_private_subnet = "${var.ue1_private_subnet}"
    network_self_link      = "${module.vpc.vpc_self_link}"
    subnetwork1            = "${module.ue1.public_subnet_name}"
}