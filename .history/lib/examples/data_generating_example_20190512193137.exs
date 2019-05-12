# contract = [
#   %{name: :a, opts: [type: :integer, numericality: %{gt: 0, lt: 10}]},
#   %{name: :b, opts: [type: :string, length: %{in: 2..10}]},
#   %{name: :c, opts: [type: :map, inner: %{color: [in: ~w(blue green)]}]}
# ]

# contract |> ExopData.generate() |> Enum.take(10) |> IO.inspect()

CreateUser |> ExopData.generate() |> Enum.take(10) |> IO.inspect()
