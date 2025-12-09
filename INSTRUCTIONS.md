# Instructions pour le correcteur

## Démarrage rapide

### Prérequis
- Docker 20.10+
- Docker Compose 2.0+

### Lancer l'application

```bash
cd voting-app
docker-compose up -d
```

### Accès

- Vote : http://localhost:8080
- Result : http://localhost:8888

### Arrêter

```bash
docker-compose down
```

## Fichiers importants

- vote/Dockerfile : Application Python
- worker/Dockerfile : Service .NET
- result/Dockerfile : Application Node.js
- docker-compose.yml : Orchestration
- docker-compose.swarm.yml : Version Swarm
- README.md : Guide d'utilisation
- DEPLOYMENT.md : Guide Swarm

## Modifications du code

- vote/app.py : Variable REDIS_HOST
- worker/Program.cs : Variables Redis et PostgreSQL
- result/server.js : Variables PostgreSQL

## Tests

```bash
docker-compose build
docker-compose up -d
docker-compose ps
curl http://localhost:8080
curl http://localhost:8888
```

## Docker Swarm

Voir DEPLOYMENT.md pour le guide complet.

Commandes principales :

```bash
docker swarm init --advertise-addr <IP>
docker build -t voting-vote:latest ./vote
docker build -t voting-worker:latest ./worker
docker build -t voting-result:latest ./result
docker stack deploy -c docker-compose.swarm.yml voting
```

## Auteur

Styxzee (Guyomardkylian@gmail.com)
