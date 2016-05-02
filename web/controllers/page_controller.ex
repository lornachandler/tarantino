defmodule Tarantino.PageController do
  use Tarantino.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
