defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @alfabet "abcdefghijklmnopqrstuwxyz"
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    Enum.map(String.graphemes(text), fn (char) -> String.at(@alfabet, elem(:binary.match(@alfabet,char), 0)+ shift) end)|>to_string
  end
end

