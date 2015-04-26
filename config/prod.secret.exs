use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :wild_poll, WildPoll.Endpoint,
  secret_key_base: "oIUhU4TGm+kHW7TH9pPG88aUbChPIdL52P2P7C01OJ4IMFNEcdnjv9bnwT/hTAMj"

# Configure your database
config :wild_poll, WildPoll.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "wild_poll_prod"
