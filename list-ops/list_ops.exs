defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    calc_count(l, 0)
  end
  defp calc_count([], n) do n end
  defp calc_count([h|t], n) do calc_count(t, n+1) end

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverse(l, [])
  end
  defp do_reverse([], acc) do acc  end
  defp do_reverse([h|t], acc) do  do_reverse(t, [h|acc]) end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    do_map(l, f, []) |> reverse
  end
  defp do_map([], f, acc) do acc end
  defp do_map([h|t], f, acc) do do_map(t, f, [f.(h)|acc]) end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    do_filter(l,f,[]) |> reverse
  end
  defp do_filter([], f, acc) do acc end
  defp do_filter([h|t], f,acc) do
    cond do
      f.(h) -> do_filter(t, f, [h|acc])
      true -> do_filter(t, f, acc)
    end
   end
  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    do_reduce(l, acc, f)
  end
  defp do_reduce([], acc, f) do acc end
  defp do_reduce([h|t], acc, f) do do_reduce(t,f.(h,acc), f) end
  @spec append(list, list) :: list
  def append(a, b) do
    do_append(reverse(a), b)
  end
  defp do_append([], b), do: b
  defp do_append([h|t], b), do: do_append(t, [h|b])
  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(ll) |> reduce([], &(append(&1, &2)))
  end
end
