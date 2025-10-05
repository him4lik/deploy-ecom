# E-Commerce Platform

A complete e-commerce platform built with Django as primary framework.

## Project Overview

This project is a Dockerized e-commerce platform with:
- **Backend**: Django REST Framework (`api_ecom` submodule)
  - The core REST API backend for the inventory management system, featuring:
    - Product catalog management
    - JWT authentication
    - Database support (PostgreSQL)
    - Razorpay Integration
    - Order placement and management
- **Frontend**: Django templates (`web_ecom` submodule)
  - The Django template-based frontend for the inventory management system, featuring:
    - Product catalog browsing
    - Shopping cart functionality
    - Admin dashboard integration
    - Razorpay screens
    - User orders management.
- **Database**:
  - PostgreSQL (relational database)

## Prerequisites

- Docker

## Local Deployment Steps

### 1. Install Docker
Install Docker engine.

### 2. Use .bash_aliases file for docker commands aliases
```bash
cd deploy-ecom
source .bash_aliases
```
### 3. Start All Services
Go to the project directory and run the following command to start all services:

```bash
dcrestartdev # for dev environment
dcrestartprod # for prod environmment
```

### 3. Populate test data for api container
Go to the project directory and run the following command:

```bash
devshell_api
python manage.py populate_test_data
```

### 3. Populate test data for website container
Go to the project directory and run the following command:

```bash
devshell_website
python manage.py populate_test_data
```

### 4. Test IT
Go to this url - [http://localhost/](http://localhost/)

## Important Commands
Following aliases are added to .bash_aliases file for convenience
```bash
dcrestartdev <service-name> # restart container for specific service - api, website, redis, worker, postgres, beat, traefik
dclogsdev <service-name> # see logs for specific service - api, website, redis, worker, postgres, beat, traefik
devshell_api # open shell for api container
devshell_website # open shell for website container
```

##  Access Endpoints

#### Website: http://localhost/
#### Website Admin Panel: http://localhost/admin/
#### API Admin Panel: http://localhost/api/test1/admin/
