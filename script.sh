
SERVICE_URL="http://34.206.223.181/"


if curl --output /dev/null --silent --head --fail "$SERVICE_URL"; then
    echo "Serviço online"
else
    echo "Serviço offline"
fi



echo $(date +"%Y-%m-%d %H:%M:%S") >> $validacao/registros.txt
