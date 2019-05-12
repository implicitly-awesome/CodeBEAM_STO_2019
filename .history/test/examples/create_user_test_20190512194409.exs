defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    before = Repo.aggregate(User, :count, :id)

    check all params <- ExopData.generate(CreateUser) do
      IO.inspect(params)
      result = CreateUser.run(params)
      assert {:ok, %User{}} = result
    end

    assert Repo.aggregate(User, :count, :id) > before
  end
end
