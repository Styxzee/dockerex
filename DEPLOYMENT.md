# Guide de déploiement Docker Swarm

Guide pour déployer sur un cluster avec 1 manager et 2 workers.

## Prérequis

3 machines avec Docker installé et ports ouverts :
- 2377/tcp
- 7946/tcp et 7946/udp
- 4789/udp
- 8080/tcp
- 8888/tcp

## Installation Docker

Sur chaque machine :

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

## Initialiser le Swarm

Sur le Manager :

```bash
docker swarm init --advertise-addr <IP_MANAGER>
docker swarm join-token worker
```

Copier la commande affichée.

## Ajouter les Workers

Sur Worker1 et Worker2 :

```bash
docker swarm join --token <TOKEN> <IP_MANAGER>:2377
```

Vérifier sur le Manager :

```bash
docker node ls
```

## Construire les images

Sur le Manager :

```bash
docker build -t voting-vote:latest ./vote
docker build -t voting-worker:latest ./worker
docker build -t voting-result:latest ./result
```

## Déployer

```bash
docker stack deploy -c docker-compose.swarm.yml voting
```

## Vérifier

```bash
docker stack services voting
docker stack ps voting
```

Les services vote et result doivent avoir 2/2 réplicas.

## Accès

Depuis n'importe quel noeud :
- Vote : http://localhost:8080
- Result : http://localhost:8888

## Commandes utiles

```bash
# Voir services
docker stack services voting

# Logs
docker service logs voting_vote

# Scaler
docker service scale voting_vote=3

# Supprimer
docker stack rm voting
```

## Test haute disponibilité

Arrêter Docker sur un worker :

```bash
sudo systemctl stop docker
```

Les apps restent accessibles (réplicas redéployés).

Redémarrer :

```bash
sudo systemctl start docker
```