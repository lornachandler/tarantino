defmodule Tarantino.WatchController do
  use Tarantino.Web, :controller
  alias Tarantino.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end