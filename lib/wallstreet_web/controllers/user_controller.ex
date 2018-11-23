defmodule WallstreetWeb.UserController do
  use WallstreetWeb, :controller
  alias Wallstreet.Auth.{Accounts, User}

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> assign(:current_user, user)
        |> put_session(:user_id, user.id)
        |> Accounts.login(user)
        |> put_flash(:info, "#{user.display_name} created successfully.")
        |> redirect_after_login(user)
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    {:ok, _user} = Accounts.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
  # Private

  defp redirect_after_login(conn, user) do
    case user.admin do
      true -> redirect(conn, to: Routes.admin_home_path(conn, :index))
      false -> redirect(conn, to: Routes.page_path(conn, :index))
    end
  end

end
