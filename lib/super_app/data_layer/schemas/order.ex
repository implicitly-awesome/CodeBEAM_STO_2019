defmodule SuperApp.Order do
  use Ecto.Schema
  alias SuperApp.{User, OrderItem}

  @derive {Jason.Encoder, only: [:id, :number, :value]}

  schema "orders" do
    field :number, :integer

    belongs_to(:user, User)
    has_many(:order_items, OrderItem)

    timestamps()
  end
end
