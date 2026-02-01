###cloud vars

# Мошут быть разных типов (подсказка)
# type = string     # Строка
# type = number     # Число
# type = bool       # Логический (true/false)
# type = list       # Список
# type = set        # Множество (уникальные значения)
# type = map        # Словарь (ключ-значение)
# type = object({}) # Объект с определенными полями
# type = tuple([])  # Кортеж с фиксированной структурой
# type = any        # Любой тип

variable "test" {
type = list(map(list(string)))
description = "задача 8"
}

#     Входящие переменные, MAP type. Задание2.  указаны в terraform.tfvars

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
    update        = bool
  }))
  description = "Системные ресурсы для vm Задание №6"
}

variable "metadata" {
  type = object({
    serial-port-enable = number
    ssh-keys           = string
  })
  description = "Метаданные для vm Задание №6"
}


variable "vm_web_config" {
  type = map(object({
    zone               = string
    name               = string
    platform_id        = string
    # cores              = number # закомментировано по заданию 6
    # memory             = number # закомментировано по заданию 6
    # core_fraction      = number # закомментировано по заданию 6
    preemptible        = bool
    # serial_port_enable = bool
    # disk_type          = string # закомментировано по заданию 6
    nat_enabled        = bool
  }))
  
  description = "параметры виртуальной машины"
}

variable "vm_db_config" {
  type = map(object({
    zone               = string
    name               = string
    platform_id        = string
    # cores              = number # закомментировано по заданию 6
    # memory             = number # закомментировано по заданию 6
    # core_fraction      = number # закомментировано по заданию 6
    preemptible        = bool
    # serial_port_enable = bool
    # disk_type          = string # закомментировано по заданию 6
    nat_enabled        = bool
  }))
  
  description = "параметры виртуальной машины"
}


variable "vm_web_cloud" {
  type = map(object({
    cloud_id  = string
    folder_id = string
  }))
  description = "параметры облака, не секретные"
}

variable "zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "zone_b" {
type          = string
default       = "ru-central1-b"
description   = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "subnet_a_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "subnet_b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network name+"
}


# ###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsV4FbyZ3PqkzeSGNvDLFHBY7xv8t4oWavwhzwqErDe"
#   description = "ssh-keygen -t ed25519"
# }


