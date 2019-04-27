defmodule SuperApp.OrderItemQuery do
  alias SuperApp.{Repo, OrderItem}

  def find(item_id), do: Repo.get(OrderItem, item_id)
end
