defmodule SuperApp.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :name, :string
    field :meta, :map, virtual: true

    timestamps()
  end
end
