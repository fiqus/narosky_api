# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :narosky_api,
  ecto_repos: [NaroskyApi.Repo]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Configures the endpoint
config :narosky_api, NaroskyApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fxOFEKoIVUHcTIysqHoIPiC5IQ1SyuUTy+9EaLN50DUVPBUJPvoN8RcWR4qILp/x",
  render_errors: [view: NaroskyApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: NaroskyApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures Guardian
config :narosky_api, NaroskyApi.Auth.Guardian,
  issuer: "narosky_api",
  secret_key: "UGCTYCOW7kqsu0DHRSp9fszvTjpqVID3ZS1YO8aJxJSpwk3/zNE3o06Yq3T5Iuyw"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
