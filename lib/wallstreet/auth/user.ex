defmodule Wallstreet.Auth.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Argon2

  schema "users" do
    field :admin, :boolean, default: false
    field :balance, :float
    field :display_name, :string
    field :email, :string
    field :password_hash, :string
    field :rank, :integer

    has_many(:portfolios, Wallstreet.Investment.Portfolio)

    ## Virtual Fields ##
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @create_fields ~w(display_name password email)a
  @optional_fields ~w(admin)a

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @create_fields ++ @optional_fields)
    |> validate_required(@create_fields)
    |> validate_format(:email, ~r/(\w+)@([\w.]+)/)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Argon2.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end
