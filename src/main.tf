# Задача №9  ресурс перенесен в net-gw-01-lan.tf

# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}
