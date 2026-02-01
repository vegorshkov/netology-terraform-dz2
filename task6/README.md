Задание 6

Так как в terraform.tfvars я уже описал переменные (на первых заданиях), и в файле не содержиться конфиденциальных данных,
исключаю его из .gitignore и закидываю на githab.

Использовал в лабе     platform_id        = "standard-v1"  #  legasy v1  заменен на v2

yandex_compute_instance.db must be replaced
-/+ resource "yandex_compute_instance" "db" {
      ~ created_at                = "2026-02-01T13:39:37Z" -> (known after apply)
      ~ folder_id                 = "b1g883r36u9293g7u1gc" -> (known after apply)
      ~ fqdn                      = "epd3ug39rvr3tg2eap5k.auto.internal" -> (known after apply)
      + gpu_cluster_id            = (known after apply)
      ~ hardware_generation       = [
          - {
              - generation2_features = []
              - legacy_features      = [
                  - {
                      - pci_topology = "PCI_TOPOLOGY_V2"
                    },
                ]
            },
        ] -> (known after apply)
