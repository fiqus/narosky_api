# NaroskyApi

## Run with Docker
  * Change in `dev.exs` the database `hostname:` from localhost to `"postgres"`.
  * Create the docker image and power up the services: `docker-compose up -d --build`
  * If your DB table still does not exist: `docker-compose exec narosky_api mix ecto.create`
  * And run the migrationst: `docker-compose exec narosky_api mix ecto.migrate`
  * Start the server! `docker-compose exec narosky_api mix phx.server`

You might need run all with `sudo`.

## Run with your local

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## HTML admin
### Creating a user:
`http://localhost:4000/admin/users/new`

### Species admin
`http://localhost:4000/admin/species`

## API REST Endpoints
### GET /api/species
`http://localhost:4000/api/species`

### GET /api/quiz/:region
`http://localhost:4000/api/quiz/pampas`

## GraphQL wip
Access to the client `http://localhost:4000/graphiql`.
Query example:
```json
{
  species {
    id
    nameEs,
    sciName
  }
}
```
using `matching`
```json
{
  species(matching: "hor") {
    id
    nameEs,
    sciName
  }
}
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
