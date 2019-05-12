defmodule CreateUserTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{Repo, User}

  property "creates a user" do
    custom = ~g[
      meta: %{favorite_color: "blue"}
    ]

    check all params <- ExopData.generate(CreateUser, generators: custom) do
      result = CreateUser.run(params)
      assert {:ok, :ok} = result
    end
  end
end
