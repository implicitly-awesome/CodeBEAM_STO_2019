defmodule SuperApp.Operations.Order.CreateOrderPropTest do
  use SuperApp.DataCase
  use ExopData

  alias SuperApp.{User, Order}
  alias SuperApp.Operations.CreateOrder

  describe "with unknown user id" do
    property "returns an error" do
      check_operation(CreateOrder, [], fn _params ->
        {:error, :unknown_user}
      end)
    end
  end

  property "creates an order" do
    {:ok, user} =
      %User{}
      |> cast(%{name: "test1", email: "test1@test.com"}, ~w(name email)a)
      |> Repo.insert(returning: true)

    custom = ~g[user_id: user.id]

    check all params <- generate(CreateOrder, generators: custom) do
      assert {:ok, %Order{} = order} = CreateOrder.run(params)
      assert is_integer(order.number) and order.number > 0
      assert is_list(order.order_items) and Enum.count(order.order_items) > 0
    end
  end
end
