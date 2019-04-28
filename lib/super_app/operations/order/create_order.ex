defmodule SuperApp.Operations.CreateOrder do
  use Exop.Operation
  import Ecto.Changeset
  alias SuperApp.{Repo, User, Order, OrderItem, UserQuery}

  parameter :user_id, type: :integer, numericality: %{greater_than: 0}

  parameter :items, type: :list, length: %{min: 1}, list_item: %{
    inner: %{
      "name" => [type: :string, length: %{min: 1}],
      "price" => [type: :float, numericality: %{greater_than: 0}],
      "quantity" => [type: :integer, numericality: %{greater_than: 0}]
    }
  }

  def process(params) do
    with %User{} = user <- UserQuery.find(params.user_id),
         {:ok, %Order{} = order} <- create_order(user),
         :ok <- add_order_items(order, params.items) do
      # order
      order |> Repo.preload(:order_items)
    else
      nil -> {:error, :unknown_user}
      error -> error
    end
  end

  defp create_order(user) do
    %Order{}
    |> cast(%{number: order_number()}, [:number])
    |> put_assoc(:user, user)
    |> Repo.insert(returning: true)
  end

  defp add_order_items(order, items) do
    fields = [:name, :price, :quantity]

    Enum.each(items, fn (item) ->
      item = Map.take(item, fields)

      %OrderItem{}
      |> cast(item, fields)
      |> put_assoc(:order, order)
      |> Repo.insert!()
    end)
  end

  defp order_number do
    {:ok, now} = DateTime.now("Etc/UTC")
    # DateTime.to_unix(now)
    DateTime.to_unix(now, :nanosecond)
  end
end
