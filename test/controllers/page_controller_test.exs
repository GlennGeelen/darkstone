defmodule Darkstone.PageControllerTest do
  use DarkstoneWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Darkstone"
  end
end
