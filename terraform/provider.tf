provider "yandex" {
  cloud_id  = var.cloud_id_var
  folder_id = var.folder_id_var
  zone      = "ru-central1-a"
  service_account_key_file = var.key_file_path
}