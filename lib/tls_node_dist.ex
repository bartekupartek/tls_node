defmodule TLSNode_dist do
  @moduledoc """
  TLS IPv6 distribution protocol module.
  """

  @doc """
  Create the listen socket, i.e. the port that this erlang
  node is accessible through.
  Set both "min" and "max" variables, to force the port number to
  this one.
  """
  def listen(name) do
    port = TLSNode.dist_port(name)

    :ok = Application.put_env(:kernel, :inet_dist_listen_min, port)
    :ok = Application.put_env(:kernel, :inet_dist_listen_max, port)

    :inet_tls_dist.listen(name)
  end

  @doc """
  Select this protocol based on node name
  """
  def select(node) do
    :inet_tls_dist.select(node)
  end

  @doc """
  Accepts new connection attempts from other Erlang nodes.
  """
  def accept(listen) do
    :inet_tls_dist.accept(listen)
  end

  @doc """
  Accepts a new connection attempt from another Erlang node.
  Performs the handshake with the other side.
  """
  def accept_connection(accept_pid, socket, my_node, allowed, setup_time) do
    :inet_tls_dist.accept_connection(accept_pid, socket, my_node, allowed, setup_time)
  end

  @doc """
  Setup a new connection to another Erlang node.
  Performs the handshake with the other side.
  """
  def setup(node, type, my_node, long_or_short_names, setup_time) do
    :inet_tls_dist.setup(node, type, my_node, long_or_short_names, setup_time)
  end

  @doc """
  Close a socket.
  """
  def close(listen) do
    :inet_tls_dist.close(listen)
  end

  @doc """
  Childspecs.
  """
  def childspecs() do
    :inet_tls_dist.childspecs()
  end
end
