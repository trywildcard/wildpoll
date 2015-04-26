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
    get "/hello", WildPoll.HelloController, :index
    resources "/polls", WildPoll.PollsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", WildPoll do
  #   pipe_through :api
  # end
end
