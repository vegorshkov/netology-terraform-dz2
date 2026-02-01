resource "yandex_vpc_subnet" "subnet_a" {
  name           = "${var.vpc_name}-a"
  zone           = var.zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_a_cidr
}

resource "yandex_vpc_subnet" "subnet_b" {
  name           = "${var.vpc_name}-b"
  zone           = var.zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.subnet_b_cidr
}

resource "yandex_compute_instance" "platform" {
  zone        = var.vm_web_config["web"].zone
  name        = var.vm_web_config["web"].name
  platform_id = var.vm_web_config["web"].platform_id

  resources {
    cores         = var.vm_web_config["web"].cores
    memory        = var.vm_web_config["web"].memory
    core_fraction = var.vm_web_config["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.vm_web_config["web"].disk_type
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
    serial-port-enable = var.vm_web_config["web"].serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "db" {
  zone        = var.vm_db_config["db"].zone
  name        = var.vm_db_config["db"].name
  platform_id = var.vm_db_config["db"].platform_id
  resources {
    cores         = var.vm_db_config["db"].cores
    memory        = var.vm_db_config["db"].memory
    core_fraction = var.vm_db_config["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_db_config["db"].disk_type
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
    serial-port-enable = var.vm_db_config["db"].serial_port_enable  # увидел еще один хардкод)
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

