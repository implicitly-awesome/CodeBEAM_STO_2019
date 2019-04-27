defmodule SuperApp.Repo.Migrations.CreateOrderItem do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add(:name, :string)
      add(:price, :float)
      add(:quantity, :integer)

      add(:order_id, references(:orders, on_delete: :nothing))

      timestamps()
    end
  end
end
