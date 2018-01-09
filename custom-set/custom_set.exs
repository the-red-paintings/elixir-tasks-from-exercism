defmodule CustomSet do

  defstruct map: Map.new

  @opaque t :: %__MODULE__{map: map}

  #@spec new(Enum.t) :: t
  def new(enumerable) do
    %CustomSet{map: Enum.reduce(enumerable, %{}, fn(item,acc) -> Map.put(acc, item, :empty) end)}
  end

  #@spec empty?(t) :: boolean
  # custom_set |>
  #       Map.values |>
  #       length
  def empty?(%CustomSet{map: custom_set}) do
    Enum.empty?(custom_set)
  end

  #@spec contains?(t, any) :: boolean
  def contains?(%CustomSet{map: custom_set}, element) do
    Map.has_key?(custom_set, element)
  end

  #@spec subset?(t, t) :: boolean
  def subset?(%CustomSet{map: custom_set_1}, %CustomSet{map: custom_set_2}) do
    Enum.all?(custom_set_1, fn(key) -> Map.has_key?(custom_set_2, elem(key, 0)) end)
  end

  #@spec disjoint?(t, t) :: boolean
  def disjoint?(%CustomSet{map: custom_set_1}, %CustomSet{map: custom_set_2}) do
    res = [Enum.any?(custom_set_1, fn(key) -> Map.has_key?(custom_set_2, elem(key, 0)) end) | []]
    res = [Enum.any?(custom_set_2, fn(key) -> Map.has_key?(custom_set_1, elem(key, 0)) end) | res]
    Enum.any?(res, fn x -> x == false end)
  end

  #@spec equal?(t, t) :: boolean
  def equal?(%CustomSet{map: custom_set_1}, %CustomSet{map: custom_set_2}) do
    custom_set_1 == custom_set_2
  end

  #@spec add(t, any) :: t
  def add(%CustomSet{map: custom_set}, element) do
    %CustomSet{map: Map.put(custom_set, element, :empty)}
  end

  #@spec intersection(t, t) :: t
  def intersection(%CustomSet{map: custom_set_1}, %CustomSet{map: custom_set_2}) do
    %CustomSet{map: Enum.filter(custom_set_1, fn(item) -> Map.has_key?(custom_set_2, elem(item, 0)) end) |>
    Enum.into(%{})}
  end

  #@spec difference(t, t) :: t
  def difference(%CustomSet{map: custom_set_1}, %CustomSet{map: custom_set_2}) do
    %CustomSet{map: Enum.reject(custom_set_1, fn(item) -> Map.has_key?(custom_set_2, elem(item, 0)) end) |>
    Enum.into(%{})}
  end

  #@spec union(t, t) :: t
  def union(%CustomSet{map: custom_set_1}, %CustomSet{map: custom_set_2}) do
    %CustomSet{map: Enum.into(custom_set_1, custom_set_2)}
  end
end
