defmodule Tarantino.UserView do
  use Tarantino.Web, :view
  alias Tarantino.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end