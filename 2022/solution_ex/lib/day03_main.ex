defmodule SolutionEx.Day03Main do
  def part1(input_lines) do
    input_lines
    |> Enum.map(fn line ->
      compartment_max = (String.length(line) / 2) |> floor()
      {first, second} = line |> String.to_charlist() |> Enum.split(compartment_max)

      Enum.find(first, fn i -> Enum.member?(second, i) end)
    end)
    |> Enum.reduce(0, fn letter, acc ->
      acc + priority_for_letter(letter)
    end)
  end

  def part2(input_lines) do
    input_lines
    |> Enum.map(&String.to_charlist(&1))
    |> Enum.map(&MapSet.new(&1))
    |> Enum.chunk_every(3)
    |> Enum.reduce(0, fn [first, second, third], sum ->
      val =
        first
        |> MapSet.intersection(second)
        |> MapSet.intersection(third)
        |> MapSet.to_list()
        |> Enum.at(0)
        |> priority_for_letter()

      sum + val
    end)
  end

  # Lowercase letters
  defp priority_for_letter(letter) when letter >= 97 do
    letter - 97 + 1
  end

  # reset to 0, add one for A, then add 26 because uppercase is worth more than lower
  defp priority_for_letter(letter) when letter < 97 and letter >= 65 do
    letter - 65 + 1 + 26
  end
end
