# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :wallstreet,
  ecto_repos: [Wallstreet.Repo]

# Configures the endpoint
config :wallstreet, WallstreetWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BKaL7odFwS7Cqj0cquE21cQcbNCPWTURHpzA0CkBAhO+1uYSUaAytoHtlJ38WBkf",
  render_errors: [view: WallstreetWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Wallstreet.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian
config :wallstreet, Wallstreet.Auth.Guardian,
  issuer: "WALLSTREET",
  secret_key: "QHgXsWbiokeJKIl2s+Jzt/1JhE5DH+vuD15+S8rvNoX7FA5QjOeSdcAfK89EYkn9"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
