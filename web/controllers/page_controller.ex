defmodule JokerPoll.PageController do
  use JokerPoll.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
