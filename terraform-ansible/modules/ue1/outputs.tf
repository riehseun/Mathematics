output "public_subnet_name"  {
	value = ""
}

output "vm1_public_address" {
	value = "${google_compute_instance.vm1.*.network_interface.0.access_config.0.nat_ip}"
}

output "vm2_public_address" {
    value = "${google_compute_instance.vm2.*.network_interface.0.access_config.0.nat_ip}"
}

output "vm3_public_address" {
    value = "${google_compute_instance.vm3.*.network_interface.0.access_config.0.nat_ip}"
}

output "vm4_public_address" {
    value = "${google_compute_instance.vm4.*.network_interface.0.access_config.0.nat_ip}"
}