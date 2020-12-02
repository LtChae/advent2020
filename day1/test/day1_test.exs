defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "solves the problem with two values" do
    report = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    assert Day1.solve_for_two(report) == 514579
  end

  test "solves the problem with three values" do
    report = [
      1721,
      979,
      366,
      299,
      675,
      1456
    ]

    assert Day1.solve_for_three(report) == 241861950
  end
end
