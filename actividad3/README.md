# ACTIVIDAD 3

---

#Author: Morales Tomas.

### Se nos presenta una serie de instrucciones las cuales se van a resolver utilizando “WSL” (Windows Subsystem Linux).

## **Parte 1: Gestión de Usuarios**

1. **Creación de Usuarios**: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.

```bash
Morales@Morales:~$ sudo adduser usuario1
[sudo] password for Morales:
Adding user `usuario1' ...
Adding new group `usuario1' (1002) ...
Adding new user `usuario1' (1001) with group `usuario1' ...
Creating home directory `/home/usuario1' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for usuario1
Enter the new value, or press ENTER for the default
        Full Name []: usuario1
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y
```

2. **Asignación de Contraseñas**: Establece una nueva contraseñas para cada usuario creado.

```bash
Morales@Morales:~$ sudo passwd usuario1
New password:
Retype new password:
passwd: password updated successfully
```

3. **Información de Usuarios**: Muestra la información de `usuario1` usando el comando `id`.

```bash
Morales@Morales:~$ id usuario1
uid=1001(usuario1) gid=1002(usuario1) groups=1002(usuario1)
```

4. **Eliminación de Usuarios**: Elimina `usuario3`, pero conserva su directorio principal.

```bash
Morales@Morales:/home$ sudo deluser --remove-home usuario3
Looking for files to backup/remove ...
Removing files ...
Removing user `usuario3' ...
Warning: group `usuario3' has no more members.
Done.

Morales@Morales:/home$ ls
Morales  usuario1  usuario2
```

---

### **Parte 2: Gestión de Grupos**

1. **Creación de Grupos**: Crea dos grupos llamados `grupo1` y `grupo2`.

```bash
Morales@Morales:~$ sudo addgroup grupo1
Adding group `grupo1' (GID 1004) ...
Done.
Morales@Morales:~$ sudo addgroup grupo2
Adding group `grupo2' (GID 1005) ...
Done.
```

2. **Agregar Usuarios a Grupos**: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.

```bash
Morales@Morales:~$ sudo adduser usuario1 grupo1
Adding user `usuario1' to group `grupo1' ...
Adding user usuario1 to group grupo1
Done.
Morales@Morales:~$ sudo adduser usuario2 grupo2
Adding user `usuario2' to group `grupo2' ...
Adding user usuario2 to group grupo2
Done.
```

3. **Verificar Membresía**: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

```bash
Morales@Morales:~$ groups usuario1
usuario1 : usuario1 grupo1
Morales@Morales:~$ groups usuario2
usuario2 : usuario2 grupo2
```

4. **Eliminar Grupo**: Elimina `grupo2`.

```bash
Morales@Morales:~$ sudo delgroup grupo2
Removing group `grupo2' ...
Done.
```

---

### **Parte 3: Gestión de Permisos**

1. **Creación de Archivos y Directorios**:

- Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
- Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.
    
    ```bash
    usuario1@Morales:~$ ls
    usuario1@Morales:~$ pwd
    /home/usuario1
    usuario1@Morales:~$ echo "Morales Tomas" > archivo1.txt
    usuario1@Morales:~$ ls
    archivo1.txt
    usuario1@Morales:~$ mkdir directorio1
    usuario1@Morales:~$ cd directorio1/
    usuario1@Morales:~/directorio1$ echo "Morales Tomas" > archivo2.txt
    usuario1@Morales:~/directorio1$ ls
    archivo2.txt
    ```
    

2. **Verificar Permisos**: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.

```bash
usuario1@Morales:~/directorio1$ cd
usuario1@Morales:~$ ls -l archivo1.txt
-rw-rw-r-- 1 usuario1 usuario1 14 Aug  9 18:03 archivo1.txt
usuario1@Morales:~$ ls -ld directorio1
drwxrwxr-x 2 usuario1 usuario1 4096 Aug  9 18:03 directorio1
```

3. **Modificar Permisos usando `chmod` con Modo Numérico**: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

```bash
usuario1@Morales:~$ pwd
/home/usuario1
usuario1@Morales:~$ ls
archivo1.txt  directorio1
usuario1@Morales:~$ chmod 640 archivo1.txt
usuario1@Morales:~$ ls -l archivo1.txt
-rw-r----- 1 usuario1 usuario1 14 Aug  9 18:03 archivo1.txt
usuario1@Morales:~$
```

4. **Modificar Permisos usando `chmod` con Modo Simbólico**: Agrega permiso de ejecución al propietario del `archivo2.txt`.

```bash
usuario1@Morales:~$ cd directorio1/
usuario1@Morales:~/directorio1$ chmod u+x archivo2.txt
usuario1@Morales:~/directorio1$ ls -l archivo2.txt
-rwxrw-r-- 1 usuario1 usuario1 14 Aug  9 18:03 archivo2.txt
usuario1@Morales:~/directorio1$
```

5. **Cambiar el Grupo Propietario**: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.

```bash
Morales@Morales:~$ su usuario1
Password:
usuario1@Morales:/home/Morales$ cd
usuario1@Morales:~$ pwd
/home/usuario1
usuario1@Morales:~$ cd directorio1/
usuario1@Morales:~/directorio1$ sudo chown :grupo1 archivo2.txt
[sudo] password for usuario1:
usuario1@Morales:~/directorio1$ ls -l archivo2.txt
-rwxrw-r-- 1 usuario1 grupo1 14 Aug  9 18:03 archivo2.txt
```

6. **Configurar Permisos de Directorio**: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

```bash
usuario1@Morales:~/directorio1$ cd
usuario1@Morales:~$ ls
archivo1.txt  directorio1
usuario1@Morales:~$ chmod 750 directorio1
usuario1@Morales:~$ ls -ld directorio1
drwxr-x--- 2 usuario1 usuario1 4096 Aug  9 18:03 directorio1
usuario1@Morales:~$
```

7. **Comprobación de Acceso**: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

```bash
usuario1@Morales:~$ su usuario2
Password:
usuario2@Morales:/home/usuario1$ ls
ls: cannot open directory '.': Permission denied
usuario2@Morales:/home/usuario1$ cat directorio1/archivo2.txt
cat: directorio1/archivo2.txt: Permission denied
```

8. **Verificación Final**: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

```bash
usuario1@Morales:~$ ls -l archivo1.txt
-rw-r----- 1 usuario1 usuario1 14 Aug  9 18:03 archivo1.txt
usuario1@Morales:~$ ls -ld directorio1
drwxr-x--- 2 usuario1 usuario1 4096 Aug  9 18:03 directorio1
usuario1@Morales:~$ cd directorio1/
usuario1@Morales:~/directorio1$ ls -l archivo2.txt
-rwxrw-r-- 1 usuario1 grupo1 14 Aug  9 18:03 archivo2.txt
usuario1@Morales:~/directorio1$
```

---

### **Reflexión: (Opcional)**

Contestar las siguientes preguntas:

- ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
    
    ```bash
    Gestionar usuarios y permisos adecuadamente protege los datos y recursos. Evita acceso no autorizado,
    garantiza privacidad y previene cambios accidentales o maliciosos en archivos y configuraciones del sistema.
    ```
    

- ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?
    
    ```bash
    Por ahora solo los utilizados para esta actividad.
    ```