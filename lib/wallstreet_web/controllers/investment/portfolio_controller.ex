defmodule WallstreetWeb.Investment.PortfolioController do
  use WallstreetWeb, :controller
  alias Wallstreet.Auth.Accounts
  alias Wallstreet.Investment.{Broker, Portfolio}
  alias Wallstreet.Api.StockPrice



  # def action(conn, _) do
  #   apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  # end

  def new(conn, _) do
    user = Accounts.get_current_user(conn)
    changeset = Broker.change_portfolio(%Portfolio{})
    render(conn, "new.html", user: user, changeset: changeset)
  end

  def purchase_stock(conn, %{"portfolio" => portfolio_params}) do
    StockPrice.batch_quote(portfolio_params)
  end

  def create(conn, %{"portfolio" => portfolio_params}) do
    current_user = Accounts.get_current_user(conn)
    case Broker.create_portfolio(current_user, portfolio_params) do
      {:ok, portfolio} ->
        conn
        # |> assign()
        # |> put_session()
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
