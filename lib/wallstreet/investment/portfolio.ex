defmodule Wallstreet.Investment.Portfolio do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(stocks)a
  @optional_fields ~w(term initial_investment)a

  schema "portfolios" do
    field :current_portfolio_value, :float
    field :initial_investment, :float
    field :stocks, :map
    field :term, :naive_datetime
    # field :user_id, :id
    belongs_to(:user, Wallstreet.Auth.User)
    timestamps()
  end

  @doc false
  def changeset(portfolio, attrs) do
    portfolio
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required([:stocks])

  end
end
