locals {
    vm_web_name = "${var.vm_web_config["web"].name}-${var.vm_web_config["web"].zone}"
    vm_db_name  = "${var.vm_db_config["db"].name}-${var.vm_db_config["db"].zone}"
    test = "123"
}

