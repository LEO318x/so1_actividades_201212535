### Actividad 4
Creamos nuestro script para nuestro servicio
```
#!/bin/bash

now=$(date)
echo "Hola, que gran día hace el día de hoy ^^"
echo "$now"
```

Creamos nuestro servicio
```
sudo /etc/systemd/system/actividad4.service
```
Abrimos nuestro servicio con nano y escribimos lo siguiente:
```
[Unit]
Description=Actividad 4
After=systend-user-sessions.service

[Service]
Type=simple
ExecStart=/home/ldev/Documentos/sopes/actividad4.sh
```

Ejecutamos nuestro servicio
```
sudo systemctl start actividad4.service
```

Para ver el estado de nuestro servicio
```
systemctl status actividad4
```

Para ver el historial de nuestro servicio
```
journalctl -u actividad4 -e
```
