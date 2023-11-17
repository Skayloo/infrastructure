resource "yandex_compute_disk" "secondary_disk"{
    name       = "var-partition-std-022-039"
    type       = "network-hdd"
    zone       = var.zone_var
    size       = 2
}

resource "yandex_compute_disk" "thirdary_disk"{
    name       = "log-partition-std-022-039"
    type       = "network-hdd"
    zone       = var.zone_var
    size       = 4
}

resource "yandex_vpc_address" "addr" {
  name = "vm-adress"
  external_ipv4_address {
    zone_id = var.zone_var
  }
}

resource "yandex_compute_instance" "vm-1" {
    name        = "std-022-039"
    platform_id = "standard-v1"
    zone        = var.zone_var

    resources {
        cores  = 2
        memory = 4
    }

    boot_disk {
        initialize_params {
            image_id = var.image_id_var
            size = 50
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
        nat       = true
        nat_ip_address = yandex_vpc_address.addr.external_ipv4_address[0].address
    }

    scheduling_policy {
      preemptible = false
    }

    metadata = {
        user-data = "${file("user-data")}"
    }
}