defmodule TLSNode do
  @moduledoc """
  A module containing the function that determines the port number
  based on a node name.
  """

  @doc """
  Figure out the base port.  If not specified using the
  inet_dist_base_port kernel environment variable, default to
  4370, one above the epmd port.
  """
  def dist_port(name) when is_atom(name) do
    dist_port(Atom.to_string(name))
  end

  def dist_port(name) when is_list(name) do
    dist_port(List.to_string(name))
  end

  def dist_port(name) when is_binary(name) do
    base_port = Application.get_env(:kernel, :inet_dist_base_port, 4370)

    node_name = Regex.replace(~r/@.*$/, name, "")

    offset =
      case Regex.run(~r/[0-9]+$/, node_name) do
        nil ->
          0

        [offset_as_string] ->
          String.to_integer(offset_as_string)
      end

    base_port + offset
  end
end
