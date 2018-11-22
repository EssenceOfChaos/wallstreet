defmodule Wallstreet.GuardianErrorHandler do
  use WallstreetWeb, :controller

  def auth_error(conn, _, _opts) do
    conn
    |> put_flash(:error, "Sorry, you must be signed in to access that feature!")
    |> redirect(to: Routes.session_path(conn, :new))
  end


end
