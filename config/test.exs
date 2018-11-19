use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wallstreet, WallstreetWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Config Argon2
config :argon2_elixir,
  t_cost: 1,
  m_cost: 8

# Configure your database
config :wallstreet, Wallstreet.Repo,
  username: "postgres",
  password: "postgres",
  database: "wallstreet_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
