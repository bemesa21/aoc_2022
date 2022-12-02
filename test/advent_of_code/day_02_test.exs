defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @test_input """
  A Y
  B X
  C Z
  """

  test "part1" do
    result = part1(@test_input)
    assert result == 15
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end

  test "format_input/1 returns a list of tuples" do
    assert format_input(@test_input) == [{"A", "Y"}, {"B", "X"}, {"C", "Z"}]
  end
end
