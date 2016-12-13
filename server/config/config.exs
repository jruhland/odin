# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :odin,
  ecto_repos: [Odin.Repo]

# Configures the endpoint
config :odin, Odin.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I+rfkUkad5nEit+ISx0kYkIF8f0s0350MU/ZAlOvSIw7GHfqTU99LxOZ5VoUglOS",
  render_errors: [view: Odin.ErrorView, accepts: ~w(json)],
  pubsub: [name: Odin.PubSub,
           adapter: Phoenix.PubSub.PG2]

 config :guardian, Guardian,
   allowed_algos: ["HS512"],
   verify_module: Guardian.JWT,
   issuer: "Odin",
   ttl: { 30, :days },
   verify_issuer: true,
   secret_key: System.get_env("GUARDIAN_SECRET") || "evnfQ50hewEutJ0P1snzQ+g2A/RdBg6AX3RlcTETMDfQhh1TjC3arqYMgiRwARqm",
   serializer: Odin.GuardianSerializer


# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure phoenix generators
config :phoenix, :generators,
  binary_id: true

# Encoders
config :phoenix, :format_encoders,
  "json-api": Poison

# Mime-types
config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
