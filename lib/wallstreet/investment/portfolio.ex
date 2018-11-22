defmodule Wallstreet.Investment.Portfolio do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields ~w(initial_investment user_id stocks term)a

  schema "portfolios" do
    field :current_portfolio_value, :float
    field :initial_investment, :float
    field :stocks, :map
    field :term, :naive_datetime
    # field :user_id, :id
    belongs_to(:user, Wallstreet.Auth.User, foreign_key: :user_id)
    timestamps()
  end

  @doc false
  def changeset(portfolio, attrs) do
    portfolio
    |> cast(attrs, @required_fields)
    |> validate_required([:term, :stocks])
  end
end
