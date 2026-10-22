# Security

This document describes the security controls and configuration for the Find Your Course API.

## Authentication and access

`POST /login` authenticates with a user's name and password. A successful login returns a signed JWT. Send it on protected requests with:

```http
Authorization: Bearer <token>
```

Tokens use HS256 and expire after 24 hours. The API rejects tokens without an expiration or user ID, tokens signed with another algorithm, expired tokens, and tokens whose user no longer exists. Failed logins return the same `401 Invalid credentials` response whether the name is unknown or the password is incorrect.

User records can only be read, updated, or deleted by their owner. `GET /users` returns only the authenticated user's record. Accessing another user's record returns `403`. Creating an account and reading course data are public; creating, updating, or deleting courses requires authentication.

## Secrets and local setup

- Set `SECRET_KEY_BASE` to a unique, randomly generated secret in production. Rails credentials can supply the JWT signing key when `secret_key_base` is configured there.
- Keep `RAILS_MASTER_KEY`, database passwords, and other credentials in the deployment platform's secret manager. Do not commit them to the repository or include them in logs.
- `db:seed` creates a sample user and requires `SEED_USER_PASSWORD` to be set. Use a unique password and do not reuse a production credential.
- Set `CORS_ORIGINS` to the exact trusted frontend origins, separated by commas. The default is `http://localhost:3000` for local development.
- Production forces HTTPS. Use HTTPS for clients in every deployed environment.

## Dependency checks

Run these checks after dependency changes:

```bash
bundle exec bundler-audit check
npm audit
```

Report suspected vulnerabilities privately to the project maintainer instead of publishing exploit details in an issue.
