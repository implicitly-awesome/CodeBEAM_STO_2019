defmodule SuperApp.Operations.CreateUser do
  use Exop.Operation

  import Ecto.Changeset

  alias SuperApp.{Repo, User}

  @not_empty_string [type: :string, regex: ~r/^(?!\s*$).+/]

  parameter :name, @not_empty_string
  parameter :email, @not_empty_string
  parameter :age, type: :integer, numericality: %{greater_than: 0, less_than: 200}
  parameter :meta, inner: %{
    favorite_color: [in: ~w(red green white)],
    uuid: [type: :uuid],
    smth: [inner: %{
      a: [type: :atom],
      b: [inner: %{
        c: [type: :integer]
      }]
    }]
  }

  def process(%{name: _name, email: _email} = params) do
    %User{}
    |> cast(params, Map.keys(params))
    |> unique_constraint(:email)
    |> Repo.insert(returning: true)
  end
end
