defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    before = Repo.aggregate(User, :count, :id)

    custom = %{
      meta: %{color: "orange"}
    }

    check all params <- ExopData.generate(CreateUser) do
      result = CreateUser.run(params)
      assert {:ok, %User{}} = result
    end

    assert Repo.aggregate(User, :count, :id) > before
  end
end
