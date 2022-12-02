defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  @test_input """
  1000
  2000
  3000

  4000

  5000
  6000

  7000
  8000
  9000

  10000
  """

  test "part1" do
    result = part1(@test_input)

    assert result == 24000
  end

  test "part2" do
    result = part2(@test_input)
    assert result == 45000
  end

  test "calories_per_elf/1 returns a list of integer lists" do
    assert calories_per_elf(@test_input) == [
             [1000, 2000, 3000],
             [4000],
             [5000, 6000],
             [7000, 8000, 9000],
             [10000]
           ]
  end
end
