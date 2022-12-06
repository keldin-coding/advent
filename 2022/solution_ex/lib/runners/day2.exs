{:ok, input_lines} = File.read("inputs/day2.txt")

IO.puts("PART 1\n")
input_lines
  |> String.trim()
  |> String.split("\n")
  |> SolutionEx.Day2Main.part1()
  |> IO.inspect

IO.puts("\n\nPART 2\n")
input_lines
  |> String.trim()
  |> String.split("\n")
  |> SolutionEx.Day2Main.part2()
  |> IO.inspect
