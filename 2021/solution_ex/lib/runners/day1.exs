input_nums = 
  SolutionEx.read_and_split_file("inputs/day1.txt") 
  |> Enum.map(&(String.to_integer(&1)))

IO.puts("PART 1\n")
input_nums
  |> SolutionEx.Day1Main.part1() 
  |> IO.inspect

IO.puts("PART 2\n")
input_nums
  |> SolutionEx.Day1Main.part2() 
  |> IO.inspect
