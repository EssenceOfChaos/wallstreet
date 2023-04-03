defmodule Wallstreet.AccountsTest do
  use Wallstreet.DataCase

  alias Wallstreet.Accounts

  describe "users" do
    alias Wallstreet.Accounts.User

    import Wallstreet.AccountsFixtures

    @invalid_attrs %{email: nil, favorites: nil, name: nil, portfolio: nil, rank: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", favorites: ["option1", "option2"], name: "some name", portfolio: %{}, rank: 42}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.favorites == ["option1", "option2"]
      assert user.name == "some name"
      assert user.portfolio == %{}
      assert user.rank == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", favorites: ["option1"], name: "some updated name", portfolio: %{}, rank: 43}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.favorites == ["option1"]
      assert user.name == "some updated name"
      assert user.portfolio == %{}
      assert user.rank == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
