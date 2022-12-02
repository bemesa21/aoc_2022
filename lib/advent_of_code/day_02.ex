defmodule AdventOfCode.Day02 do
  @rules %{
    "A" => %{"X" => :draw, "Y" => :win, "Z" => :lost},
    "B" => %{"X" => :lost, "Y" => :draw, "Z" => :win},
    "C" => %{"X" => :win, "Y" => :lost, "Z" => :draw}
  }

  @shapes_scores %{
    "X" => 1,
    "Y" => 2,
    "Z" => 3
  }

  @outages_scores %{
    :lost => 0,
    :draw => 3,
    :win => 6
  }

  def part1(input) do
    input
    |> format_input()
    |> rounds_results()
    |> calculate_scores()
  end

  def part2(_args) do
  end

  def format_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(String.split(&1, " ") |> List.to_tuple()))
  end

  defp rounds_results(rounds) do
    Enum.map_reduce(rounds, [], fn {p1, p2}, acc -> {@rules[p1][p2], acc ++ [p2]} end)
  end

  defp calculate_scores({results, selected_shapes}) do
    results
    |> Enum.zip(selected_shapes)
    |> Enum.reduce(0, fn {result, shape}, acc ->
      @outages_scores[result] + @shapes_scores[shape] + acc
    end)
  end
end
