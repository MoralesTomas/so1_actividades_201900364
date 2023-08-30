# Actividad 4

---

Se nos solicita lo siguiente:

> SOPES_1
> 
> 
> Crear un systemd unit de tipo servicio para ejecutar un script imprima un saludo y la fecha actual.
> 
> Opcionalmente el script puede ser mas complejo para que este no termine y se quede imprimiendo hola mundo cada cierta cantidad de tiempo.
> 
> Subir un readme file explicando el proceso de instalación y uso del servicio.
> 

Resolución:

- Primero realizar el script que estaremos ejecutando.

```bash
#!/bin/bash
# Author : MoralesTomas

while true; do
    echo "Hola, mundo! La fecha actual es: $(date)"
    sleep 5  # tiempo (en segundos) 
done
```

- Segundo realizaremos la creación del archivo de unidad **systemd**, dicho archivo lo guardaremos en la siguiente ruta =/etc/systemd/system/, dentro de dicha ruta crearemos el archivo **************saludo.service**************.
El archivo contendrá lo siguiente:
    
    ```bash
    [Unit]
    Description=Script de saludo y fecha --> Morales Tomas
    
    [Service]
    ExecStart=/home/morales/Documentos/SOPES/MAGISTRAL/so1_actividades_201900364/actividad4/ScriptBash/saludo.sh
    Restart=always
    
    [Install]
    WantedBy=default.target
    ```
    
- Tercero, luego de tener ambos archivos abriremos una terminal y ejecutaremos los siguientes comandos para habilitar el servicio.
    
    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable saludo.service
    sudo systemctl start saludo.service
    ```
    
- Cuarto, dado que nuestro script puede estar ejecutandose de manera ciclica podremos observar su estado visualizando el estado del servicio con el siguiente comando.
    
    ```bash
    sudo systemctl status saludo.service
    ```
    
- Quinto, cuando queramos detener el servicio podremos utilizar el siguiente comando.
    
    ```bash
    sudo systemctl stop saludo.service
    ```
    
- Sexto, si queremos reiniciar el servicio podremos utilizar el siguiente comando.
    
    ```bash
    sudo systemctl restart saludo.service
    ```
    
- Séptimo, si en un inicio no nos funciona o nos da errores una posible solución podría ser dar permisos de ejecución al archivo .sh
Esto variara en base a la ruta de dicho archivo, el comando es el siguiente.
    
    ```bash
    chmod +x /home/morales/Documentos/SOPES/MAGISTRAL/so1_actividades_201900364/activida/saludo_script.sh
    ```
    
    ---
    
    # Salidas esperadas.
    
    Salida al visualizar el status de dicho servicio
    
    ```bash
    morales@Morales-S:~$ sudo systemctl status saludo.service
    ○ saludo.service - Script de saludo y fecha --> Morales Tomas
         Loaded: loaded (/etc/systemd/system/saludo.service; enabled; vendor preset: enabled)
         Active: inactive (dead) since Wed 2023-08-30 14:37:38 CST; 21min ago
        Process: 5060 ExecStart=/home/morales/Documentos/SOPES/MAGISTRAL/so1_actividades_201900364/actividad4/ScriptBash/saludo.sh (code=killed, si>
       Main PID: 5060 (code=killed, signal=TERM)
            CPU: 40ms
    
    ago 30 14:37:03 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:03 CST
    ago 30 14:37:08 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:08 CST
    ago 30 14:37:13 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:13 CST
    ago 30 14:37:18 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:18 CST
    ago 30 14:37:23 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:23 CST
    ago 30 14:37:28 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:28 CST
    ago 30 14:37:33 Morales-S saludo.sh[5060]: Hola, mundo! La fecha actual es: mié 30 ago 2023 14:37:33 CST
    ago 30 14:37:38 Morales-S systemd[1]: Stopping Script de saludo y fecha --> Morales Tomas...
    ago 30 14:37:38 Morales-S systemd[1]: saludo.service: Deactivated successfully.
    ago 30 14:37:38 Morales-S systemd[1]: Stopped Script de saludo y fecha --> Morales Tomas.
    lines 1-17/17 (END)
    ```
    
    ---
    
    ## NOTAS:::
    
    Todos los comandos antes mencionados tendrán que ser ejecutados en la terminal.
