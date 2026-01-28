Второе домашнее задание по терраформ.

Задача 1:

1. Файл variables.tf изучен.
2. Создаю новый сервисный аккаунт  https://console.yandex.cloud/folders/b1XXXXgc/iam/service-accounts
3. генерирую новый ключ
        pub часть  'ssh-ed25519 AAXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'

4. при алидации проекта обнаружена ошибка:
        ```
        Error: Invalid function argument
        │ 
        │   on providers.tf line 15, in provider "yandex":
        │   15:   service_account_key_file = file("~/.authorized_key.json")
        │     ├────────────────
        │     │ while calling file(path)
        │ 
        │ Invalid value for "path" parameter: no file exists at "~/.authorized_key.json"; this function works only with files that are
        │ distributed as part of the configuration source code, so if this file will be created by a resource in this configuration you
        │ must instead obtain this result from an attribute of that resource.

        ```
FIX:   ошибка при обращении к файлу - он не был создан. вторая ошибка использование пути ~/.authorized...  подсказка - посимвольно.  путь `~` -  не разворачивается в терраформе.

        ````

        │ Error: Error while requesting API to create network: client-request-id = ccfd3da2-1054-49d7-b4bd-ab011fb1b78a client-trace-id = 0fd4f568-15c4-469d-ac75-d405c9621cfc rpc error: code = ResourceExhausted desc = Quota limit vpc.networks.count exceeded
        │ 
        │   with yandex_vpc_network.develop,
        │   on main.tf line 1, in resource "yandex_vpc_network" "develop":
        │    1: resource "yandex_vpc_network" "develop" {
│ 
        ````
FIX:    ошибка проговаривалась на лекции - это квоты на создание сетей
решение:  уменьшить кол-во сетей, методом удаления
[vgorshkov@gid-000455 src]$ yc vpc subnet delete e9bnsqoi797ji5jdstuf
[vgorshkov@gid-000455 src]$ yc vpc network delete enp4kfssndmv204j7bj0

        `````
        В main.tf  ошбки при описании платформы

        resource "yandex_compute_instance" "platform" {
        name        = "netology-develop-platform-web"
        platform_id = "standart-v4"

        приводит к следующему:

        with provider["registry.terraform.io/yandex-cloud/yandex"],
        │   on providers.tf line 10, in provider "yandex":
        │   10: provider "yandex" {
        │ 
        ╵
        ╷
        │ Error: Error while requesting API to create instance: client-request-id = 99e1c7cf-7379-477a-8f83-92a701fcda69 client-trace-id = b275ad4f-d034-4787-bb60-54df979e6700 rpc error: code = FailedPrecondition desc = Platform "standart-v4" not found
        │ 
        │   with yandex_compute_instance.platform,
        │   on main.tf line 15, in resource "yandex_compute_instance" "platform":
        │   15: resource "yandex_compute_instance" "platform" {
        │ 


        `````
FIX   это идентификатор аппаратной платформы в яндексе (например в примере из документации сказано что для создания виртульной машины нужно указать standart-v3), идем в первоисточник и смотрим  https://yandex.cloud/ru/docs/compute/concepts/vm-platforms  

используем "минимальный вариант" standart-v1  (кстати нашел каклькулятор для рассчета стоимости ресурсов)

нда, еще опечатка в наименовании standard, t-на конце не правильно, нет такого слова в английском словаре :-) и в соответствующей документации: "Intel Broadwell
(standard-v1)	Intel® Xeon® Processor E5-2660 v4	32	2.00"


            ``````
            ╵
            ╷
            │ Error: Error while requesting API to create instance: client-request-id = 3249ac07-fdf6-4507-ad1f-e03abfe98827 client-trace-id = d7385a86-f966-4b6b-82ba-1a14ff1cab8f rpc error: code = InvalidArgument desc = the specified number of cores is not available on platform "standard-v1"; allowed core number: 2, 4
            │ 
            │   with yandex_compute_instance.platform,
            │   on main.tf line 15, in resource "yandex_compute_instance" "platform":
            │   15: resource "yandex_compute_instance" "platform" {
            │ 
            ╵

            ``````

FIX  ресурс меняю на 2 cpu (cores         = 2), предполагаю с memory тоже будет error


Ответ на вопрос №6: "...могут ли пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ"?

Да, первый параметр говорит о том что машина должна быть прерываемой (это уже примерно -50% стоимости машины), то есть по истечении времени бездействия (отсутствия загруженности или операций ввода\вывод) виртуальная машина выключается автоматически освобождая ресурсы серверов.
Второй параметр - использование CPU  5%  самый нижний параметр, по стоимости не далеко ушел от 20% (рекомендовано использовать 20%). 

Вот ответ из документации: "Гарантированная доля vCPU, которая будет выделена ВМ. ВМ с гарантированной долей меньше 100% обеспечивают указанный уровень производительности с вероятностью временного повышения вплоть до 100%. Такие ВМ подходят для задач, которые не требуют постоянной гарантии производительности vCPU на 100%."

