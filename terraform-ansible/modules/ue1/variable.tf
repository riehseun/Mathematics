variable "var_env" {}
variable "var_company" {}
variable "var_region_name" {}
variable "var_ue1_public_subnet" {}
variable "var_ue1_private_subnet" {}
variable "network_self_link" {}
variable "subnetwork1" {}
variable "ssh_user" {
    description = ""
    default = "Rieh"
}
variable "ssh_key_private" {
    description = ""
    default = "~/.ssh/id_rsa"
}