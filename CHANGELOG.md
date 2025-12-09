# Changelog

## Modifications du code

### vote/app.py
- Ligne 19 : Variable d'environnement REDIS_HOST

### worker/Program.cs
- Lignes 19-28 : Variables d'environnement REDIS_HOST, DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

### result/server.js
- Lignes 25-31 : Variables d'environnement DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

### Dockerfiles
- vote/Dockerfile : Python 3.11-slim avec utilisateur non-root
- worker/Dockerfile : Multi-stage build .NET 7.0
- result/Dockerfile : Node.js 18-slim avec utilisateur node

### Fichiers .dockerignore
- vote/.dockerignore
- worker/.dockerignore
- result/.dockerignore

### Docker Compose
- docker-compose.yml : Orchestration avec réseaux et volumes
- docker-compose.swarm.yml : Version pour Docker Swarm

### Documentation
- README.md
- DEPLOYMENT.md
- CHANGELOG.md
- INSTRUCTIONS.md
- Makefile
- .env.example

## Architecture

Réseaux :
- front-tier : vote et result
- back-tier : redis, db, worker

Volumes :
- db-data : PostgreSQL
- redis-data : Redis

Ports :
- vote : 8080
- result : 8888
- redis : interne
- db : interne

Note : Port 8080 utilisé au lieu de 5000 (bloqué sur Windows)

## Technologies

- Python 3.11
- Node.js 18
- .NET Core 7.0
- Redis 7-alpine
- PostgreSQL 15-alpine

## Auteur

Styxzee (Guyomardkylian@gmail.com)
Décembre 2024
