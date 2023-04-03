<h1 align="center">Serviço apache em instância AWS-EC2 </h1> 
Nesta atividade após assistir os cursos de AWS na Udemy proporcinados pela COMPASS.UOL foi feito um serviço apache em uma instância AWS-EC2 com o recurso EFS(armazenamento de sistema de arquivos), e assim a execução de um script que tem automação de 5 minutos para execução novamente que gera logs para o administrador do sistema verificar a saúde do servidor.

# Criação da instãncia
O sistema foi criado pela AWS Management Console com as especificações:
- Sistema operacional Amazon Linux 2
- Família t3.small
- 16 GB SSD
- 1 elastic IP e anexar à instância EC2

Chaves para acesso público liberadas:
- 22/TCP
- 111/TCP e UDP
- 2049/TCP/UDP
- 80/TCP
- 443/TCP

# Comandos nos Detalhes avançados da criação da instância
- yum update -y

atualizar todos os pacotes instalados no sistema
- yum install httpd -y

Para instalar o servidor web Apache (httpd)
- systemctl enable httpd && systemctl start httpd

Com esses dois comandos permite-se ativar o serviço do Apache para ser executado automaticamente na inicialização do sistema e iniciar o serviço imediatamente. 

# Criando um sistema de arquivos EFS na AWS
- Acessando a página de EFS deve-se clicar no botão de `Criar sistema de arquivos `, e colocar a região correta da sua instância EC2.
- Para instalar o pacote amazon-efs-utils no Amazon Linux, é necessário executar o comando 'sudo yum install amazon-efs-utils' no terminal do sistema operacional.
- Crie um diretório local no servidor NFS para montar o sistema de arquivos EFS.
- Para montar o sistema de arquivos deve-se digitar o comando `sudo mount -t efs <ID_SISTEMA_ARQUIVOS>:/ /mnt/efs`
- Por fim basta executar o comando ` df -h ` mostra o espaço em disco utilizado e disponível nos sistemas de arquivos montados no sistema operacional.

# Script de validação do serviço
No documento que esta na master tem um scritp feito em shell script, que valida se o serviço está online, assim, mostrando uma mensagem no terminal, "Serviço APACHE online". O script também envia um log para a pasta enzo no arquivo reg-online ou reg-offline se o serviço estiver offline, consequentemete mostrando a mensagem "Serviço APACHE offline" se ele estiver offline. O log enviado para os arquivos de texto contem a data da vereficação e o status do serviço.

# Execução automatizada do script a cada 5 minutos
Para fazer a execução automática do script de validação do sistema é bem simples. Basta digitar o comando:
- crontab -e

(permite que os usuários agendem a execução de tarefas em horários específicos)
Após isto basta digitar o comando:
-  */5 * * * * bash /[diretorio_que_contém_o_seu_script]/[script].sh 

O asterisco de `*/5 * * * *` indica que qualquer valor é aceito para os campos de minuto, hora, dia do mês, mês e dia da semana,
o `/5` indica que a tarefa deve ser executada a cada cinco minutos.

# Versionamento da atividade no Github
Com a execução do comando `sudo yum install git -y` ( instalar o software Git ).
Após isso inicialize o diretório como um repositório Git com o comando `git init` dentro do diretório que deseja versionar.
Depois destes passos só foi preciso usar os comandos básicos de `add,commit e push` para versionar dentro do repósitorio desejado.




