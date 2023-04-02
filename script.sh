
SERVICE_URL="http://34.206.223.181/"
SERV="$(systemctl is-active httpd)"

if [ "${SERV}" = "active" ]; then
 echo "Serviço APACHE online :) $(date +'%Y-%m-%d %H:%M:%S')" >> /path/to/mount/dir/enzo/reg-online.txt
    echo "Serviço APACHE online :) "

else
    echo "Serviço APACHE offline :("
  echo "Serviço APACHE offline :( $(date +'%Y-%m-%d %H:%M:%S')" >> /path/to/mount/dir/enzo/reg-offline.txt
fi



