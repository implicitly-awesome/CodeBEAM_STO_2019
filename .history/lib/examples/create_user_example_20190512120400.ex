defmodule CreateUser do
  import Ecto.Changeset
  alias SuperApp.{User, Repo}

  use Exop.Operation

  parameter :name, type: :string, length: %{min: 1}
  parameter :email, type: :string, regex: ~r/\w+@google\.com/
  parameter :meta, type: :map, inner: %{
    age: [type: :integer, numericality: %{min: 18}],
    favorite_color: [in: ~w(blue grey green)]
  }

  def process(params) do
    :ok
    # %User{}
    # |> cast(params, [:name, :email, :meta])
    # |> Repo.insert()
  end
end
