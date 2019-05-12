defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    check_operation CreateUser, [], fn _params ->
      {:ok, %User{}}
    end
  end
end
