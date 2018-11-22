defmodule Wallstreet.Repo.Migrations.CreatePortfolios do
  use Ecto.Migration

  def change do
    create table(:portfolios) do
      add :term, :naive_datetime
      add :stocks, :map
      add :initial_investment, :float
      add :current_portfolio_value, :float
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:portfolios, [:user_id])
  end
end
