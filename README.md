
# News Aggregator API

## Overview
The News Aggregator API is a Laravel-based RESTful API that aggregates articles from various news sources. It includes features for user authentication, article management, user preferences, and scheduled data aggregation from multiple news APIs.

## Table of Contents
- [Features](#features)
- [Requirements](#requirements)
- [Data Sources](#data-sources)
- [Installation](#installation)
- [Docker Setup](#docker-setup)
- [API Authentication](#api-authentication)
- [Testing](#testing)
- [API Endpoints](#api-endpoints)
- [License](#license)

## Features
- **User Authentication**: 
  - Registration and login endpoints with Laravel Sanctum for API token management.
  - Password reset functionality.
  
- **Article Management**:
  - Fetch articles with pagination and search capabilities.
  - Retrieve detailed information about individual articles.
  
- **User Preferences**:
  - Manage user preferences for news sources, categories, and authors.
  - Personalized news feed based on user preferences.
  
- **Data Aggregation**:
  - Regularly fetch articles from multiple news APIs and store them locally.

## Requirements
- PHP >= 8.2
- Composer
- MySQL or compatible database
- Docker (optional for containerized setup)

## Data Sources
This API aggregates articles from the following sources:
1. [NewsAPI](https://newsapi.org)
2. [The Guardian](https://open-platform.theguardian.com/)
3. [The New York Times](https://developer.nytimes.com/)

*Note: Registration and API keys are required for accessing these APIs.*

## Installation
### Clone the Repository
```bash
git clone https://github.com/dee2499/news-api-test.git
cd news-api-test
```

### Install Dependencies
```bash
composer install
```

### Set Up Environment Variables
Copy the `.env.example` file to `.env` and fill in the required fields:
```bash
cp .env.example .env
```

### Generate Application Key
```bash
php artisan key:generate
```

### Run Migrations
```bash
php artisan migrate
```

### Seed the Database (optional)
If you have seeders set up, run:
```bash
php artisan db:seed
```

### Fetch articles using laravel scheduler ( can set it as per need, currently set to hourly)
To fetch articles from API, run:
```bash
php artisan fetch:articles
```

## Docker Setup
To run the application in a Docker container, ensure you have Docker and Docker Compose installed.

### Build and Run Docker
```bash
docker-compose up -d 
```

### Access the Application
Once the containers are running, access the API at `http://localhost:8000`.

## API Authentication
### Registration
To register a new user, send a POST request to:
```
POST /api/register
```
**Payload**:
```json
{
  "name": "John Doe",
  "email": "johndoe@example.com",
  "password": "password123",
  "password_confirmation": "password123"
}
```

### Login
To log in, send a POST request to:
```
POST /api/login
```
**Payload**:
```json
{
  "email": "johndoe@example.com",
  "password": "password123"
}
```
**Response**:
- Successful login will return a token for further authenticated requests.

### Password Reset
To reset the password, send a POST request to:
```
POST /api/password/reset
```
**Payload**:
```json
{
  "email": "johndoe@example.com",
  "password": "newpassword123",
  "password_confirmation": "newpassword123"
}
```

## Testing
The project includes both unit and feature tests. To run the tests, use:
```bash
php artisan test
```

### Unit Tests
Unit tests validate individual components of the application. For example, testing password reset functionality:
```php
public function testUserCanResetPassword()
{
    // Test code here
}
```

### Feature Tests
Feature tests validate the overall application behavior and user flows. For example, testing user registration:
```php
public function testUserCanRegister()
{
    // Test code here
}
```

## API Endpoints
Here are some key API endpoints:

### User Endpoints
- **Register**: `POST /api/register`
- **Login**: `POST /api/login`
- **Logout**: `POST /api/logout`
- **Reset Password**: `POST /api/password/reset`

### Article Endpoints
- **Fetch Articles**: `GET /api/articles`
- **Fetch Single Article**: `GET /api/articles/{id}`
- **Search Articles**: `GET /api/articles/search`

### User Preferences
- **Set Preferences**: `POST /api/preferences`
- **Get Preferences**: `GET /api/preferences`
- **Fetch Personalized News Feed**: `GET /api/personalized-feed`

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

---

Thank you for reviewing this project! If you have any questions or feedback, please feel free to reach out.
