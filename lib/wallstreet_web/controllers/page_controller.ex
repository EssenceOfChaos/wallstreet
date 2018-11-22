defmodule WallstreetWeb.PageController do
  use WallstreetWeb, :controller

  def index(conn, _params) do
    IO.inspect(conn)
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.html", current_user: user)
  end
end
