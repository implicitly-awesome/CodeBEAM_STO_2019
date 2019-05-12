defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    check all params <- ExopData.generate(CreateUser) do
      assert is_binary(params[:name])
      assert is_binary(params[:email])
      assert String.contains?(params[:email], "@google.com")
      assert is_map(params[:meta])
    end
  end
end
