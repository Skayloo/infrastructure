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