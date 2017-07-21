defmodule Darkstone.PageController do
  use Darkstone.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
