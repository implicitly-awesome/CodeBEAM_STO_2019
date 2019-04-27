defmodule SuperApp.Operations.DeleteUser do
  use Exop.Operation

  alias SuperApp.{Repo, User, UserQuery}

  parameter "id", type: :integer, numericality: %{gt: 0}, coerce_with: &__MODULE__.id_to_int/1

  def id_to_int(str_id) do
    case Integer.parse(str_id) do
      {int_id, ""} -> int_id
      _ -> {:error, "malformed_params"}
    end
  end

  def process(params) do
    with %User{} = user <- UserQuery.find(params["id"]),
         {:ok, %User{}} <- Repo.delete(user) do
      "deleted"
    else
      nil -> {:error, "user not found"}
      error -> error
    end
  end
end
