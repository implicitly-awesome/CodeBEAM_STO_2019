defmodule SuperApp.OrderItem do
  use Ecto.Schema
  alias SuperApp.Order

  @derive {Jason.Encoder, only: [:id, :name, :price, :quantity]}

  schema "order_items" do
    field :name, :string
    field :price, :float
    field :quantity, :integer

    belongs_to(:order, Order)

    timestamps()
  end
end
