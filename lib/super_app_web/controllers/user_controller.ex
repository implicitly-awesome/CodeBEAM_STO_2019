defmodule SuperAppWeb.UserController do
  use SuperAppWeb, :controller

  alias Plug.Conn
  alias SuperApp.{User, UserQuery}
  alias SuperApp.Operations.{CreateUser, UpdateUser, DeleteUser}

  def show(%Conn{} = conn, %{"id" => user_id} = _params) do
    with %User{} = user <- UserQuery.find(user_id) do
      json(conn, user)
    else
      _ -> conn |> put_status(404) |> json(%{error: "user not found"})
    end
  end



  def create(%Conn{} = conn, %{"name" => name, "email" => email} = _params) do
    with {:ok, user} <- CreateUser.run(name: name, email: email) do
      json(conn, user)
    else
      {:error, error} -> conn |> put_status(422) |> json(%{error: inspect(error)})
    end
  end



  def update(%Conn{} = conn, %{"id" => user_id} = params) do
    with %User{} = user <- UserQuery.find(user_id),
         {:ok, user} <- UpdateUser.run(user: user, updates: params) do
      json(conn, user)
    else
      nil -> conn |> put_status(404) |> json(%{error: "user not found"})
      {:error, error} -> conn |> put_status(422) |> json(%{error: inspect(error)})
    end
  end



  def delete(%Conn{} = conn, params) do
    with {:ok, result} <- DeleteUser.run(params) do
      json(conn, result)
    else
      {:error, error} -> conn |> put_status(422) |> json(%{error: inspect(error)})
    end
  end
end
