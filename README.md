# netology-terraform-dz2
Домашнее задание "Основы работы с Terraform"
Задание 1
В качестве решения приложена информация:
скриншот ЛК:
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task1/%60%D0%9E%D1%82%D0%B2%D0%B5%D1%82_%D1%80%D0%B5%D1%88%D0%B5%D0%BD%D0%B8%D1%8F.png
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task1/Console.png
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task1/Console1.png


скриншот консоли:
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task1/1.5%20curl%20config%20command-1.png


Ответы:
https://github.com/vegorshkov/netology-terraform-dz2/tree/main/task1#readme
и скриншоты с нумерацией: https://github.com/vegorshkov/netology-terraform-dz2/tree/main/task1

Задание 2

Ответ, заведен файл автоматического указания переменных, в стандартных variables.tf прописаны типы переменных,  в main.tf указаны сами переменные. 
В самом  файле terraform.tfvars  указаны значения, и файл добавлен в  .gitignore

При проходе terraform apply  изменений  не обнаружено.

Принтскрины предоставлены:  
https://github.com/vegorshkov/netology-terraform-dz2/tree/main/task2
Ответ:  https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task2/2.3%20Terraform%20Plan%20-%2001.png  

Задание 3
https://github.com/vegorshkov/netology-terraform-dz2/tree/main/task3#readme

Задание 4
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task4/create_outputs-04.png

Задание 5
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task5/README.md

Задание 6
https://github.com/vegorshkov/netology-terraform-dz2/blob/main/task6/README.md

Задание 7 *
Ответы:
1.  > local.test_list[1]
"staging"

2. > length(local.test_list)
3

3.  > local.test_map["admin"]
"John"
>  

4. > "${local.test_map["admin"]} is admin for ${local.test_list[2]} servers based on OS ${local.servers[local.test_list[2]].image} with ${local.servers[local.test_list[2]].cpu} vcpu,  ${local.servers[local.test_list[2]].ram} ram and ${length(local.servers[local.test_list[2]].disks)} virtual disks"
"John is admin for production servers based on OS ubuntu-20-04 with 10 vcpu,  40 ram and 4 virtual disks"

Задача 8 *
Все принтскрины ответов представлены в разделе task8

Задача 9 *
Создам несколько tf файлов, для определения настройки самого роутера и настройки сетей с маршрутизацией.
Протестирую source и destination nat через роутер.
До перенастройки обе машины имеют внешние ip и по внутренним сетям 10.0.1.x/24 и 10.0.2.x/24 видят нормально друг-друга.

(Для подключения предварительно через ssh измените пароль пользователя: sudo passwd ubuntu - сменим пароль)

Проверил сетевую доступность, все работает. Принтскрины пронумерованы по порядку, приложил.
в src  создан файл с новыми сетевыми настройками:  net-gw-01-lan.tf  

