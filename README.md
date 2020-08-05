# Презентация http://mironenko.github.io/rutoken-letoctf-2020

# VM: 

# Начало работы

1. Скачать образ гостевой машины.
2. Импортировать образ гостевой машины в средство виртуализации (VMWare Workstation/VMWare Player/VirtualBox).
3. Настроить сетевое соединение (при использовании Wi-Fi, скорее всего, будет работать NAT, не будет работать bridged) и проброс USB-устройств.
4. Запустить гостевую машину.
5. Использовать учетные данные **debian:debian**.
6. Убедиться, что считыватель смарт-карт успешно пробрасывается в гостевую машину (после проброса вывод команды `lsusb` показывает на одно подключенное устройство больше, `lsusb | grep 3437:08e6 || echo FAILED`).
7. Убедиться, что сетевое соединение работает. (`ping -c 2 8.8.8.8 || echo FAILED`).

# Настройка VirtualBox

1. Используем (устанавливаем) современный VirtualBox (например, 6.1.12) https://www.virtualbox.org/wiki/Downloads
2. Устанавливаем соответствующий версии VirtualBox Extension Pack (например, https://download.virtualbox.org/virtualbox/6.1.12/Oracle_VM_VirtualBox_Extension_Pack-6.1.12.vbox-extpack)
3. Импортируем гостевую машину.
	* Import Appliance: Downloads/Debian_10.1.0_letoctf.ova
	* Name: Debian_10.1.0_letoctf
4. Настраиваем сеть и USB: 
Machine -> Settings: 
	* Network: NAT
	* Network -> Port Forwarding: Host 2222 to Guest 22 (позволит обращаться по ssh: `ssh debian@127.0.0.1 -p2222`)
	* Ports -> USB: USB 3.0
5. Сделать снэпшот "Clean".
6. Запустить, проверить проброс считывателя смарт-карт и доступность интернета из гостевой машины.

# Troubleshooting

* Если в ноутбуке единственный порт, и тот USB-C, придется искать хаб/док-станцию.
* USB troubleshooting: проверить, что USB-контроллер присутствует в настройках ВМ, попробовать различные версии USB.
* Network troubleshooting: попробовать NAT и bridged.
* При импорте в VMWare Workstation может возникнуть сообщение о несоответствии спецификации OVF. Импорт проиcходит успешно при выборе "Relax".
