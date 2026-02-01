terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.180.0"
    }
  }
  required_version = "~>1.12.0"
}

provider "yandex" {
  # token     = var.token

  cloud_id  = var.vm_web_cloud["web"].cloud_id
  folder_id = var.vm_web_cloud["web"].folder_id
  
  #cloud_id                 = var.cloud_id
  #folder_id                = var.folder_id
  #zone                     = var.default_zone   -   заменяем на зоны -a и -b
  service_account_key_file = file("./.authorized-key.json")

}
