module "tf-yc-instance"{
    source = "./modules/tf-yc-instance"
    secondary_disk_var = {
        name = "var-partition-std-022-039"
        type = "network-hdd"
        size = 2}
    thirdary_disk_var = {
        name = "log-partition-std-022-039"
        type = "network-hdd"
        size = 4}
    vm-1 = {
        name = "std-022-039"
        platform_id = "standard-v1"
    }
}

module "tf-yc-network"{
    source = "./modules/tf-yc-network"
    subnet_list = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}