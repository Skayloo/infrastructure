variable "image_id_var" {
    type = string
    default = "fd80qm01ah03dkqb14lc"
    description = "Image_id_from_YC"
}

variable "subnet_id_var" {
    type = string
    default = "e9bmq2f27li3v3u21i30"
    description = "Subnet_id_from_YC"
}

variable "zone_var" {
    type = string
    default = "ru-central1-a"
    description = "Zone from YC"
}

variable "secondary_disk_var"{
    type = object({
        name       = string
        type       = string
        size       = number
    })
}

variable "thirdary_disk_var"{
    type = object({
        name       = string
        type       = string
        size       = number
    })
}

variable "vm-1" {
    type = object({
        name = string
        platform_id = string
    })
}

variable "resources"{
    type = object({
        cores  = number
        memory = number
    })
    default = {
        cores = 2
        memory = 4
    }
}

variable "boot_disk_var"{
    type = number
    default = 50
}

variable "default_true_var"{
    type = bool
    default = true
}

variable "addr_var" {
    type = string
    default = "vm-adress"
}