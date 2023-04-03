defmodule Wallstreet.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Wallstreet.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        favorites: ["option1", "option2"],
        name: "some name",
        portfolio: %{"aapl" => 160, "msft" => 224, "goog" => 99.5},
        rank: 42
      })
      |> Wallstreet.Accounts.create_user()

    user
  end
end
