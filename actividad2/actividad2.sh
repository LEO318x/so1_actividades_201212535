#!/bin/bash

echo "Ingrese el usuario de github: "
read GITHUB_USER

content=$(curl -L https://api.github.com/users/$GITHUB_USER)
user=$(echo $content | jq '.login')
userid=$(echo $content | jq '.id')
fcreacion=$(echo $content | jq '.created_at')
clear
msg=$(echo "Hola $user. User ID: $userid. Cuenta creada el: $fcreacion")
echo $msg

fecha=$(date +"%F")
mkdir -p /tmp/$fecha
echo "$msg" >> /tmp/$fecha/saludos.log
