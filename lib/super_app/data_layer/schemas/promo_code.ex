defmodule SuperApp.PromoCode do
  use Ecto.Schema
  alias SuperApp.User

  schema "promo_codes" do
    field :code, :string
    field :value, :float

    belongs_to(:user, User)

    timestamps()
  end
end
