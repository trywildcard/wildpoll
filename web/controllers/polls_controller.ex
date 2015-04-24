defmodule JokerPoll.PollsController do
  use JokerPoll.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, params) do
   #HTTPoison.post("https://1cb66526.ngrok.com/poll", Poison.encode!(params["polls"]), [{"Content-Type", "application/json"}])
    dict = params["polls"]
    answers = params["polls"] 
      |> Enum.filter(fn({key, _value}) -> String.starts_with?(key, "answer") end) 
      |> Enum.flat_map(fn({_key, value}) -> [value] end)

    dict = Dict.put(dict, :answers, answers)
    dict = Dict.put(dict, "mandatory", String.to_atom(dict["mandatory"]))

    IO.puts "Reached create method"
    IO.puts answers
    IO.puts Poison.encode!(dict)
    #taking out unauthed endpoint for public repo
    HTTPoison.post("http://example.com", Poison.encode!(dict), %{"Content-type" => "application/json"})

    render conn, "index.html"
  end

  def new(conn, _params) do
    render(conn, "new.html", polls: %{})
  end
end
