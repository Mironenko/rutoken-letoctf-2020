# Подготовка образа

1. Образ из https://www.linuxvmimages.com/images/debian-10/
https://sourceforge.net/projects/linuxvmimages/files/VirtualBox/D/10/Debian_10.1.0_VB.zip/download

2. Используем VirtualBox >= 6.0.22 https://www.virtualbox.org/wiki/Downloads или https://www.virtualbox.org/wiki/Download_Old_Builds_6_0
3. Устанавливаем соответствующий VirtualBox Extension Pack https://download.virtualbox.org/virtualbox/6.0.22/Oracle_VM_VirtualBox_Extension_Pack-6.0.22.vbox-extpack
4. Import Appliance: Downloads/Debian_10.1.0_VirtualBox_Image_LinuxVMImages/Debian_10.1.0_VirtualBox_Image_LinuxVMImages.ovf
Name: Debian_10.1.0_letoctf
5. Machine->Settings: 
	* Network: NAT
	* Network -> Port Forwarding: Host 2222 to Guest 22
	* Ports -> USB: USB 3.0
6. Take snapshot "Clean"
7. Start. Creds debian:debian
8. `ssh debian@127.0.0.1 -p2222`
9. 

```
scp -r -P 2222 workshop debian@127.0.0.1:~/
scp -r -P 2222 presentation debian@127.0.0.1:~/workshop/.presentation
```
10. Over ssh:

```
cd ~/workshop/prepare-vm/
sudo bash ./prepare.sh
sudo shutdown now
```
11. Take snapshot "Letoctf"
12. Check everything works.
13. Revert to snapshot "Letoctf"
14. Export appliance... Debian_10.1.0_VirtualBox_Image_LinuxVMImages_letoctf.ovf