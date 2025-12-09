# Application de Vote Distribuée

Application de vote permettant de choisir entre deux options. Les résultats sont affichés en temps réel.

## Architecture

5 services :
- vote : Application web Python pour voter
- result : Application web Node.js pour voir les résultats
- worker : Service .NET qui traite les votes
- redis : File de messages
- db : Base de données PostgreSQL

## Prérequis

- Docker (20.10+)
- Docker Compose (2.0+)

## Démarrage

```bash
cd voting-app
docker-compose up -d
```

## Accès aux applications

- Vote : http://localhost:8080
- Result : http://localhost:8888

## Commandes utiles

```bash
# Voir l'état
docker-compose ps

# Voir les logs
docker-compose logs -f

# Arrêter
docker-compose down

# Arrêter et supprimer les données
docker-compose down -v
```

## Modifications apportées

Le code a été modifié pour utiliser des variables d'environnement :
- vote/app.py : REDIS_HOST
- worker/Program.cs : REDIS_HOST, DB_HOST, DB_USER, DB_PASSWORD, DB_NAME
- result/server.js : DB_HOST, DB_USER, DB_PASSWORD, DB_NAME

## Technologies

- Python 3.11
- Node.js 18
- .NET Core 7.0
- Redis 7
- PostgreSQL 15