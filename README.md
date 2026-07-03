<h1 align="center">Find your course API</h1>

## Table of contents

  - [About](#about)
  - [The back-end API](#the-back-end-api)
  - [Technologies used](#technologies-used)
  - [Local usage](#local-usage)
  - [Environment variables](#environment-variables)
  - [Testing](#testing)
  - [Contact](#contact)
  - [Acknowledgments](#acknowledgments)
  - [Show your support](#show-your-support)

## About

The project's goal was to build a mobile web app based on a <a href="https://www.behance.net/gallery/37706679/Circle-(Landing-page-Dashboard-Mobile-App)"> find your house app.</a>
The back-end is a REST API built with Ruby on Rails.
The front-end uses React and Redux.

The project's assignment can be seen <a href="https://www.notion.so/Final-Capstone-Project-Find-Your-House-9a424802e7dc48eb8ef40e2ac09397d1"> here</a>

The front-end repository can be found <a href="https://github.com/FelipeEnne/find-your-course"> here</a>

## The back-end API

The API handles project data for users and courses.

### Data in the users table

* name
* email
* password_digest (stored internally, never returned in JSON)
* favorite

### Data in the courses table

* name
* owner
* starts
* value
* description
* image

### Authentication

Protected endpoints require a JWT token obtained from login:

```
Authorization: Bearer <token>
```

`POST`, `PATCH`, and `DELETE` on `/users` and `/courses` require authentication. `GET` endpoints and user signup remain public.

### Endpoints

| Method | Path | Auth | Description |
|--------|------|------|-------------|
| `POST` | `/login` | No | Authenticate user. Returns `{ token, user }` |
| `POST` | `/users` | No | User signup |
| `GET` | `/users` | No | List all users |
| `GET` | `/users/:id` | No | Get user by id |
| `PATCH` | `/users/:id` | Yes | Update user favorite |
| `DELETE` | `/users/:id` | Yes | Delete user |
| `GET` | `/courses` | No | List all courses |
| `GET` | `/courses/:id` | No | Get course by id |
| `POST` | `/courses` | Yes | Create course |
| `PATCH` | `/courses/:id` | Yes | Update course |
| `DELETE` | `/courses/:id` | Yes | Delete course |

#### Login example

```bash
curl -X POST http://localhost:3000/login \
  -H "Content-Type: application/json" \
  -d '{"name":"name","password":"123@qwe"}'
```

Response:

```json
{
  "token": "eyJ...",
  "user": { "id": 1, "name": "name", "email": "email@gmail.com", "favorite": "" }
}
```

### Live version

You can find it <a href="https://protected-beyond-23220.herokuapp.com/"> here</a>

## Technologies used

* Ruby 3.3
* Ruby on Rails 7.2
* PostgreSQL
* bcrypt
* JWT
* RSpec
* Heroku

## Local usage

### Prerequisites

* Ruby 3.3.11
* PostgreSQL
* Bundler

### Setup

1. Clone the repository
2. Open your terminal and navigate to the repository folder
3. Install dependencies:

```bash
bundle install
npm install
```

4. Configure PostgreSQL credentials (example on Windows):

```powershell
$env:PGPASSWORD = "your_postgres_password"
```

5. Prepare the database:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

6. Start the server:

```bash
bundle exec rails s
```

The API runs at `http://localhost:3000`.

## Environment variables

| Variable | Required | Description |
|----------|----------|-------------|
| `SECRET_KEY_BASE` | Production | Rails secret key |
| `RAILS_MASTER_KEY` | Production | Decrypts `config/credentials.yml.enc` |
| `CORS_ORIGINS` | Production | Allowed frontend origins, comma-separated (default: `http://localhost:3000`) |
| `API_FIND_YOUR_COURSE_DATABASE_PASSWORD` | Production | PostgreSQL password |
| `DATABASE_URL` | Heroku/CI | Full database connection URL |
| `PGPASSWORD` | Local (Windows) | PostgreSQL password for local development |

## Testing

```bash
bundle exec rspec
bundle exec bundler-audit check
npm audit
```

## Contact

Felipe Enne - felipeenne@gmail.com | <a href="https://github.com/FelipeEnne">GitHub</a> | <a href="https://www.linkedin.com/in/felipe-enne/">Linkedin</a>

## Acknowledgements

- [Microverse](https://www.microverse.org/)

## Show your support

Give a ⭐️ if you like this project!
