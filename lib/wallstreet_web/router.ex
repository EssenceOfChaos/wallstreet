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
  end

  scope "/admin", WallstreetWeb, as: :admin do
    pipe_through [:browser, :authenticated]
    get "/", Admin.HomeController, :index
  end

  scope "/", WallstreetWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    resources("/users", UserController, only: [:new, :create])
    resources("/session", SessionController, only: [:create, :new, :delete])
  end


  scope "/", WallstreetWeb do
    pipe_through [:browser, :authenticated]
    resources("/users", UserController, only: [:index, :show])
    resources("/session", SessionController, only: [:delete])
    resources("/investment/portfolio", Investment.PortfolioController)

  end

  # Other scopes may use custom stacks.
  # scope "/api", WallstreetWeb do
  #   pipe_through :api
  # end
end
