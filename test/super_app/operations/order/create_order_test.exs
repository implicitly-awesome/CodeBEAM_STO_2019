defmodule SuperApp.Operations.Order.CreateOrderTest do
  use SuperApp.DataCase

  alias SuperApp.{User, Order}
  alias SuperApp.Operations.CreateOrder

  setup do
    {:ok, user} =
      %User{}
      |> cast(%{name: "test1", email: "test1@test.com"}, ~w(name email)a)
      |> Repo.insert(returning: true)

    items =
      [
        %{"name" => "item_1", "price" => 1.1, "quantity" => 1},
        %{"name" => "item_2", "price" => 2.2, "quantity" => 2},
        %{"name" => "item_3", "price" => 3.3, "quantity" => 3}
      ]

    {:ok, user: user, items: items}
  end

  describe "with malformed user id" do
    test "returns an error", %{items: items} do
      assert CreateOrder.run(user_id: "123", items: items) == {:error, {:validation, %{
        user_id: ["not a number", "has wrong type"]
      }}}
    end
  end

  describe "with unknown user id" do
    test "returns an error", %{items: items} do
      assert CreateOrder.run(user_id: 777, items: items) == {:error, :unknown_user}
    end
  end

  describe "with empty items" do
    test "returns an error", %{user: user} do
      assert CreateOrder.run(user_id: user.id, items: []) == {:error, {:validation, %{
        items: ["length must be greater than or equal to 1"]
      }}}
    end
  end

  describe "with malformed item" do
    test "returns an error", %{user: user} do
      items = [
        %{"name" => "item_1", "price" => 1.1, "quantity" => 1},
        %{"name" => "item_1", "price" => 1.1, "quantity" => "1"}
      ]

      assert CreateOrder.run(user_id: user.id, items: items) == {:error, {:validation, %{
        "items[1][:quantity]" => ["not a number", "has wrong type"]
      }}}
    end
  end

  describe "with valid params" do
    test "creates an order", %{user: user, items: items} do
      assert {:ok, %Order{} = order} = CreateOrder.run(user_id: user.id, items: items)
      assert is_integer(order.number) and order.number > 0
      assert is_list(order.order_items) and Enum.count(order.order_items) > 0
    end
  end
end