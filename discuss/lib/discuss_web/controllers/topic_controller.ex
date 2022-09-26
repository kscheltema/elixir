defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  def new(conn, params) do
    changeset = DiscussWeb.Topic.changeset(%Topic{}, %{})
  end
end
