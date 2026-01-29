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



#     Входящие переменные, MAP type. Задание2.  указаны в terraform.tfvars


variable "vm_web_config" {
  type = map(object({
    name               = string
    platform_id        = string
    cores              = number
    memory             = number
    core_fraction      = number
    preemptible        = bool
    serial_port_enable = bool
    disk_type          = string
    nat_enabled        = bool
  }))
  
  description = "параметры виртуальной машины"
}

variable vm_web_cloud = {
  type = map(object(  {
    cloud_id  = string
    folder_id = string
                      }
            )      )
  description = "параметры облака, не секретные"
}



# variable "cloud_id" {
#   type        = string
#   description = "cloud id"
#   default     =  var.vm_web_cloud_id  # "b1gb43b8b56tkbsflrmt"
#   validation  = 
# }

# variable "folder_id" {
#   type        = string
#   description = "folder id"
#   default     = "b1g883r36u9293g7u1gc"
# }


# variable "cloud_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
# }

# variable "folder_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
# }

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsV4FbyZ3PqkzeSGNvDLFHBY7xv8t4oWavwhzwqErDe"
  description = "ssh-keygen -t ed25519"
}


