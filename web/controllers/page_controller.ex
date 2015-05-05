defmodule WildPoll.PageController do
  use WildPoll.Web, :controller

  plug :action

  def index(conn, _params) do
    redirect(conn, to: "/polls")
  end

  def heartbeat(conn, _params) do
    conn |> put_status(200) |> text("ok")
  end
end
