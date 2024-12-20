#!/bin/bash

# Limpando docker
echo "🗑️ Removendo containers e imagens..."
sudo docker stop $(sudo docker ps -aq) && \
sudo docker rm $(sudo docker ps -aq) && \
sudo docker rmi $(sudo docker images -q) -f && \
sudo docker volume rm $(sudo docker volume ls -q) && \
sudo docker network rm $(sudo docker network ls -q)

# Apagar os diretórios especificados
echo "🗑️ Removendo os diretórios especificados..."
rm -rf thoth-api/docflow4-web/target/dependency thoth-api/docflow4-web/target/docflow thoth-api/docflow4-web/target/docflow/WEB-INF

# Verificar se os diretórios foram removidos
if [ $? -eq 0 ]; then
  echo "✅ Diretórios removidos com sucesso!"
else
  echo "❌ Falha ao remover os diretórios."
  exit 1
fi

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