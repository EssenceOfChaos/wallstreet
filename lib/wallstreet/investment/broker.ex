defmodule Wallstreet.Investment.Broker do
  @moduledoc false
  alias Wallstreet.Investment.Portfolio
  alias Wallstreet.Repo
  alias Wallstreet.Auth.{User}
  alias Wallstreet.Api.StockPrice
  # import Ecto.Query
  # import Plug.Conn


  def change_portfolio(%Portfolio{} = portfolio) do
    Portfolio.changeset(portfolio, %{})
  end


  def create_portfolio(%User{} = user, attrs \\ %{}) do
    stocks = StockPrice.batch_quote(attrs)
    %Portfolio{}
    |> Portfolio.changeset(Map.put(attrs, "stocks", stocks))
    |> put_user(user)
    |> Repo.insert()
  end


  def get_portfolio(id) do
    Repo.get(Portfolio, id)
  end

  # Private functions
  defp put_user(changeset, user) do
    Ecto.Changeset.put_assoc(changeset, :user, user)
  end

end
