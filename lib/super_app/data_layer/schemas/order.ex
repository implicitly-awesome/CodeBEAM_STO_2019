defmodule SuperApp.Order do
  use Ecto.Schema
  alias SuperApp.{User, PromoCode}

  schema "orders" do
    field :number, :integer
    field :value, :float

    belongs_to(:user, User)
    belongs_to(:promo_code, PromoCode)

    timestamps()
  end
end
