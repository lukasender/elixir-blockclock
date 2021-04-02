defmodule BlockClock.Blockchain.Block do

  @doc """
  A Bitcoin Blockchain block as defined by the API (@see https://mempool.space/api/blocks).
  """
  defstruct [
    id: "0000000000000000000000000000000000000000000000000000000000000000",
    height: 0,
    version: 0,
    timestamp: 0,
    tx_count: 0,
    size: 0,
    weight: 0,
    merkle_root: "0000000000000000000000000000000000000000000000000000000000000000",
    previousblockhash: "0000000000000000000000000000000000000000000000000000000000000000",
    mediantime: 0,
    nonce: 0,
    bits: 0,
    difficulty: 0
  ]

  def new(attrs \\ %{}) when is_map(attrs) do
    to_struct(attrs)
  end

  defp to_struct(attrs) do
    # Find the keys within the map
    keys =
      Map.keys(%__MODULE__{})
      |> Enum.filter(fn x -> x != :__struct__ end)

    # Process map, checking for both string / atom keys
    processed_map =
      for key <- keys, into: %{} do
        value = Map.get(attrs, key) || Map.get(attrs, to_string(key))
        { key, value }
      end

    Map.merge(%__MODULE__{}, processed_map)
  end
end
