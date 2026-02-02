# Я решил, что роутер будет записан в отдельный файл net-gw-01.tf а сети и маршрутизация в net-gw-01-lan.tf
# попробуем перенести сюда всю сетевую инфраструктуру проекта.

# 1. Объявляем сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# 2. Обозначаем подсеть в зоне ru-central1-a
resource "yandex_vpc_subnet" "subnet_a" {
  name           = "${var.vpc_name}-a"
  zone           = var.zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_a_cidr
  route_table_id = yandex_vpc_route_table.nat_route_table.id  # Привязка к таблице маршрутизации
}

# 3. Обознаачаем подсеть в зоне ru-central1-b
resource "yandex_vpc_subnet" "subnet_b" {
  name           = "${var.vpc_name}-b"
  zone           = var.zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_b_cidr
  route_table_id = yandex_vpc_route_table.nat_route_table.id  # Привязка к таблице маршрутизации
}

# 4. Указываем на NAT-шлюз 
resource "yandex_vpc_gateway" "nat_gateway" {
  name = "nat-gateway"
  shared_egress_gateway {}
}

# 5. Таблица маршрутизации для NAT
resource "yandex_vpc_route_table" "nat_route_table" {
  name       = "nat-route-table"
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0" # весь трафик запускаем на шлюз (не ясно пока как d-nat будет работать)
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}
