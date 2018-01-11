defmodule Sort do
  def bubble([lonely | []]) do
    [lonely]
  end

  def bubble(values) do
    sorted = reorder values
    if values == sorted, do: sorted, else: bubble(sorted)
  end

  defp reorder([last | []]) do
    [last]
  end

  defp reorder([current, next | []]) do
    ordered current, next
  end

  defp reorder([current, next | rest]) do
    [h | t] = ordered(current, next) ++ rest
    [h] ++ reorder(t)
  end

  defp ordered(current, next) do
    if current < next, do: [current, next], else: [next, current]
  end
end

ExUnit.start

defmodule SortTest do
  use ExUnit.Case, async: true
  require Sort

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
