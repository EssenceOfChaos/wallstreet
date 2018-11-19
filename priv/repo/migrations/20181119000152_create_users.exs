defmodule Wallstreet.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :display_name, :string
      add :email, :string
      add :password_hash, :string
      add :admin, :boolean, default: false, null: false
      add :balance, :float
      add :rank, :integer

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
