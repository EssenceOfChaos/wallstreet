defmodule Wallstreet.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :favorites, {:array, :string}
    field :name, :string
    field :portfolio, :map
    field :rank, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :favorites, :portfolio, :rank])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
