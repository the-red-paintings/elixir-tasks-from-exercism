defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    list = Regex.scan(~r/(*UTF)[\p{L}0-9-]+/i, String.downcase(sentence))
    |>List.flatten
    calculate(list, Map.new)
  end

  def calculate(words, map) do
    cond do
      Enum.count(words) == 0 -> map
      Enum.count(words) == 1 ->
        Map.put(map, Enum.at(words, 0), 1)
      Enum.count(words) > 1 ->
        [head|tail] = words
        calculate(Enum.filter(tail, fn x -> x !== head end), Enum.into(map, Map.put(map, head, Enum.count(words, fn x -> x === head end))))
    end
  end

end
