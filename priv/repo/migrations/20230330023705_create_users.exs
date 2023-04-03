defmodule Wallstreet.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string, null: false
      add :favorites, {:array, :string}
      add :portfolio, :jsonb
      add :rank, :integer

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
