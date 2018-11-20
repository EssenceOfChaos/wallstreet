defmodule Wallstreet.Auth.Accounts do

  alias Wallstreet.Repo
  alias Wallstreet.Auth.User
  alias Comeonin.Argon2
  alias Wallstreet.Auth

  import Ecto.Query
  import Plug.Conn

  def get_user(id), do: Repo.get(User, id)

    @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_current_user(conn) do
    Auth.Guardian.Plug.current_resource(conn)
  end

  def is_current_user_admin?(conn) do
    user = Auth.Guardian.Plug.current_resource(conn)
    case user do
      nil -> false
      user -> user.is_admin
    end
  end

  def authenticate_user(email, given_password) do
    query = Ecto.Query.from(u in User, where: u.email == ^email)
    Repo.one(query)
    |> check_password(given_password)
  end

  def login(conn, user) do
    conn
    |> Auth.Guardian.Plug.sign_in(user)
    |> assign(:current_user, user)
  end

  def logout(conn) do
    conn
    |> Auth.Guardian.Plug.sign_out()
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

    @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end


    @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  # Private

  defp check_password(nil, _), do: {:error, "Incorrect email or password"}

  defp check_password(user, given_password) do
    case Argon2.checkpw(given_password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, "Incorrect email or password"}
    end
  end

end
