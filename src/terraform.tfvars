vpc_name = "develop"
#zone_a = "ru-central1-a"
#zone_b = "ru-central1-b"
#subnet_a_cidr = ["10.0.1.0/24"]
#subnet_b_cidr = ["10.0.2.0/24"]

vm_web_cloud = {
  web = {
    cloud_id  = "b1gb43b8b56tkbsflrmt"
    folder_id = "b1g883r36u9293g7u1gc"
  }  
}

# вводим новый ресурсный блок, и определяем в нем значения перемменных для vm задание 6
vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    hdd_size      = 8
    hdd_type      = "network-hdd"
    update        = true
  },
  db = {
    cores         = 2
    memory        = 2
    core_fraction = 20
    hdd_size      = 10
    hdd_type      = "network-hdd"
    update        = true
  }
}

# указываем на новый ресурсный блок для vm по заданию 6 определяющий metadata
metadata = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsV4FbyZ3PqkzeSGNvDLFHBY7xv8t4oWavwhzwqErDe"
}



vm_web_config = {
  web = {
    zone               = "ru-central1-a"
    name               = "netology-develop-platform-web"
    platform_id        = "standard-v2"  #  legasy v1  заменен на v2 (ошибка описана в README.md)
#    cores              = 2   # закомментировано по заданию 6
#    memory             = 1   # закомментировано по заданию 6
#    core_fraction      = 5   # закомментировано по заданию 6
    preemptible        = true
    serial_port_enable = 1
#    disk_type          = "network-hdd" # закомментировано по заданию 6
    nat_enabled        = true
  }
}

vm_db_config = {
  db = {
    zone               = "ru-central1-b"
    name               = "netology-develop-platform-db"
    platform_id        = "standard-v2"
    # cores              = 2  # закомментировано по заданию 6
    # memory             = 2  # закомментировано по заданию 6
    # core_fraction      = 20 # закомментировано по заданию 6
    preemptible        = true 
    serial_port_enable = 1
    # disk_type          = "network-hdd"  # закомментировано по заданию 6
    nat_enabled        = true
  }
}

test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
