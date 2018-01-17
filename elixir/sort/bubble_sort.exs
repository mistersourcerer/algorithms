defmodule Sort do
  def bubble([lonely]), do: [lonely]
  def bubble([first, second | rest]) do
    [lower, higher] = order(first, second)
    restart([first, second] ++ rest, [lower] ++ bubble([higher] ++ rest))
  end

  defp restart(value, ordered) when value == ordered, do: value
  defp restart(value, ordered), do: bubble(ordered)

  defp order(first, second) when first < second, do: [first, second]
  defp order(first, second), do: [second, first]
end

ExUnit.start

defmodule SortTest do
  use ExUnit.Case, async: true

  test "does not fail when list has 1 element" do
    assert [1] = Sort.bubble [1]
  end

  test "sorts list with just 2 elements" do
    assert [1, 2] = Sort.bubble [1, 2]
  end

  test "sorts an odd number of elements" do
    assert [1, 2, 3] = Sort.bubble [2, 3, 1]
  end

  test "sorts an even number of elements" do
    assert [1, 2, 3, 4] = Sort.bubble [2, 3, 1, 4]
  end

  test "does not explode on ordered list :P" do
    assert [1, 2, 3, 4] = Sort.bubble [1, 2, 3, 4]
  end
end
