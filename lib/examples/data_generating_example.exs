explicit_contract = [
  %{name: :a, opts: [type: :integer, numericality: %{greater_than: 0, less_than: 10}]},
  %{name: :b, opts: [type: :integer, numericality: %{greater_than: 10}]}
]

defmodule MyOperation do
  use Exop.Operation

  parameter :a, type: :string, length: %{min: 5}
  parameter :b, type: :map, inner: %{
    c: [type: :list, list_item: [type: :atom], length: %{is: 2}]
  }

  def process(params), do: params
end

MyOperation |> ExopData.generate() |> Enum.take(5) |> IO.inspect()
