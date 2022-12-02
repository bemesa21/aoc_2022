defmodule AdventOfCode.Day02 do
  @rules %{
    "A" => %{"X" => :draw, "Y" => :win, "Z" => :lost},
    "B" => %{"X" => :lost, "Y" => :draw, "Z" => :win},
    "C" => %{"X" => :win, "Y" => :lost, "Z" => :draw}
  }

  @shapes_scores %{
    "X" => 1,
    "Y" => 2,
    "Z" => 3,
    "A" => 1,
    "B" => 2,
    "C" => 3
  }

  @outages_scores %{
    :lost => 0,
    :draw => 3,
    :win => 6
  }

  @inverse_rules %{
    "A" => %{"X" => "C", "Y" => "A", "Z" => "B"},
    "B" => %{"X" => "A", "Y" => "B", "Z" => "C"},
    "C" => %{"X" => "B", "Y" => "C", "Z" => "A"}
  }

  @have_to %{
    "X" => :lost,
    "Y" => :draw,
    "Z" => :win
  }

  def part1(input) do
    input
    |> format_input()
    |> rounds_results()
    |> calculate_scores()
  end

  def part2(input) do
    input
    |> format_input()
    |> predict_shapes()
    |> calculate_scores()
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

  defp predict_shapes(encripted_info) do
    Enum.map_reduce(encripted_info, [], fn {p1, p2}, acc ->
      {@have_to[p2], acc ++ [@inverse_rules[p1][p2]]}
    end)
  end
end
