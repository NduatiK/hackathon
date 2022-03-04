defmodule HackathonWeb.PageController do
  use HackathonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
