defmodule Darkstone.PageControllerTest do
  use Darkstone.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Darkstone"
  end
end
