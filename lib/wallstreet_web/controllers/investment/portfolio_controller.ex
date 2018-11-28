defmodule WallstreetWeb.Investment.PortfolioController do
  use WallstreetWeb, :controller

  alias Wallstreet.Investment.{Broker, Portfolio}

  def new(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    changeset = Broker.change_portfolio(%Portfolio{})
    render(conn, "new.html", user: user, changeset: changeset)
  end

  def create(conn, %{"portfolio" => portfolio_params}) do
    current_user = Guardian.Plug.current_resource(conn)
    case Broker.create_portfolio(current_user, portfolio_params) do
      {:ok, portfolio} ->
        conn

        |> put_flash(:info, "Portfolio created successfully")
        |> redirect(to: Routes.portfolio_path(conn, :show, portfolio))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

  end


  def show(conn, %{"id" => id}) do
    portfolio = Broker.get_portfolio(id)
    render(conn, "show.html", portfolio: portfolio)
  end


end
