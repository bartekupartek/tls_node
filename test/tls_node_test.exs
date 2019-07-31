defmodule TLSNodeTest do
  use ExUnit.Case
  doctest TLSNode

  test "dist_port/1" do
    assert TLSNode.dist_port(:"app1@pc.home") == 4371
  end
end
