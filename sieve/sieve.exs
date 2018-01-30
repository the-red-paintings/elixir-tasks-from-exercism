defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) do
    list = 2..limit |> Enum.to_list
    filter list, list
  end
  defp filter([h|t], acc) do
    if  :math.pow(h, 2) > List.last t do
      acc
    else
      filter(t ,acc -- Enum.filter(t, fn x -> rem(x, h) == 0 end))
    end
  end

end
