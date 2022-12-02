defmodule AdventOfCode.Day01 do
  def part1(input) do
    input
    |> calories_per_elf()
    |> Enum.map(&sum_elf_calories/1)
    |> Enum.max()
  end

  def part2(input) do
    input
    |> calories_per_elf()
    |> Enum.map(&sum_elf_calories/1)
    |> Enum.sort()
    |> Enum.slice(-3..-1)
    |> Enum.sum()
  end

  def calories_per_elf(input) do
    input
    |> String.split("\n")
    |> Enum.chunk_while([], &chunk_by_empty_str/2, &after_chunk/1)
  end

  defp chunk_by_empty_str(elem, acc) do
    if elem == "" do
      {:cont, acc, []}
    else
      {:cont, acc ++ [String.to_integer(elem)]}
    end
  end

  defp after_chunk(acc) do
    if acc == [] do
      {:cont, []}
    else
      {:cont, acc, []}
    end
  end

  defp sum_elf_calories(calories) do
    Enum.sum(calories)
  end
end
