terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }

  # backend "s3" {
  #   endpoint   = "storage.yandexcloud.net"
  #   bucket     = "terraform-state-std-022-039"
  #   region     = "ru-central1"
  #   key        = "terraform.tfstate"

  #   skip_region_validation      = true
  #   skip_credentials_validation = true
  # }
}

provider "yandex" {
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gm68de4u794bg8egku"
  zone      = "ru-central1-a"
  service_account_key_file = "C:\\Users\\ss\\Downloads\\authorized_key.json" #ТУТ УЖ ИЗВИНИТЕ НА ВИНДЕ ПО-ДРУГОМУ НЕ ЗАВОДИТСЯ!!!!!
}

resource "yandex_compute_instance" "vm-1" {
    name = "std-022-039"

    # Конфигурация ресурсов:
    # количество процессоров и оперативной памяти
    resources {
        cores  = 2
        memory = 2
    }

    # Загрузочный диск:
    # здесь указывается образ операционной системы
    # для новой виртуальной машины
    boot_disk {
        initialize_params {
            image_id = "fd80qm01ah03dkqb14lc"
        }
    }

    # Сетевой интерфейс:
    # нужно указать идентификатор подсети, к которой будет подключена ВМ
    network_interface {
        subnet_id = "e9bmq2f27li3v3u21i30"
        nat       = false
    }

    # Метаданные машины:
    # здесь можно указать скрипт, который запустится при создании ВМ
    # или список SSH-ключей для доступа на ВМ
    metadata = {
        user-data = "${file("user-data")}"
    }
}

output "ip_address" {
    value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}