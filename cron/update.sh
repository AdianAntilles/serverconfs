#!/bin/bash

source /opt/nginx/cron/.env

# Öffentliche IP ermitteln (IPv6 bevorzugt)
MY_IP=$(ip -6 addr show scope global | grep -v temporary | grep inet6 | awk '{print $2}' | cut -d'/' -f1 | grep "200*")
curl "https://login.greensta.de/ddns/update.php?zone=vihre.at.&type=AAAA&record=*.vihre.at.&data=$MY_IP&token=$password"
curl "https://login.greensta.de/ddns/update.php?zone=vihre.at.&type=AAAA&record=vihre.at.&data=$MY_IP&token=$password" 
