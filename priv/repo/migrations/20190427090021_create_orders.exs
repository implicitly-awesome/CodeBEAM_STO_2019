defmodule SuperApp.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add(:number, :integer)
      add(:value, :float)

      add(:user_id, references(:users, on_delete: :nothing))
      add(:promo_code_id, references(:promo_codes, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:orders, [:number, :user_id]))
    create(unique_index(:orders, [:id, :promo_code_id]))
  end
end
