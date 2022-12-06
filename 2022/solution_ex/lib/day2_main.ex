defmodule SolutionEx.Day2Main do
  # Part

  def part1(input_lines) do
    input_lines
    |> Enum.reduce(0, fn strategy, acc ->
      [their_play, our_play] =
        strategy
        |> String.trim()
        |> String.split(" ")

      acc + score(our_play) + score(result(their_play, our_play))
    end)
  end

  def part2(input_lines) do
    input_lines
    |> Enum.reduce(0, fn strategy, acc ->
      [their_play, desired] = strategy |> String.trim() |> String.split(" ")

      acc + score(intended_result(desired)) +
        score(needed_play(intended_result(desired), their_play))
    end)
  end

  defp intended_result("X"), do: :loss
  defp intended_result("Y"), do: :draw
  defp intended_result("Z"), do: :win

  defp needed_play(:win, "A"), do: "Y"
  defp needed_play(:win, "B"), do: "Z"
  defp needed_play(:win, "C"), do: "X"

  defp needed_play(:draw, "A"), do: "X"
  defp needed_play(:draw, "B"), do: "Y"
  defp needed_play(:draw, "C"), do: "Z"

  defp needed_play(:loss, "A"), do: "Z"
  defp needed_play(:loss, "B"), do: "X"
  defp needed_play(:loss, "C"), do: "Y"

  # @spec (String.t(), String.t()) -> :win | :loss | :draw
  defp result("A", "X"), do: :draw
  defp result("A", "Y"), do: :win
  defp result("A", "Z"), do: :loss

  defp result("B", "X"), do: :loss
  defp result("B", "Y"), do: :draw
  defp result("B", "Z"), do: :win

  defp result("C", "X"), do: :win
  defp result("C", "Y"), do: :loss
  defp result("C", "Z"), do: :draw

  defp score(:win), do: 6
  defp score(:draw), do: 3
  defp score(:loss), do: 0

  defp score("X"), do: 1
  defp score("Y"), do: 2
  defp score("Z"), do: 3
end
