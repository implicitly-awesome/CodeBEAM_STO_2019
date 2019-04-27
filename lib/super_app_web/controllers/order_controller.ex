defmodule SuperAppWeb.OrderController do
  use SuperAppWeb, :controller

  alias Plug.Conn
  alias SuperApp.Operations.CreateOrder

  def create(%Conn{} = conn, %{"user_id" => user_id, "items" => items} = _params) do
    with {:ok, order} <- CreateOrder.run(user_id: user_id, items: items) do
      json(conn, order)
    else
      {:error, error} -> conn |> put_status(422) |> json(%{error: inspect(error)})
    end
  end
end
