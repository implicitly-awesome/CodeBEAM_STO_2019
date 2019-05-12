defmodule CreateUser do
  use Exop.Operation

  import Ecto.Changeset
  alias SuperApp.{User, Repo}

  parameter :name, type: :string, length: %{min: 1}
  parameter :email, type: :string, regex: ~r/\w+@google\.com/
  parameter :meta, type: :map, inner: %{
    age: [type: :integer, numericality: %{gte: 18, lte: 20}],
    color: [in: ~w(blue orange green)]
  }

  def process(%{name: _, email: _} = params) do
    %User{}
    |> cast(params, [:name, :email, :meta])
    |> Repo.insert()
  end
end
