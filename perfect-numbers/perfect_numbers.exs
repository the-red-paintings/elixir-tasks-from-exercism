defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: ({ :ok, atom } | { :error, String.t() })
  def classify(1) do { :ok, :deficient } end
  def classify(number) when number < 1 do { :error, "Classification is only possible for natural numbers." } end
  def classify(number) do
    cond do
      aliquots_sum(number) === number -> { :ok, :perfect }
      aliquots_sum(number) > number -> { :ok, :abundant }
      aliquots_sum(number) < number -> { :ok, :deficient }
    end
  end


  defp aliquots_sum(number) do
    1..round(number/2)
    |> Enum.to_list
    |> Enum.filter(fn n -> rem(number,n) == 0 end)
    |> Enum.sum
  end
end
