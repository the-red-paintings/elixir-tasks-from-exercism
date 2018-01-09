defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    string
    |> to_charlist
    |> Enum.reverse
    |> calc(0,0)
  end

  defp calc([h|tail], acc, i) do
    case h do
      49 -> calc(tail, acc+(:math.pow(2, i)), i+1)
      48 -> calc(tail, acc, i+1)
      _ -> 0
    end
  end

  defp calc([], acc, _) do
    acc |> round
  end
end
