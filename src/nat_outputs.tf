# nat_outputs.tf
data "yandex_vpc_gateway" "default" {
  gateway_id = yandex_vpc_gateway.nat_gateway.id
}

# output "gateway" {
#   value = data.yandex_vpc_gateway.default.created_at
#   description = "Время создания NAT-шлюза"
# }

output "gateway" {
  value = {
    id         = data.yandex_vpc_gateway.default.id
    name       = data.yandex_vpc_gateway.default.name
    created_at = data.yandex_vpc_gateway.default.created_at
  }
  description = "Информация о NAT-шлюзе"
}
