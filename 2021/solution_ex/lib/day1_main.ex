defmodule SolutionEx.Day1Main do
  # Part 1
  def part1([h | list]), do: do_part1(list, h, 0)

  defp do_part1([], _, count), do: count

  defp do_part1([h | rest], previous, count) when h > previous, do: do_part1(rest, h, count + 1)
  defp do_part1([h | rest], _, count), do: do_part1(rest, h, count)

  # Part 2

  def part2([one, two, three | rest]) do
    first_sum = one + two + three

    do_part2([two, three | rest], first_sum, 0)
  end

  defp do_part2([], _, count), do: count
  defp do_part2([_], _, count), do: count
  defp do_part2([_, _], _, count), do: count

  defp do_part2([one, two, three | rest], previous, count) do
    new_sum = one + two + three

    if new_sum > previous do
      do_part2([two, three | rest], new_sum, count + 1)
    else
      do_part2([two, three | rest], new_sum, count)
    end
  end
end
