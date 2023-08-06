#!/bin/bash
# Author : MoralesTomas
# Algoritmo para la clase de sopes 2s_2023 actividad dos.

#Leer el parametro de GITHUB_USER
read -p "Ingrese el valor para GITHUB_USER: " GITHUB_USER

#Consultar el json a api de github
CONTENIDO_JSON=$(curl -s "https://api.github.com/users/$GITHUB_USER")

#Filtrar los valores del json utilizando JQ con -r para obtener los valores de los campos solicitados
id=$(echo "$CONTENIDO_JSON" | jq -r '.id')
created_at=$(echo "$CONTENIDO_JSON" | jq -r '.created_at')

#Establecer la estructura de la salida
salida="Hola $GITHUB_USER. User ID: $id. Cuenta fue creada el: $created_at."

#Estructurar la fecha para el directorio
fechaActual=$(date '+%Y%m%d')
rutaLog="/tmp/$fechaActual"

#creacion del directorio
mkdir -p "$rutaLog"

#cracion del archivo
cd $rutaLog

#crear el archivo
touch "saludos.log"

#dar permisos
chmod -R 777 "saludos.log"

#escribir la salida en el log
echo "$salida" >> "saludos.log"

#mostrar la salida 
echo "$salida"
