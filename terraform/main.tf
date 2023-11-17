module "tf-yc-instance"{
    source = "./modules/tf-yc-instance"
}

module "tf-yc-network"{
    source = "./modules/tf-yc-network"
    subnet_list = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}