defmodule Update.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Update.Accounts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        email: "some email"
      })
      |> Update.Accounts.create_users()

    users
  end
end
