defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    check all params <- ExopData.generate(CreateUser) do
      assert params[]
      result = CreateUser.run(params)
      assert
    end
  end
end
