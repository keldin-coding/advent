defmodule SolutionEx.Day04Main do
  # Part

  def part1(input_lines) do
    input_lines
    |> Enum.map(fn elves ->
      [first, second] = String.split(elves, ",")

      {convert_to_range(first), convert_to_range(second)}
    end)
    |> Enum.count(fn {first, second} ->
      first_set = MapSet.new(first)
      second_set = MapSet.new(second)

      MapSet.subset?(first_set, second_set) || MapSet.subset?(second_set, first_set)
    end)
  end

  def part2(input_lines) do
    input_lines
    |> Enum.map(fn elves ->
      [first, second] = String.split(elves, ",")

      {convert_to_range(first), convert_to_range(second)}
    end)
    |> Enum.count(fn {a, b} ->
      Enum.member?(a, b.first) || Enum.member?(a, b.last) || Enum.member?(b, a.first) || Enum.member?(b, a.last)
    end)
  end

  defp convert_to_range(str) do
    [beginning, ending] = String.split(str, "-")

    String.to_integer(beginning)..String.to_integer(ending)
  end
end
