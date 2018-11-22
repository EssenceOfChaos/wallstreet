defmodule WallstreetWeb.PageControllerTest do
  use WallstreetWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to WallStreet!"
  end
end
