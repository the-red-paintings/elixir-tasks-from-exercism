defmodule Diamond do
@doc """
Given a letter, it prints a diamond starting with 'A',
with the supplied letter at the widest point.
"""
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    alphabet = ?A..letter
    |> Enum.to_list
    |> to_string
    |> String.graphemes
    left = String.duplicate(" ", length(alphabet))
    top = build_top alphabet, left ,"", left, false
    bottom = String.reverse build_top Enum.drop(alphabet, -1), left ,"", left, true
    top <> bottom
  end

  def build_top([h|t], <<left::utf8>> <> ltail , "" , <<right::utf8>> <> rtail, before?) do
    if before? do
      "\n" <> ltail <> h <> rtail <> build_top t, ltail, " ", rtail, before?
    else
      ltail <> h <> rtail <> "\n" <> build_top t, ltail, " ", rtail, before?
    end
  end
  def build_top([h|t], <<left::utf8>> <> ltail , mid , <<right::utf8>> <> rtail, before?) do
    if before? do
      "\n" <> ltail <> h <> mid <> h <> rtail <> build_top t, ltail, mid<>"  ", rtail, before?
    else
      ltail <> h <> mid <> h <> rtail <> "\n" <> build_top t, ltail, mid<>"  ", rtail, before?
    end
  end
  def build_top([], _ , _ , _, _) do
    ""
  end

end
