defmodule JokerPoll.Router do
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

    get "/", JokerPoll.PageController, :index
    get "/hello", JokerPoll.HelloController, :index
    resources "/polls", JokerPoll.PollsController
  end

  # Other scopes may use custom stacks.
  # scope "/api", JokerPoll do
  #   pipe_through :api
  # end
end
