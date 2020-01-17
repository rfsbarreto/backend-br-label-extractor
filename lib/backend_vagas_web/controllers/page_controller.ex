defmodule BackendVagasWeb.PageController do
  use BackendVagasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
