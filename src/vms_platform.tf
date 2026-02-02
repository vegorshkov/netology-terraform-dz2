# # Задача №9  ресурс перенесен в net-gw-01-lan.tf
# resource "yandex_vpc_subnet" "subnet_a" {
#   name           = "${var.vpc_name}-a"
#   zone           = var.zone_a
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.subnet_a_cidr
# }

# resource "yandex_vpc_subnet" "subnet_b" {
#   name           = "${var.vpc_name}-b"
#   zone           = var.zone_b
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.subnet_b_cidr
# }

resource "yandex_compute_instance" "platform" {
  zone        = var.vm_web_config["web"].zone
#   name      = locals.vm_web_name #  переменная задана динамически через local.tf
  name        = var.vm_web_config["web"].name
  platform_id = var.vm_web_config["web"].platform_id

  allow_stopping_for_update = var.vms_resources["web"].update

  resources {
    # cores         = var.vm_web_config["web"].cores  # task6
    # memory        = var.vm_web_config["web"].memory # task6
    # core_fraction = var.vm_web_config["web"].core_fraction #task6
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      # type = var.vm_web_config["web"].disk_type
      type = var.vms_resources["web"].hdd_type
      size     = var.vms_resources["web"].hdd_size #  новый параметр указан в task6
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_config["web"].preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_a.id
    nat       = var.vm_web_config["web"].nat_enabled
  }

  metadata = {
    # serial-port-enable = var.vm_web_config["web"].serial_port_enable
    serial-port-enable = var.metadata.serial-port-enable
    # ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    ssh-keys           = var.metadata.ssh-keys
  }

}

resource "yandex_compute_instance" "db" {
  zone        = var.vm_db_config["db"].zone
  name        = local.vm_db_name  #  переменная задана динамически через local.tf
#  name        = var.vm_db_config["db"].name
  platform_id = var.vm_db_config["db"].platform_id
  resources {
    # cores         = var.vm_db_config["db"].cores
    cores         = var.vms_resources["db"].cores
    # memory        = var.vm_db_config["db"].memory
    memory        = var.vms_resources["db"].memory
    # core_fraction = var.vm_db_config["db"].core_fraction
    core_fraction = var.vms_resources["db"].core_fraction

  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      # type     = var.vm_db_config["db"].disk_type
      type     = var.vms_resources["db"].hdd_type
      size     = var.vms_resources["db"].hdd_size
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_config["db"].preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_b.id
    nat       = var.vm_db_config["db"].nat_enabled
  }

  metadata = {
    # serial-port-enable = var.vm_db_config["db"].serial_port_enable  # увидел еще один хардкод)
    serial-port-enable = var.metadata.serial-port-enable
    # ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
    ssh-keys           = var.metadata.ssh-keys
  }
}

