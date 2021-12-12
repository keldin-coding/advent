defmodule SolutionEx.Day1MainTest do
  use ExUnit.Case
  doctest SolutionEx

  test "part 1" do
    assert SolutionEx.Day1Main.part1(test_input()) == 7
  end

  test "part 2" do
    assert SolutionEx.Day1Main.part2(test_input()) == 5
  end

  def test_input do
    ["199", "200", "208", "210", "200", "207", "240", "269", "260", "263"] |> Enum.map(&(String.to_integer(&1)))
  end
end
