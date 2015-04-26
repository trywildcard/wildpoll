# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :wild_poll, WildPoll.Endpoint,
  url: [host: "localhost"],
  root: Path.expand("..", __DIR__),
  secret_key_base: "N57hdP5wOfhOW8WWrpciC+IaZMBsynicTAmfBm4lREG+diOR0Rqb/R4BJ81VnDlK",
  debug_errors: false,
  pubsub: [name: WildPoll.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# These get overwritten in prod by prod.secret.exs
config :wild_poll, :poll_endpoint,
  url: "http://localhost:8080/poll",
  token: "changeme"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
