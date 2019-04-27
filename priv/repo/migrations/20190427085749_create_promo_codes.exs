defmodule SuperApp.Repo.Migrations.CreatePromoCodes do
  use Ecto.Migration

  def change do
    create table(:promo_codes) do
      add(:code, :string)
      add(:value, :float)

      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(unique_index(:promo_codes, [:code, :user_id]))
  end
end
