defmodule SuperApp.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :name, :string

    timestamps()
  end
end
