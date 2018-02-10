defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode("") do
    ""
  end
  def encode(string) do
    separate string, [], ""
  end


  defp separate(<<c::utf8>> <> tail, [], res) do
    separate tail, [<<c::utf8>>], res
  end

  defp separate(<<c::utf8>> <> tail, acc, res) do
    if <<c::utf8>> == hd acc do
      separate tail,[<<c::utf8>>|acc],res
    else
      cond do
        Enum.count(acc) == 1 -> separate(<<c::utf8>> <> tail, [], (res <> hd(acc)))
        true -> separate(<<c::utf8>> <> tail, [], (res <> to_string(Enum.count(acc)) <> hd(acc)))
      end
    end
  end

  defp separate("" , acc, res) do
    if Enum.count(acc) == 1 do
      res <> hd(acc)
    else
      res <> to_string(Enum.count(acc)) <> hd(acc)
    end
  end



  @spec decode(String.t) :: String.t
  def decode(string) do
    decode string, "", ""
  end

  defp decode(<<c::utf8>> <> rest, acc, res) do
    if Regex.match?(~r/\d/, <<c::utf8>>) do
     decode rest, acc <> <<c::utf8>>, res
    else
      case acc do
        "" -> decode rest, "" , res <> <<c::utf8>>
        _ -> {number, _} = Integer.parse(acc)
        decode rest, "", res <> String.duplicate(<<c::utf8>>, number)
      end
    end
  end
  defp decode("", acc ,res) do
    res
  end

end
