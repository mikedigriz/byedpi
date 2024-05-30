#!/bin/bash

# Включение и выключение byedpi для curl и wget подобных, поддерживающих переменные
# Сохранить в /usr/local/bin/dpi или ln -s /home/$USER/git/byedpi/dpi.sh /usr/local/bin/dpi

# Иметь скомпилированный бинарник по пути /home/"$USER"/git/byedpi/ciadpi
# Открыть терминал и запустить dpi. Для завершения нажать ctrl + c


echo byedpi запущен
echo прокси ВКЛ
export all_proxy=socks5://127.0.0.1:1080

function disable_proxy() {
    unset all_proxy
    exit 1
}

# Отлавливаем нажатие ctrl + c и вызываем функцию выключения прокси
trap 'disable_proxy' SIGINT

while true; do
    /home/"$USER"/git/byedpi/ciadpi --disorder 3 --auto --split 1 --ip 127.0.0.1 --port 1080 
   # /home/"$USER"/git/byedpi/ciadpi --hosts list.txt --disorder 3 --auto=none --split 1 --ip 127.0.0.1 --port 1080 
done
