defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def solve(passwords, validator) do
    passwords
    |> Enum.map(&parse_line/1)
    |> Enum.filter(validator)
    |> Enum.count()
  end

  def parse_line(line) do
    Regex.named_captures(~r/(?<min>\d+)-(?<max>\d+) (?<character>\w): (?<password>\w+)/, line)
    |> Map.update!("max", &String.to_integer/1)
    |> Map.update!("min", &String.to_integer/1)
  end

  def valid_sled_password?(%{"character" => character, "max" => max, "min" => min, "password" => password}) do
    count = String.graphemes(password) |> Enum.group_by(&(&1)) |> Map.get(character) |> get_count()

    min <= count and count <= max
  end

  def valid_tobaggan_password?(%{"character" => character, "max" => position_1, "min" => position_2, "password" => password}) do
    positional_matches = [
      String.at(password, position_1 - 1) == character,
      String.at(password, position_2 - 1) == character
    ]

    Enum.count(positional_matches, &(&1)) == 1
  end

  defp get_count(nil), do: 0
  defp get_count(list), do: Enum.count(list)
end
