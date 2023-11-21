resource "yandex_compute_disk" "secondary_disk"{
    name       = var.secondary_disk_var.name
    type       = var.secondary_disk_var.type
    zone       = var.zone_var
    size       = var.secondary_disk_var.size
}

resource "yandex_compute_disk" "thirdary_disk"{
    name       = var.thirdary_disk_var.name
    type       = var.thirdary_disk_var.type
    zone       = var.zone_var
    size       = var.thirdary_disk_var.size
}

resource "yandex_vpc_address" "addr" {
  name = var.addr_var
  external_ipv4_address {
    zone_id = var.zone_var
  }
}

resource "yandex_compute_instance" "vm-1" {
    name        = var.vm-1.name
    platform_id = var.vm-1.platform_id
    zone        = var.zone_var

    resources {
        cores  = var.resources.cores
        memory = var.resources.memory
    }

    boot_disk {
        initialize_params {
            image_id = var.image_id_var
            size = var.boot_disk_var
        }
    }

    secondary_disk {
      disk_id = yandex_compute_disk.secondary_disk.id
    }
    
    secondary_disk {
      disk_id = yandex_compute_disk.thirdary_disk.id
    }

    network_interface {
        subnet_id = var.subnet_id_var
        nat       = var.default_true_var
        nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
    }

    scheduling_policy {
      preemptible = var.default_true_var
    }

    metadata = {
        user-data = "${file("user-data")}"
    }
}