use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :joker_poll, JokerPoll.Endpoint,
  secret_key_base: "oIUhU4TGm+kHW7TH9pPG88aUbChPIdL52P2P7C01OJ4IMFNEcdnjv9bnwT/hTAMj"

# Configure your database
config :joker_poll, JokerPoll.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "joker_poll_prod"
