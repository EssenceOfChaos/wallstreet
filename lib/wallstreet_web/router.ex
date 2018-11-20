defmodule WallstreetWeb.Router do
  use WallstreetWeb, :router
  alias Wallstreet.Plug

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plug.Authentication
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated do
    plug Plug.EnsureAuthentication
    plug Plug.ShowSidebar
  end

  scope "/admin", WallstreetWeb, as: :admin do
    pipe_through [:browser, :authenticated]
    get "/", Admin.HomeController, :index

  end

  scope "/", WallstreetWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources("/users", UserController, only: [:create, :new, :delete])
    resources("/session", SessionController, only: [:create, :new, :delete])
  end

  # Other scopes may use custom stacks.
  # scope "/api", WallstreetWeb do
  #   pipe_through :api
  # end
end
