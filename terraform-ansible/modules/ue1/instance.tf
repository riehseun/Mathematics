resource "google_compute_instance" "vm1" {
    name          = "k8s-master"
    machine_type  = "n1-standard-2"
    zone          = "${format("%s","${var.var_region_name}-c")}"

    tags          = ["ssh","http"]

    boot_disk {
        initialize_params {
            image = "centos-7-v20180129"
        }
    }

    metadata {
        foo = "bar"
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.public_subnet.name}"

        access_config {
            // Ephemeral IP
        }
    }

    provisioner "remote-exec" {
        # You cannot open interactive session with "sudo -i". You must also run all yum commands with -y flag
        inline = [
            "sudo yum install ansible -y"
        ]

        connection {
            host        = "${self.network_interface.0.access_config.0.nat_ip}"
            type        = "ssh"
            user        = "${var.ssh_user}"
            private_key = "${file("~/.ssh/id_rsa")}"
        }
    }

    provisioner "local-exec" {
        # Environment variable can be used inside ansible playbook
        environment {
            PUBLIC_IP                 = "${self.network_interface.0.access_config.0.nat_ip}"
            HOSTNAME                  = "k8s-master"
            ANSIBLE_HOST_KEY_CHECKING = false # This is must to avoid the error "The authenticity of host can't be established"
        }

        # You must install "ansible" on the machine where terraform-ansible suites get executed
        # Add "-vvv" for verbose output
        command     = "ansible-playbook -u ${var.ssh_user} --private-key ~/.ssh/id_rsa ../ansible/k8s-master.yaml -i $PUBLIC_IP,"
    }
}

resource "google_compute_instance" "vm2" {
    depends_on = ["google_compute_instance.vm1"]
    name          = "k8s-node1"
    machine_type  = "n1-standard-1"
    zone          = "${format("%s","${var.var_region_name}-c")}"

    tags          = ["ssh","http"]

    boot_disk {
        initialize_params {
            image = "centos-7-v20180129"
        }
    }

    metadata {
        foo = "bar"
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.public_subnet.name}"

        access_config {
            // Ephemeral IP
        }
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install ansible -y"
        ]

        connection {
            host        = "${self.network_interface.0.access_config.0.nat_ip}"
            type        = "ssh"
            user        = "${var.ssh_user}"
            private_key = "${file("~/.ssh/id_rsa")}"
        }
    }

    provisioner "local-exec" {
        environment {
            PUBLIC_IP                 = "${self.network_interface.0.access_config.0.nat_ip}"
            HOSTNAME                  = "k8s-node1"
            ANSIBLE_HOST_KEY_CHECKING = false
        }

        command     = "ansible-playbook -u ${var.ssh_user} --private-key ~/.ssh/id_rsa ../ansible/k8s-node.yaml -i $PUBLIC_IP,"
    }
}

resource "google_compute_instance" "vm3" {
    depends_on = ["google_compute_instance.vm1"]
    name          = "k8s-node2"
    machine_type  = "n1-standard-1"
    zone          = "${format("%s","${var.var_region_name}-c")}"

    tags          = ["ssh","http"]

    boot_disk {
        initialize_params {
            image = "centos-7-v20180129"
        }
    }

    metadata {
        foo = "bar"
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.public_subnet.name}"

        access_config {
            // Ephemeral IP
        }
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install ansible -y"
        ]

        connection {
            host        = "${self.network_interface.0.access_config.0.nat_ip}"
            type        = "ssh"
            user        = "${var.ssh_user}"
            private_key = "${file("~/.ssh/id_rsa")}"
        }
    }

    provisioner "local-exec" {
        environment {
            PUBLIC_IP                 = "${self.network_interface.0.access_config.0.nat_ip}"
            HOSTNAME                  = "k8s-node2"
            ANSIBLE_HOST_KEY_CHECKING = false
        }

        command     = "ansible-playbook -u ${var.ssh_user} --private-key ~/.ssh/id_rsa ../ansible/k8s-node.yaml -i $PUBLIC_IP,"
    }
}

resource "google_compute_instance" "vm4" {
    depends_on = ["google_compute_instance.vm1"]
    name          = "k8s-node3"
    machine_type  = "n1-standard-1"
    zone          = "${format("%s","${var.var_region_name}-c")}"

    tags          = ["ssh","http"]

    boot_disk {
        initialize_params {
            image = "centos-7-v20180129"
        }
    }

    metadata {
        foo = "bar"
    }

    network_interface {
        subnetwork = "${google_compute_subnetwork.public_subnet.name}"

        access_config {
            // Ephemeral IP
        }
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install ansible -y"
        ]

        connection {
            host        = "${self.network_interface.0.access_config.0.nat_ip}"
            type        = "ssh"
            user        = "${var.ssh_user}"
            private_key = "${file("~/.ssh/id_rsa")}"
        }
    }

    provisioner "local-exec" {
        environment {
            PUBLIC_IP                 = "${self.network_interface.0.access_config.0.nat_ip}"
            HOSTNAME                  = "k8s-node3"
            ANSIBLE_HOST_KEY_CHECKING = false
        }

        command     = "ansible-playbook -u ${var.ssh_user} --private-key ~/.ssh/id_rsa ../ansible/k8s-node.yaml -i $PUBLIC_IP,"
    }
}