use Mix.Config

config :odin, Odin.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  cache_static_manifest: "priv/static/manifest.json"

config :logger, level: :info

config :odin, Odin.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

import_config "prod.secret.exs"
