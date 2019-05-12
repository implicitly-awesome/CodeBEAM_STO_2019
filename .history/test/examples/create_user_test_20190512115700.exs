defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    check all params <- ExopData.generate(CreateUser) do
      result = CreateUser.run(params)
      assert {:ok, %User{}} = result
    end
  end
end
