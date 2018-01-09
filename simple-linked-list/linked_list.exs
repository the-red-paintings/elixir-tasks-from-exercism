defmodule LinkedList do
  @opaque t :: tuple()
  defstruct data: {}, next: nil
  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
def push(list, item) do
  {item, list}
end
# cond do
# true ->
# list = {1, {1,nil}}
# #IO.puts(elem(list, 1))
# push(elem(list, 1), elem)
# end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list) do
    count_length(list, 0)
  end
  defp count_length({}, n), do: n
  defp count_length({_, t}, n), do: count_length(t, n + 1)

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    case list do
      {} -> true
      _ -> false
    end
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    case list do
      {} -> {:error, :empty_list}
      {x , _} -> {:ok, x}
    end
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    case list do
      {} -> {:error, :empty_list}
      {_ , x} -> {:ok, x}
    end
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    case list do
      {} -> {:error, :empty_list}
      {h , t} -> {:ok, h, t}
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    List.foldr(list, new(), &push(&2, &1))
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    list |> do_to_list([]) |> Enum.reverse()
  end
  defp do_to_list({}, acc), do: acc
  defp do_to_list({h, t}, acc), do: do_to_list(t, [h|acc])

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    do_reverse(list, new())
  end
  def do_reverse({}, acc), do: acc
  def do_reverse({h, t}, acc), do: do_reverse(t, push(acc, h))
end
