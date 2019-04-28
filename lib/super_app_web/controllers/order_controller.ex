defmodule SuperAppWeb.OrderController do
  use SuperAppWeb, :controller

  alias Plug.Conn
  alias SuperApp.Operations.CreateOrder

  def create(%Conn{} = conn, %{"user_email" => user_email, "items" => items} = _params) do
    with {:ok, order} <- CreateOrder.run(user_email: user_email, items: items) do
      json(conn, order)
    else
      {:error, error} -> conn |> put_status(422) |> json(%{error: inspect(error)})
    end
  end
end
