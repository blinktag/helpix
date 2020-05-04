defmodule HelpixWeb.PageController do
  use HelpixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
