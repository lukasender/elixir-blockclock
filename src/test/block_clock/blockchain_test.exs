defmodule BlockClock.BlockchainTest do
  use ExUnit.Case

  alias BlockClock.Blockchain
  alias BlockClock.Blockchain.Block

  @valid_attrs_map %{
    bits: 42,
    difficulty: 42,
    height: 42,
    id: "some id",
    mediantime: 42,
    merkle_root: "some merkle_root",
    nonce: 42,
    previousblockhash: "some previousblockhash",
    size: 42,
    timestamp: 42,
    tx_count: 42,
    version: 42,
    weight: 42
  }

  @valid_attrs_map_string_keys %{
    "bits" => 42,
    "difficulty" => 42,
    "height" => 42,
    "id" => "some id",
    "mediantime" => 42,
    "merkle_root" => "some merkle_root",
    "nonce" => 42,
    "previousblockhash" => "some previousblockhash",
    "size" => 42,
    "timestamp" => 42,
    "tx_count" => 42,
    "version" => 42,
    "weight" => 42
  }

  test "create_block/1 with valid data creates a block" do
    assert %Block{} = block = Blockchain.create_block(@valid_attrs_map)
    assert block.bits == 42
    assert block.difficulty == 42
    assert block.height == 42
    assert block.id == "some id"
    assert block.mediantime == 42
    assert block.merkle_root == "some merkle_root"
    assert block.nonce == 42
    assert block.previousblockhash == "some previousblockhash"
    assert block.size == 42
    assert block.timestamp == 42
    assert block.tx_count == 42
    assert block.version == 42
    assert block.weight == 42
  end

  test "create_block/1 with valid data map creates a block" do
    assert %Block{} = block = Blockchain.create_block(@valid_attrs_map_string_keys)
    assert block.bits == 42
    assert block.difficulty == 42
    assert block.height == 42
    assert block.id == "some id"
    assert block.mediantime == 42
    assert block.merkle_root == "some merkle_root"
    assert block.nonce == 42
    assert block.previousblockhash == "some previousblockhash"
    assert block.size == 42
    assert block.timestamp == 42
    assert block.tx_count == 42
    assert block.version == 42
    assert block.weight == 42
  end
end
