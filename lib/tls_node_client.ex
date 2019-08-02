defmodule TLSNode.Client do
  @moduledoc """
  A module containing the function that determines the port number
  based on a node name.
  """

  @doc """
  erl_distribution wants us to start a worker process.  We don't
  need one, though.
  """
  def start_link() do
    :ignore
  end

  @doc """
  As of Erlang/OTP 19.1, register_node/3 is used instead of
  register_node/2, passing along the address family, 'inet_tcp' or
  'inet6_tcp'. This makes no difference for our purposes.
  """
  def register_node(name, port, _family) do
    register_node(name, port)
  end

  @doc """
  This is where we would connect to epmd and tell it which port
  we're listening on, but since we're epmd-less, we don't do that.
  Need to return a "creation" number between 1 and 3.
  """
  def register_node(_name, _port) do
    {:ok, :rand.uniform(3)}
  end

  @doc """
  The distribution protocol version number has been 5 ever since
  Erlang/OTP R6.
  """
  def port_please(name, _ip) do
    {:port, TLSNode.dist_port(name), 5}
  end

  @doc """
  Since we don't have epmd, we don't really know what other nodes
  there are.
  """
  def names(_hostname) do
    {:error, :address}
  end
end
