defmodule SuperApp.User do
  use Ecto.Schema
  alias SuperApp.{Order, PromoCode}

  schema "users" do
    field :email, :string
    field :name, :string

    has_many(:promo_codes, PromoCode)
    has_many(:orders, Order)

    timestamps()
  end
end

defmodule SuperApp.PromoCode do
  use Ecto.Schema
  alias SuperApp.{User, Order}

  schema "promo_codes" do
    field :code, :string
    field :value, :float

    belongs_to(:user, User)

    timestamps()
  end
end

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
