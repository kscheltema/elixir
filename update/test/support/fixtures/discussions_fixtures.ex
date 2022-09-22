defmodule Update.DiscussionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Update.Discussions` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Update.Discussions.create_comment()

    comment
  end
end
