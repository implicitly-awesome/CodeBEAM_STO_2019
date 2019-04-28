defmodule SuperApp.User do
  use Ecto.Schema
  alias SuperApp.Order

  @derive {Jason.Encoder, only: [:id, :email, :name]}

  schema "users" do
    field :email, :string
    field :name, :string
    field :age, :integer, virtual: true
    field :meta, :map, virtual: true

    has_many(:orders, Order)

    timestamps()
  end
end
