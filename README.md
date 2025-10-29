# 🎬 MovieApp

MovieApp projet d’orchestration qui regroupe l’ensemble des services de l’application (frontend, backend)


- **Frontend (movieapp-ui)** : Angular + Angular Material, déployé avec Nginx : [doc frontend](https://github.com/messaoudRm/movieapp-ui/blob/main/README.md)
- **Backend (movieapp-api)** : Spring Boot, exposant les services REST : [doc backend](https://github.com/messaoudRm/movieapp-api/blob/main/README.md)
  - **Base de données** : MariaDB, initialisée automatiquement.
  - **Adminer** : outil de gestion de la base accessible via navigateur.
- **Monitoring (movieapp-monitoring)**: stack de monitoring basée sur Prometheus et Grafana : [doc monitoring](https://github.com/messaoudRm/movieapp-monitoring/blob/main/README.md)
- **Sentiment Analyzer (sentiment-analyzer)** : microservice FastAPI dédié à l’analyse de sentiment des commentaires : [doc Sentiment-Analyzer](https://github.com/messaoudRm/sentiment-analyzer/blob/main/README.md)

---
## Architecture :
```mermaid
flowchart TB

%% ==== SECTION FRONTEND ====
  subgraph Nginx["Frontend Services"]
    client["Angular (Nginx container)"]
  end

%% ==== SECTION BACKEND ====
  subgraph Backend["Backend Services"]
    direction TB

  %% --- Application principale ---
    subgraph SpringBootApp["Spring Boot App (container)"]
      direction TB
    end

  %% --- Microservice FastAPI ---
    subgraph FastAPI["FastAPI Microservice (container)"]
      direction TB
    end

  %% --- Container BD ---
    subgraph Database["MariaDB (container)"]
      direction TB
    end

  end


%% ==== SECTION MANAGMENT ====
  subgraph Adminer["Management Services"]
    direction TB
    adminer["Adminer UI (container)"]
  end


%% ==== SECTION MONITORING ====
  subgraph Monitoring["Monitoring Services"]
    direction TB
    prometheus["Prometheus (container)"]
    grafana["Grafana (container)"]
  end


%% ==== SECTION STORAGE ====
  subgraph Storage["Persistent Storage"]
    vol1["Data Volume (MariaDB)"]
    vol2["Monitoring Volume (Prometheus / Grafana)"]
  end


%% ==== FLUX PRINCIPAL ====
  Nginx <-->|"HTTP"| SpringBootApp
  SpringBootApp <-->|"JDBC / JPA"| Database
  adminer <-->|"DB Admin Access"| Database
  Database --> vol1


%% ==== INTÉGRATION FASTAPI ====
  SpringBootApp <-->|"HTTP"| FastAPI


%% ==== FLUX MONITORING ====
  SpringBootApp -->|"Expose métriques"| prometheus
  prometheus -->|"Scrape et stocke les métriques"| vol2
  grafana -->|"Interroge Prometheus"| prometheus

```

---

## Lancement rapide

Assurez-vous d’avoir **Docker** installé, puis :

**Créer le network Docker commun pour pouvoir connecter l’application et le monitoring**
```bash
docker network create movieapp-network
```

**Cloner le dépôt**
```bash
git clone https://github.com/messaoudRm/movieapp.git
cd movieapp
```

**Lancer l’application avec Docker Compose**

```bash
docker-compose up --build
```

## Arrêter et relancer l'application

Arrêter l'application :
  ```bash
  Ctrl + C
  ```

Relancer les conteneurs déjà créés :
  ```bash
  docker-compose start
  ```

## Nettoyer les conteneurs, images et volumes

Arrêter et supprimer uniquement les conteneurs :
  ```bash
  docker-compose down
  ```

Supprimer les images Docker utilisées :
  ```bash
  docker rmi movieapp-frontend movieapp-backend movieapp-sentiment-analyzer mariadb:11.8.2 adminer
  ```

Supprimer le volume de la base de données :
  ```bash
  docker volume rm movieapp_movieapp-db-data
  ```


