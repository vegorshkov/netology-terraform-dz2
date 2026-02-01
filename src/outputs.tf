output "vm_instances" {
description = "Информация о созданных виртуальных машинах"
value = {
vm_web = {
name = local.vm_web_name
fqdn = yandex_compute_instance.platform.fqdn
external_ip = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}
vm_db = {
name = local.vm_db_name
fqdn = yandex_compute_instance.db.fqdn
external_ip = yandex_compute_instance.db.network_interface.0.nat_ip_address
}
}
}

