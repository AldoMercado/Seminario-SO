#!/bin/bash

# Argumentos esperados
nombre_vm=$1
tipo_os="Linux"
version_os="Ubuntu_64"
cpus=$2
ram=$3
vram=$4
disco=$5
controlador_sata=$6
controlador_ide=$7

# Crear la VM
VBoxManage createvm --name "$nombre_vm" --ostype "$version_os" --register

# Configurar CPU, RAM y VRAM
VBoxManage modifyvm "$nombre_vm" --cpus $cpus --memory $ram --vram $vram

# Crear disco duro virtual
VBoxManage createhd --filename "$HOME/VirtualBox VMs/$nombre_vm/$nombre_vm.vdi" --size $disco

# Crear controlador SATA
VBoxManage storagectl "$nombre_vm" --name "$controlador_sata" --add sata --controller IntelAhci
VBoxManage storageattach "$nombre_vm" --storagectl "$controlador_sata" --port 0 --device 0 --type hdd --medium "$HOME/VirtualBox VMs/$nombre_vm/$nombre_vm.vdi"

# Crear controlador IDE para CD/DVD
VBoxManage storagectl "$nombre_vm" --name "$controlador_ide" --add ide
VBoxManage storageattach "$nombre_vm" --storagectl "$controlador_ide" --port 1 --device 0 --type dvddrive --medium emptydrive

# Mostrar configuración final
echo "=== CONFIGURACIÓN COMPLETA DE LA VM ==="
VBoxManage showvminfo "$nombre_vm"
