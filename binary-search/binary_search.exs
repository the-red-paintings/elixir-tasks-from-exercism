defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _) do :not_found end
  def search(numbers, key) do
    do_search(numbers,0, tuple_size(numbers)-1, key)
  end
  defp do_search(numbers, first, last, key) do
    middle =  round((first+last) / 2) -1
    IO.inspect(first)
    IO.puts("----------")
    IO.inspect(last)
    cond do
      key == numbers|> elem(middle) -> {:ok, middle}
      key < numbers|> elem(middle) -> do_search(numbers,first, middle-1, key)
      true -> do_search(numbers,middle + 1, last, key)
    end
  end
end
