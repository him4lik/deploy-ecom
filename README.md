# E-Commerce Inventory Management Platform

A complete inventory management system built with Django and Docker.

## Table of Contents
- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Services](#services)
- [Common Commands](#common-commands)
- [Development](#development)
- [Access Endpoints](#access-endpoints)

## Project Overview

This project is a Dockerized e-commerce platform with:
- **Backend**: Django REST Framework (`api_ecom` submodule)
- **Frontend**: Django templates (`web_ecom` submodule)
- **Databases**:
  - PostgreSQL (relational data)
  - MongoDB (document storage)

## Prerequisites

- Docker Engine
- Docker Compose
- Git (for submodules)

## Quick Start

1. **Clone the repository**:
   ```bash
   git clone --recurse-submodules https://github.com/your-repo/ecommerce-platform.git
   cd ecommerce-platform
   ```
2. **Set up aliases (add to ~/.bash_aliases or ~/.zshrc)**:
  ```bash
  alias dc='docker compose -f docker-compose.yml -f docker-compose.dev.yml --compatibility'
  ```

3. **API container shell access**:
   ```bash
    alias dshell='docker exec -ti deploy-ecommerce_api_1 /bin/bash'
   ```
4. **Logs helper**:
   ```bash
   dclogs(){
      dc logs --tail=100 --follow $@
    }
   ```

6. **Restart helper**:
   ```bash
    dcrestart(){
        dc stop $@
        dc rm -f -v $@
        dc up --build -d $@
    }
   ```
7. **Start services**:
  ```bash
  dc up -d --build
  ```
## Services

| Service	  | Description	        | Image	        | Port  |
|-----------|---------------------|---------------|-------|
| api	      | Django REST API	    | Custom build	| 8000  |
| website	  | Django frontend	    | Custom build	| 8101  |
| postgres	| PostgreSQL database	| postgres:14	  | 5432  |
| mongodb	  | MongoDB database	  | mongo:5	      | 27017 |

##  Common Commands

#### Start all services
    dc up -d

#### Stop all services
    dc down

#### Restart specific service
    dcrestart api
    dcrestart website

#### View logs
    dclogs api
    dclogs postgres

#### Scale API to 3 instances
    dc up -d api --scale api=3 --no-recreate

#### Access API container shell
    dshell  # using alias
#### OR
    docker exec -ti deploy-ecommerce_api_1 /bin/bash

#### Access database containers
    docker exec -ti deploy-ecommerce_postgres_1 psql -U postgres
    docker exec -ti deploy-ecommerce_mongodb_1 mongosh

##  Development

#### Initialize submodules
  ```bash
    git submodule init
  ```

#### Update submodules
  ```bash
    git submodule update --remote
  ```

#### API migrations
    docker exec deploy-ecommerce_api_1 python manage.py migrate

#### Website migrations
    docker exec deploy-ecommerce_website_1 python manage.py migrate
#### Creating Superuser

    docker exec -ti deploy-ecommerce_api_1 python manage.py createsuperuser
##  Access Endpoints

#### Website: http://localhost:8101
#### Website Admin Panel: http://localhost:8101/admin
#### API Admin Panel: http://localhost:8001/admin
