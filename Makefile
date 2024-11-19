# Variables
DOCKER_COMPOSE = docker-compose
CYAN = \033[0;36m
GREEN = \033[0;32m
YELLOW = \033[0;33m
NC = \033[0m # No Color

.PHONY: help dev docker-* clean test-*

# Default target
help:
	@echo "${CYAN}Available commands:${NC}"
	@echo "${GREEN}make dev${NC}                - Start development environment with Docker"
	@echo "${GREEN}make docker-up${NC}          - Start all containers"
	@echo "${GREEN}make docker-down${NC}        - Stop and remove all containers"
	@echo "${GREEN}make docker-build${NC}       - Build all Docker images"
	@echo "${GREEN}make docker-logs${NC}        - Show logs from all containers"
	@echo "${GREEN}make docker-logs-fe${NC}     - Show frontend container logs"
	@echo "${GREEN}make docker-logs-be${NC}     - Show backend container logs"
	@echo "${GREEN}make docker-shell-fe${NC}    - Open shell in frontend container"
	@echo "${GREEN}make docker-shell-be${NC}    - Open shell in backend container"
	@echo "${GREEN}make clean${NC}              - Clean all build artifacts"
	@echo "${GREEN}make test${NC}               - Run all tests"

# Development mode
dev: docker-up

# Docker commands
docker-up:
	@echo "${YELLOW}Starting development environment...${NC}"
	$(DOCKER_COMPOSE) up --build -d
	@echo "${GREEN}Services are starting...${NC}"
	@echo "${GREEN}Frontend: http://localhost:3000${NC}"
	@echo "${GREEN}Backend: http://localhost:8080${NC}"

docker-down:
	@echo "${YELLOW}Stopping development environment...${NC}"
	$(DOCKER_COMPOSE) down

docker-build:
	@echo "${YELLOW}Building Docker images...${NC}"
	$(DOCKER_COMPOSE) build --no-cache

docker-logs:
	@echo "${YELLOW}Showing logs from all containers...${NC}"
	$(DOCKER_COMPOSE) logs -f

docker-logs-fe:
	@echo "${YELLOW}Showing frontend logs...${NC}"
	$(DOCKER_COMPOSE) logs -f frontend

docker-logs-be:
	@echo "${YELLOW}Showing backend logs...${NC}"
	$(DOCKER_COMPOSE) logs -f backend

docker-shell-fe:
	@echo "${YELLOW}Opening shell in frontend container...${NC}"
	$(DOCKER_COMPOSE) exec frontend sh

docker-shell-be:
	@echo "${YELLOW}Opening shell in backend container...${NC}"
	$(DOCKER_COMPOSE) exec backend bash

docker-restart:
	@echo "${YELLOW}Restarting all containers...${NC}"
	$(DOCKER_COMPOSE) restart

docker-rebuild: docker-down docker-build docker-up
	@echo "${GREEN}Environment rebuilt and restarted${NC}"

# Clean build artifacts
clean:
	@echo "${YELLOW}Cleaning build artifacts...${NC}"
	$(DOCKER_COMPOSE) down -v
	rm -rf front-end/build front-end/node_modules
	rm -rf back-end/target	

# Test commands
test-fe:
	@echo "${YELLOW}Running frontend tests...${NC}"
	$(DOCKER_COMPOSE) exec frontend npm test

test-be:
	@echo "${YELLOW}Running backend tests...${NC}"
	$(DOCKER_COMPOSE) exec backend ./mvnw test

test: test-fe test-be
	@echo "${GREEN}All tests completed${NC}"

# Database commands
db-migrate:
	@echo "${YELLOW}Running database migrations...${NC}"
	$(DOCKER_COMPOSE) exec backend ./mvnw flyway:migrate

db-reset:
	@echo "${YELLOW}Resetting database...${NC}"
	$(DOCKER_COMPOSE) down -v db
	$(DOCKER_COMPOSE) up -d db

# Development utilities
watch-fe:
	@echo "${YELLOW}Watching frontend changes...${NC}"
	$(DOCKER_COMPOSE) logs -f frontend

watch-be:
	@echo "${YELLOW}Watching backend changes...${NC}"
	$(DOCKER_COMPOSE) logs -f backend