defmodule CreateUser do
  import Ecto.Changeset
  alias SuperApp.{User, Repo}

  use Exop.Operation

  parameter :name, type: :string, length: %{min: 1, max: 254}
  parameter :email, type: :string, regex: ~r/\w+@google\.com/

  def process(params) do
    %User{}
    |> cast(params, [:name, :email])
    |> Repo.insert()
  end
end
