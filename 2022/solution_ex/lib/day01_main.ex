defmodule SolutionEx.Day01Main do
  # Part

  def part1(input_lines) do
    input_lines
    |> sum_by_elf()
    |> Enum.max(fn {a, _}, {b, _} -> a >= b end)
  end

  def part2(input_lines) do
    input_lines
    |> sum_by_elf()
    |> Enum.sort(fn {a, _}, {b, _} -> a >= b end)
    |> Enum.slice(0..2)
    |> Enum.reduce(0, fn {elf, _}, acc -> acc + elf end)
  end

  defp sum_by_elf(lines) do
    lines
    |> Enum.slice(0..-2//1)
    |> Enum.reduce([0], fn x, [elf | acc] ->
      if x == "" do
        [0, elf | acc]
      else
        val = String.trim(x) |> String.to_integer()

        [elf + val | acc]
      end
    end)
    |> Enum.reverse()
    |> Enum.with_index()
  end
end
