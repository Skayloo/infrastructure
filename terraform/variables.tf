variable "cloud_id_var" {
    type = string
    description = "Cloud_id_from_YC"
    sensitive = true
}

variable "folder_id_var" {
    type = string
    description = "Folder_id_from_YC"
    sensitive = true
}

variable "key_file_path" {
    type = string
    description = "File path with keys for deploy"
    sensitive = true
}

variable "zone_var" {
    type = string
    default = "ru-central1-a"
    description = "Zone from YC"
}

variable "access_key" {
    type = string
    description = "Key ID"
    sensitive = true
}

variable "secret_key" {
    type = string
    description = "Secret key"
    sensitive = true
}