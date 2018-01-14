defmodule Hexadecimal do
  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """
  @convert_map  %{"0" => 0,"1" =>1,"2" =>2,"3" =>3,"4" =>4,"5" =>5,"6" =>6,"7" =>7,"8" =>8,"9" =>9, "A" =>10, "B" =>11,
  "C" => 12, "D" => 13, "E" => 14, "F" => 15}

  @spec to_decimal(binary) :: integer
  def to_decimal(hex) do
    hex
    |> String.graphemes
    |> Enum.reverse
    |> to_decimal 0, 0
  end

  defp to_decimal([h|t], acc, power) do
    case @convert_map[String.upcase(h)] do
      nil -> 0
      _ -> to_decimal(t, acc+(@convert_map[String.upcase(h)]*:math.pow(16,power)), power+1)
    end
  end

  defp to_decimal([], acc, _) do
    acc |> round
  end
end
