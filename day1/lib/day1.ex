defmodule Day1 do
  @moduledoc """
  Documentation for Day1.
  """
  def solve_for_two(report) do
    Enum.reduce(report, nil, fn entry, product ->
      if product do
        product
      else
        case Enum.find(report, fn compared_entry -> entry + compared_entry == 2020 end) do
          nil -> nil
          match -> entry * match
        end
      end
    end)
  end

  def solve_for_three(report) do
    {_report, product} = Enum.reduce(report, {report, nil}, &get_product/2)

    product
  end

  def get_product(entry, {report, nil}) do
    case Enum.find(report, fn compared_entry -> (2020 - (entry + compared_entry)) in report end) do
      nil -> {report, nil}
      match ->
        third_match = Enum.find(report, fn deeper_entry -> deeper_entry + entry + match == 2020 end)
        {report, match * third_match * entry}
    end
  end

  def get_product(_entry, {report, product}), do: {report, product}
end
