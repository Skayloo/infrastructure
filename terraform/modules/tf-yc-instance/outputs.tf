output "ip_address" {
    value = "Internal IP: ${yandex_compute_instance.vm-1.network_interface.0.ip_address} External IP: ${yandex_vpc_address.addr.external_ipv4_address[0].address}"
}