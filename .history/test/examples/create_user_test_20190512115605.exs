defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    check all params <- ExopData.generate(CreateUser) do
      IO.inspect(params)
    end
  end
end
