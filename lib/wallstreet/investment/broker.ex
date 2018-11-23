defmodule Wallstreet.Investment.Broker do
  @moduledoc false
  alias Wallstreet.Investment.Portfolio
  alias Wallstreet.Repo
  alias Wallstreet.Auth.{User, Guardian}

  # import Ecto.Query
  # import Plug.Conn


  def change_portfolio(%Portfolio{} = portfolio) do
    Portfolio.changeset(portfolio, %{})
  end


  def create_portfolio(%User{} = user, attrs \\ %{}) do
    %Portfolio{}
    |> Portfolio.changeset(attrs)
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
