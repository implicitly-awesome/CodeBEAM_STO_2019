defmodule SuperApp.Operations.CreateUser do
  use Exop.Operation

  import Ecto.Changeset

  alias SuperApp.{Repo, User}

  parameter :name, type: :string, regex: ~r/^(?!\s*$).+/
  parameter :email, type: :string, regex: ~r/@/

  def process(%{name: _name, email: _email} = params) do
    %User{}
    |> cast(params, Map.keys(params))
    |> unique_constraint(:email)
    |> Repo.insert(returning: true)
  end
end
