defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates user" do
    check all params <- generate(CreateUser) do
      assert {:ok, %User{} = user} = CreateUser.run(params)
      assert is_binary(user.name)
      assert String.contains?(user.email, "@google.com")
    end
 end
end
