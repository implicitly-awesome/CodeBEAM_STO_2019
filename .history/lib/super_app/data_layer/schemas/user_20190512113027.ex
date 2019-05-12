defmodule SuperApp.User do
  use Ecto.Schema

  schema "users" do
    field :email, :string
    field :name, :string
    field :age, :integer, virtual: true
    field :meta, :map

    timestamps()
  end
end
