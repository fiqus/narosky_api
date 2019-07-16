use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :narosky_api, NaroskyApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :narosky_api, NaroskyApi.Repo,
  username: "postgres",
  password: "postgres",
  database: "narosky_api_test",
  hostname: System.get_env("POSTGRES_HOST") || "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
