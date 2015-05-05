use Mix.Config

# You should also configure the url host to something
# meaningful, we use this information when generating URLs.
config :wild_poll, WildPoll.Endpoint,
  http: [port: 4000],
  url: [host: "example.com"]

# Do not print debug messages in production
config :logger, level: :info

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
#     config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :wild_poll, WildPoll.Endpoint, server: true
#
