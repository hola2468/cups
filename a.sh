#!/bin/bash

# Función para mostrar los datos de red del equipo
mostrar_datos_de_red() {
    echo "Datos de red del equipo:"
    ifconfig
}

# Función para mostrar el estado del servicio CUPS
mostrar_estado_del_servicio() {
    echo "Estado del servicio CUPS:"
    systemctl status cups
}

# Función para instalar el servicio CUPS
instalar_con_comandos() {
    echo "Instalando el servicio CUPS con comandos..."
    # Inserta aquí los comandos necesarios para instalar CUPS
    sudo apt install cups
    sudo systemctl restart cups


}

instalar_con_ansible() {
    echo "Instalando el servicio CUPS con Ansible..."
    # Inserta aquí los comandos necesarios para instalar CUPS con Ansible
}

instalar_con_docker() {
    echo "Instalando el servicio CUPS con Docker..."
    # Inserta aquí los comandos necesarios para instalar CUPS con Docker
    cd cupsd
    docker run -p 631:631 cupsd #antes tenia -d


}

# Función para eliminar el servicio CUPS
eliminar_servicio() {
    echo "Eliminando el servicio CUPS..."
    # Inserta aquí los comandos necesarios para eliminar CUPS
    sudo systemctl stop cups
    sudo apt remove --purge cups
    sudo apt autoclean


}

# Función para iniciar el servicio CUPS
iniciar_servicio() {
    echo "Iniciando el servicio CUPS..."
    systemctl start cups
}

# Función para detener el servicio CUPS
detener_servicio() {
    echo "Deteniendo el servicio CUPS..."
    systemctl stop cups
}

# Función para editar las opciones de configuración del servicio CUPS
editar_configuracion() {
    echo "Editando las opciones de configuración del servicio CUPS..."
    # Inserta aquí los comandos necesarios para editar la configuración de CUPS
    cd /etc/cups/
    sudo nano cupsd.conf

}

# Mostrar menú de opciones
mostrar_menu() {
    echo "Menú de acciones:"
    echo "1. Mostrar datos de red del equipo"
    echo "2. Mostrar estado del servicio CUPS"
    echo "3. Instalar el servicio CUPS con comandos"
    echo "4. Instalar el servicio CUPS con Ansible"
    echo "5. Instalar el servicio CUPS con Docker"
    echo "6. Eliminar el servicio CUPS"
    echo "7. Iniciar el servicio CUPS"
    echo "8. Detener el servicio CUPS"
    echo "9. Editar opciones de configuración del servicio CUPS"
    echo "10. Salir"
}

# Ejecutar acciones basadas en la opción seleccionada por el usuario
while true; do
    mostrar_menu
    read -p "Seleccione una opción: " opcion
    case $opcion in
        1) mostrar_datos_de_red ;;
        2) mostrar_estado_del_servicio ;;
        3) instalar_con_comandos ;;
        4) instalar_con_ansible ;;
        5) instalar_con_docker ;;
        6) eliminar_servicio ;;
        7) iniciar_servicio ;;
        8) detener_servicio ;;
        9) editar_configuracion ;;
        10) echo "Saliendo..."; exit ;;
        *) echo "Opción inválida. Por favor, seleccione una opción válida." ;;
    esac
done
