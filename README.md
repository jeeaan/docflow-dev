# Instruções para Rodar o Projeto

### Passo 1: Baixar o Projeto

Baixe o projeto `thoth-api` para a raiz do seu diretório de trabalho. A estrutura do seu projeto deve ser semelhante a esta:

/<root_project_directory> ├── thoth-api └── docker-compose.yml


### Passo 2: Rodar o Docker Compose

Com o `docker-compose.yml` configurado e o projeto `thoth-api` baixado, execute o comando abaixo para iniciar os containers e baixar as dependências necessárias:

```bash
docker-compose up

Passo 3: Aguardar o Download das Dependências

O Docker irá baixar as imagens necessárias, configurar os containers e baixar as dependências do Maven para o projeto. Este processo pode levar algum tempo dependendo da sua conexão com a internet e do tamanho das dependências.
Passo 4: Acessar a Aplicação

Após o Docker ter baixado todas as dependências e iniciado os containers, acesse a aplicação no seu navegador em:

http://localhost:8080/docflow

Agora, você pode interagir com a aplicação via a interface web em localhost:8080/docflow.
