#!/bin/bash

# Включение и выключение byedpi в GNOME
# Сохранить в /usr/local/bin/dpi или ln -s /home/$USER/git/byedpi/dpi.sh /usr/local/bin/dpi

# Иметь скомпилированный бинарник по пути /home/"$USER"/git/byedpi/ciadpi
# Открыть терминал и запустить dpi. Для завершения нажать ctrl + c

echo byedpi запущен
echo прокси ВКЛ
gsettings set org.gnome.system.proxy mode manual
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 1080

function disable_proxy() {
    echo "" && echo "Получен сигнал: SIGINT"
    echo "Отключаем прокси и выходим"
    gsettings set org.gnome.system.proxy mode none
    gsettings set org.gnome.system.proxy.socks host ''
    gsettings set org.gnome.system.proxy.socks port 0
    exit 1
}

# Отлавливаем нажатие ctrl + c и вызываем функцию выключения прокси
trap 'disable_proxy' SIGINT

while true; do
    /home/"$USER"/git/byedpi/ciadpi --disorder 3 --auto --split 1 --ip 127.0.0.1 --port 1080 
   # /home/"$USER"/git/byedpi/ciadpi --hosts list.txt --disorder 3 --auto=none --split 1 --ip 127.0.0.1 --port 1080 
done
