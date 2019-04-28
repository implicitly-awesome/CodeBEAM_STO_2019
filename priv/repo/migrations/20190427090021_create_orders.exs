defmodule SuperApp.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      # add(:number, :integer)
      add(:number, :bigint)

      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:orders, [:number, :user_id]))
  end
end
