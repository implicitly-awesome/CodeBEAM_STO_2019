# defmodule SuperAppWeb.OrderController do
#   use SuperAppWeb, :controller

#   alias Plug.Conn

#   def create(%Conn{} = conn, %{"user_id" => user_id, } = _params) do
#     with {:ok, user} <- CreateOrder.run(name: name, email: email) do
#       json(conn, user)
#     else
#       {:error, error} -> conn |> put_status(422) |> json(%{error: inspect(error)})
#     end
#   end
# end
