defmodule WallstreetWeb.Admin.HomeController do
  use WallstreetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
