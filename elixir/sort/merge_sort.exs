defmodule Sort do
  def merge([lonely]), do: [lonely]
  def merge(values) do
    {left, right} = Enum.split values, length(values) / 2 |> round
    reorder merge(left), merge(right)
  end

  defp reorder(left, []),  do: left
  defp reorder([], right), do: right
  defp reorder([first | left], [second | right]) when first > second,
    do: [second] ++ reorder([first] ++ left, right)
  defp reorder([first | left], [second | right]),
    do: [first] ++ reorder(left, [second] ++ right)
end

ExUnit.start

defmodule SortTest do
  use ExUnit.Case, async: true

  test "does not fail when list has 1 element" do
    assert [1] = Sort.merge [1]
  end

  test "sorts list with just 2 elements" do
    assert [1, 2] = Sort.merge [1, 2]
  end

  test "sorts an odd number of elements" do
    assert [1, 2, 3] = Sort.merge [2, 3, 1]
  end

  test "sorts an even number of elements" do
    assert [1, 2, 3, 4] = Sort.merge [2, 3, 1, 4]
  end
end
