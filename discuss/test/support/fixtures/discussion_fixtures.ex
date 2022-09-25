defmodule Discuss.DiscussionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Discussion` context.
  """

  @doc """
  Generate a posts.
  """
  def posts_fixture(attrs \\ %{}) do
    {:ok, posts} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> Discuss.Discussion.create_posts()

    posts
  end
end
