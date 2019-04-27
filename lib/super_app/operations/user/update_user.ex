defmodule SuperApp.Operations.UpdateUser do
  use Exop.Operation

  import Ecto.Changeset

  alias SuperApp.{Repo, User}

  parameter :user, struct: User
  parameter :updates, inner: %{
    "name" => [type: :string, regex: ~r/^(?!\s*$).+/]
  }

  def process(params) do
    params.user
    |> change(%{name: params.updates["name"]})
    |> Repo.update()
  end
end
