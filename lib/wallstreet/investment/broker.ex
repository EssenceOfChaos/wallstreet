defmodule Wallstreet.Investment.Broker do
  @moduledoc false
alias Wallstreet.Investment.Portfolio
  # alias Wallstreet.Repo
  # alias Wallstreet.Auth.{User, Guardian}

  # import Ecto.Query
  # import Plug.Conn


  def change_portfolio(%Portfolio{} = portfolio) do
    Portfolio.changeset(portfolio, %{})
  end

end
