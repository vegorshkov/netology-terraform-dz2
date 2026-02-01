Выполнено создание output для вывода ip и instance_name, external_ip, fqdn для каждой из ВМ

Ответы предоставлены на Print Screens в Task4


[vgorshkov@gid-000455 src]$ terraform output
vm_instances = {
  "vm_db" = {
    "external_ip" = "89.169.182.73"
    "fqdn" = "epd3ug39rvr3tg2eap5k.auto.internal"
    "name" = "netology-develop-platform-db"
  }
  "vm_web" = {
    "external_ip" = "178.154.227.4"
    "fqdn" = "fhmlil0s8itq7qgc0koa.auto.internal"
    "name" = "netology-develop-platform-web"
  }
}


