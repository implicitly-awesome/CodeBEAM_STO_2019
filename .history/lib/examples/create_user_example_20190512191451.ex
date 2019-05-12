defmodule CreateUser do
  use Exop.Operation

  import Ecto.Changeset
  alias SuperApp.{User, Repo}

  parameter :name, type: :string, length: %{min: 1}
  parameter :email, type: :string, regex: ~r/\w+@google\.com/

  def process(%{name: _, email: _} = params) do
    %User{}
    |> cast(params, [:name, :email])
    |> Repo.insert()
  end
end
