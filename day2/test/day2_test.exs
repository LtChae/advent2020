defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  describe "sled passwords" do
    test "finds invalid passwords" do
      passwords = [
        "1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc"
      ]
      assert Day2.solve(passwords, &Day2.valid_sled_password?/1) == 2
    end

    test "parses lines" do
      assert %{"character" => "b", "max" => 3, "min" => 1, "password" => "cdefg"} = Day2.parse_line("1-3 b: cdefg")
    end

    test "validates a sled password" do
      refute Day2.valid_sled_password?(%{"character" => "b", "max" => 3, "min" => 1, "password" => "cdefg"})
    end
  end

  describe "validate tobaggan passwords" do
    test "finds invalid passwords" do
      passwords = [
        "1-3 a: abcde",
        "1-3 b: cdefg",
        "2-9 c: ccccccccc"
      ]
      assert Day2.solve(passwords, &Day2.valid_tobaggan_password?/1) == 1
    end

    test "parses lines" do
      assert %{"character" => "b", "max" => 3, "min" => 1, "password" => "cdefg"} = Day2.parse_line("1-3 b: cdefg")
    end

    test "validates a tobaggan password" do
      assert Day2.valid_tobaggan_password?(%{"character" => "a", "max" => 3, "min" => 1, "password" => "abcde"})
    end
  end
end
