defmodule JokerPoll.Endpoint do
  use Phoenix.Endpoint, otp_app: :joker_poll

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :joker_poll,
    only: ~w(css images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_joker_poll_key",
    signing_salt: "lMkrbLP8",
    encryption_salt: "ks0vjWD5"

  plug :router, JokerPoll.Router
end
