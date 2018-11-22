defmodule WallstreetWeb.Investment.PortfolioController do
  use WallstreetWeb, :controller
  alias Wallstreet.Auth.Accounts
  alias Wallstreet.Investment.{Broker, Portfolio}

  def new(conn, _) do
    user = Accounts.get_current_user(conn)
    changeset = Broker.change_portfolio(%Portfolio{})
    render(conn, "new.html", user: user, changeset: changeset)
  end


end
