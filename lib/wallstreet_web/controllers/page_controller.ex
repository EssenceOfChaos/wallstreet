defmodule WallstreetWeb.PageController do
  use WallstreetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
