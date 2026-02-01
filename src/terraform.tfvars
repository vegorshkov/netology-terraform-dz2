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

vm_web_config = {
  web = {
    zone               = "ru-central1-a"
    name               = "netology-develop-platform-web"
    platform_id        = "standard-v1"
    cores              = 2
    memory             = 1
    core_fraction      = 5
    preemptible        = true
    serial_port_enable = true
    disk_type          = "network-hdd"
    nat_enabled        = true
  }
}

vm_db_config = {
  db = {
    zone               = "ru-central1-b"
    name               = "netology-develop-platform-db"
    platform_id        = "standard-v1"
    cores              = 2
    memory             = 2
    core_fraction      = 20
    preemptible        = true
    serial_port_enable = true
    disk_type          = "network-hdd"
    nat_enabled        = true
  }
}
