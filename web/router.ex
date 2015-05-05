defmodule WildPoll.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser # Use the default browser stack

    get "/", WildPoll.PageController, :index
    resources "/polls", WildPoll.PollsController
  end

  scope "/heartbeat" do
    pipe_through :api
    get "/", WildPoll.PageController, :heartbeat
  end
end
