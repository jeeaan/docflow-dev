#!/bin/bash

# Limpando docker
echo "🗑️ Removendo containers e imagens..."
# Parar e remover containers com 'docflow' no nome
sudo docker ps -a --filter "name=docflow" -q | xargs -r sudo docker stop
sudo docker ps -a --filter "name=docflow" -q | xargs -r sudo docker rm
# Remover imagens que contenham 'docflow' no nome
sudo docker images --filter "reference=*docflow*" -q | xargs -r sudo docker rmi -f
# Remover volumes associados ao 'docflow'
sudo docker volume ls --filter "name=docflow" -q | xargs -r sudo docker volume rm
# Remover redes associadas ao 'docflow'
sudo docker network ls --filter "name=docflow" -q | xargs -r sudo docker network rm

# Apagar os diretórios especificados
echo "🗑️ Removendo os diretórios especificados..."

sudo rm -rf postgres_data
DIR="thoth-api"
# Entrar no diretório
cd "$DIR" || exit
# Encontrar e deletar o diretório 'target' em todas as subpastas
find . -type d -name 'target' -exec rm -rf {} + 
cd ..

# Construir e rodar os containers Docker
echo "🐋 Iniciando build e containers com Docker Compose..."
sudo docker-compose up -d --build

# Verificar se o comando foi bem-sucedido
if [ $? -eq 0 ]; then
  echo "✅ Build e inicialização dos containers concluídos com sucesso!"
else
  echo "❌ Ocorreu um erro durante o build ou inicialização dos containers."
  exit 1
fi
