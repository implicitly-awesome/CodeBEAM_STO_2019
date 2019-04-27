defmodule SuperApp.User do
  use Ecto.Schema

  alias SuperApp.{Order, PromoCode}

  @derive {Jason.Encoder, only: [:id, :email, :name]}

  schema "users" do
    field :email, :string
    field :name, :string

    has_many(:promo_codes, PromoCode)
    has_many(:orders, Order)

    timestamps()
  end
end
