defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) do
    do_insert(tree, data)
  end

  defp do_insert(nil, data) do
    data|> new
  end

  defp do_insert(%{data: node_data, left: left, right: right}, data) do
    cond do
      data <= node_data -> %{data: node_data, left: do_insert(left,data), right: right}
      data > node_data -> %{data: node_data, left: left , right: do_insert(right, data)}
    end
  end

  def max(node) do
    find_max(node, node.data)
  end


  defp find_max(nil, val) do val end

  defp find_max(node, value) do
    find_max(node.right, node.data)
  end
  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    traverse(tree) |> List.flatten |> Enum.sort
  end

  def size(tree) do
    case tree do
      nil -> 0
      _ -> size(tree.left)+size(tree.right)+1
    end
  end

  # def size(nil) do 0 end


  defp traverse(tree) do
    case tree do
      nil -> []
      _ ->
      left =  [tree.data| traverse(tree.left)]
      right =  [traverse(tree.right)]
      [left|right]
    end
  end


end
