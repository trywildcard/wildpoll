defmodule WildPoll.PollsController do
  use WildPoll.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, params) do
    dict = params["polls"]
    answers = params["polls"]
      |> Enum.filter(fn({key, _value}) -> String.starts_with?(key, "answer") end)
      |> Enum.flat_map(fn({_key, value}) -> [value] end)

    dict = Dict.put(dict, :answers, answers)
    dict = Dict.put(dict, "mandatory", String.to_atom(dict["mandatory"]))

    endpoint = Application.get_env(:wild_poll, :poll_endpoint)
    endpoint[:url] <> "?access_token=" <> endpoint[:token]
        |> HTTPoison.post!(Poison.encode!(dict), %{"Content-type" => "application/json"})

    render conn, "index.html"
  end

  def new(conn, _params) do
    render(conn, "new.html", polls: %{})
  end
end
