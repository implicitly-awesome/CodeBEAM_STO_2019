defmodule SuperApp.Operations.User.CreateUserPropTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}
  alias SuperApp.Operations.CreateUser

  property "creates a user" do
    before = Repo.aggregate(User, :count, :id)

    check all params <- generate(CreateUser) do
      assert {:ok, %User{} = user} = CreateUser.run(params)
    end

    assert Repo.aggregate(User, :count, :id) > before
  end
end
