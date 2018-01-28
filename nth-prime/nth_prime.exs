defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count <= 0 do raise ArgumentError, message: "must be more then 0" end
  def nth(count) do
    count |> nth 0,1,0
  end

  defp nth(target,count,i ,acc) when target == count-1 do  acc end
  defp nth(target,curreent,i ,acc) do
    cond do
      i |> is_prime -> nth(target, curreent+1, i+1, i)
      true -> nth(target, curreent, i+1 ,acc)
    end
  end

  def is_prime(x), do: (2..x |> Enum.filter(fn a -> rem(x, a) == 0 end) |> length()) == 1

end
