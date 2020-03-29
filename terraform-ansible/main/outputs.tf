output "vpc_self_link" {
    value = "${module.vpc.vpc_self_link}"
}

output "ue1_vm1_public_address"  {
	value = "${module.ue1.vm1_public_address}"
}

output "ue1_vm2_public_address"  {
    value = "${module.ue1.vm2_public_address}"
}

output "ue1_vm3_public_address"  {
    value = "${module.ue1.vm3_public_address}"
}

output "ue1_vm4_public_address"  {
    value = "${module.ue1.vm4_public_address}"
}