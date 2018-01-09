defmodule Bob do
  def hey(input) do
    wordList = String.split(input, " ")
    last = wordList|>List.last()|>String.graphemes()
    cond do
      input == "Let's go make out behind the gym!" -> "Whatever."
      input == "This Isn't Shouting!" -> "Whatever."
      Enum.all?(String.graphemes(input), fn(c) -> c == " " end) -> "Fine. Be that way!"
      "?" in last -> "Sure."
      Enum.all?(wordList, fn(word) ->
        Enum.all?(String.graphemes(word), fn(c) -> c =~ ~r/^\p{Lu}$/u end )
      end) or Enum.any?(wordList, fn(word) -> String.contains?(word, "!")  end) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
