{:ok, input_lines} = File.read("inputs/day1.txt")

IO.puts("PART 1\n")
input_lines
  |> String.split("\n")
  |> SolutionEx.Day1Main.part1() 
  |> IO.inspect

IO.puts("\n\nPART 2\n")
input_lines
  |> String.split("\n")
  |> SolutionEx.Day1Main.part2() 
  |> IO.inspect
