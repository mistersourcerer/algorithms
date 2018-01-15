defmodule Sort do
  def bubble([lonely]), do: [lonely]
  def bubble(values),   do: next_pass(values, reorder(values))

  defp next_pass(values, sorted) when values == sorted, do: sorted
  defp next_pass(_, sorted),                            do: bubble(sorted)

  defp reorder([last]),               do: [last]
  defp reorder([current, next | []]), do: ordered current, next
  defp reorder([current, next | rest]) do
    [h | t] = ordered(current, next) ++ rest
    [h] ++ reorder(t)
  end

  defp ordered(current, next) when current < next, do: [current, next]
  defp ordered(current, next),                     do: [next, current]
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
end
