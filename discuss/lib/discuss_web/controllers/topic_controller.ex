defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias DiscussWeb.Topic

  def new(conn, params) do
    # %Topic is the struct >>>> %{} is the empty params
    changeset = Topic.changeset(%Topic{}, %{})

    render(conn, "new.html")
  end
end
