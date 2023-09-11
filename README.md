# Rails Dockerized Project

This repository contains a Dockerized Ruby on Rails application with a PostgreSQL database. It allows you to easily set up and run the application in a Docker container using Docker Compose.

## Prerequisites

Before you begin, ensure you have the following dependencies installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

1. Clone this repository to your local machine:

  ```bash
    git clone git@github.com:MelissaEscobar-Globant/candidates.git
  ```
2. Creare directories for logs and Postgres data. Then, change to the project directory:
  ```bash
    mkdir pg_logs pg_data redis_data
    cd candidates
  ```
3. Build and start the Docker containers:
  ```bash
    docker-compose up --build
  ```

4. Access the Rails application in your web browser at http://localhost:3000

5. To stop the containers, press Ctrl+C, or run:
  ```bash
  docker-compose down
  ```

# Development

Run Rails commands inside the Docker container. For example, to run database migrations:

  ```bash
    docker-compose run web bin/rails db:migrate
  ```
To access the Rails console

  ```bash
    docker-compose run web bin/rails console
  ```
Edit the Rails application code locally, and the changes will be reflected in the container.

# Database
The PostgreSQL database is hosted in a separate Docker container.

Database data is persisted in the ../pg_data Docker volume to survive container restarts.

To access the database using a PostgreSQL client, use the following connection details:

Host: localhost
Port: 5432
Username: postgres
Password: password
Database: candidates_development

# Redis
Redis is hosted in a separate Docker container.

Redis data is persisted in the ../redis_data Docker volume to survive container restarts.

To use Redis in your Rails application, configure it accordingly. For example, to connect to Redis in your Rails app, use the hostname redis and the default port 6379.

# Docker Compose Configuration
docker-compose.yml defines the services and their configuration, including the Rails web application, PostgreSQL database, and Redis.

# License
This project is licensed under the MIT License.
