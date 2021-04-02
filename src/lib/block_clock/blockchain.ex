defmodule BlockClock.Blockchain do
  @moduledoc """
  The Blockchain context.
  """

  alias BlockClock.Blockchain.Block
  alias BlockClock.Store

  @doc """
  Creates a block.
  """
  def create_block(%{} = attrs) do
    block = Block.new(attrs)
    Store.set_latest_block(block)

    block
  end

end
