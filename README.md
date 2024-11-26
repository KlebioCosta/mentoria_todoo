# Aplicativo Todo

Uma aplicação full-stack com frontend em React e backend em Spring Boot.

## Requisitos

- Docker e Docker Compose
- Make

## Configuração do Ambiente Local

1. Configure as variáveis de ambiente (se necessário):
   ```bash
   # Para implantação em QA
   export QA_DB_USERNAME=seu_usuario
   export QA_DB_PASSWORD=sua_senha
   
   # Para implantação em Produção
   export PROD_DB_USERNAME=seu_usuario
   export PROD_DB_PASSWORD=sua_senha
   ```

2. Inicie o ambiente de desenvolvimento:
   ```bash
   make dev
   ```
   Isso irá construir e iniciar todos os containers no modo de desenvolvimento.

## Serviços Disponíveis

- Frontend: http://localhost:3000
- API Backend: http://localhost:8080
- Banco de Dados: PostgreSQL rodando na porta 5432

## Comandos Úteis

### Desenvolvimento
- `make help` - Mostra todos os comandos disponíveis
- `make docker-logs` - Visualiza logs de todos os containers
- `make docker-logs-fe` - Visualiza apenas logs do frontend
- `make docker-logs-be` - Visualiza apenas logs do backend
- `make docker-shell-fe` - Abre shell no container do frontend
- `make docker-shell-be` - Abre shell no container do backend
- `make clean` - Limpa todos os artefatos de build
- `make test` - Executa todos os testes

### Banco de Dados
- `make db-migrate` - Executa migrações do banco de dados
- `make db-reset` - Reinicia o banco de dados

### Implantação
- `make deploy-help` - Mostra comandos de implantação
- `make deploy-dev` - Implanta em modo desenvolvimento
- `make deploy-qa` - Implanta em modo QA
- `make deploy-prod` - Implanta em modo produção
- `make deploy-stop` - Para containers de implantação
- `make deploy-clean` - Limpa artefatos de implantação

## Perfis da Aplicação

A aplicação suporta múltiplos perfis de implantação:
- Desenvolvimento (padrão): Usa PostgreSQL local
- QA: Usa servidor de banco de dados QA
- Produção: Usa servidor de banco de dados de produção

## Stack Tecnológica

- Frontend: React
- Backend: Spring Boot
- Banco de Dados: PostgreSQL
- Containerização: Docker
- Build/Deploy: Make, Maven, npm




