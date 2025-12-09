.PHONY: help build up down logs clean restart ps test swarm-deploy swarm-remove

help: ## Affiche l'aide
	@echo "Commandes disponibles :"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

build: ## Construire les images Docker
	docker-compose build

up: ## Démarrer l'application
	docker-compose up -d

down: ## Arrêter l'application
	docker-compose down

logs: ## Afficher les logs
	docker-compose logs -f

clean: ## Supprimer les conteneurs, réseaux et volumes
	docker-compose down -v
	docker system prune -f

restart: ## Redémarrer l'application
	docker-compose restart

ps: ## Afficher l'état des services
	docker-compose ps

test: ## Tester que l'application fonctionne
	@echo "Test de l'application de vote..."
	@curl -f http://localhost:5000 > /dev/null 2>&1 && echo "✓ Vote app OK" || echo "✗ Vote app FAILED"
	@echo "Test de l'application de résultats..."
	@curl -f http://localhost:5001 > /dev/null 2>&1 && echo "✓ Result app OK" || echo "✗ Result app FAILED"

swarm-build: ## Construire les images pour Swarm
	docker build -t voting-vote:latest ./vote
	docker build -t voting-worker:latest ./worker
	docker build -t voting-result:latest ./result

swarm-deploy: ## Déployer sur Docker Swarm
	docker stack deploy -c docker-compose.swarm.yml voting

swarm-remove: ## Supprimer la stack Swarm
	docker stack rm voting

swarm-ps: ## Afficher les services Swarm
	docker stack ps voting

swarm-services: ## Afficher les services Swarm
	docker stack services voting
