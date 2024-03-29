defmodule Tarantino.Router do
  use Tarantino.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Tarantino.Auth, repo: Tarantino.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tarantino do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/watch/:id", WatchController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Tarantino do
  #   pipe_through :api
  # end

  scope "/manage", Tarantino do
    pipe_through [:browser, :authenticate_user]

    resources "/videos", VideoController
  end
end
