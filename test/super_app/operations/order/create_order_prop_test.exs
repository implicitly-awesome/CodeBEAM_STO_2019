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
    before = Repo.aggregate(Order, :count, :id)

    {:ok, user} =
      %User{}
      |> cast(%{name: "test1", email: "test1@test.com"}, ~w(name email)a)
      |> Repo.insert(returning: true)

    custom = ~g[user_id: user.id]

    check all params <- generate(CreateOrder, generators: custom) do
      result = CreateOrder.run(params)

      assert {:ok, %Order{} = order} = result
      assert is_integer(order.number) and order.number > 0
      assert is_list(order.order_items) and Enum.count(order.order_items) > 0
    end

    assert Repo.aggregate(Order, :count, :id) > before
  end

  # defmodule Test do
  #   use Exop.Operation
  #   parameter :a, type: :list, list_item: %{type: :integer}, length: %{min: 1}
  #   def process(params) do
  #     if Enum.member?(params.a, 12), do: [12], else: Enum.reverse(params.a)
  #   end
  # end

  # property "reverse list" do
  #   check all params <- ExopData.generate(Test) do
  #     IO.inspect(params.a)
  #     assert Test.run(params) == {:ok, Enum.reverse(params.a)}
  #   end
  # end
end
