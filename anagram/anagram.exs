defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter fn c -> is_anagram? base,c end
  end

  def is_anagram?([], []) do
    true
  end
  def is_anagram?([], c) do
    false
  end
  def is_anagram?([h|t], candidate) when is_list candidate do
    is_anagram? t,List.delete(candidate, h)
  end

  def is_anagram?(base,candidate) do
    cond do
      String.downcase(base) == String.downcase(candidate) -> false
      String.length(base) == String.length(candidate) -> is_anagram?(String.graphemes(String.downcase base), String.graphemes(String.downcase candidate))
      true -> false
    end
  end
end
