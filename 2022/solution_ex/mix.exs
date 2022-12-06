defmodule SolutionEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :solution_ex,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp aliases() do
    [
      problem: &invoke_problem/1
    ]
  end

  defp invoke_problem([problem_number]) do
    # IO.puts("and we got #{problem_number}")
    padded_num = problem_number |> String.pad_leading(2, "0")

    Mix.Task.run("run", ["./lib/runners/day#{padded_num}.exs"])
  end
end
