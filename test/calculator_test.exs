defmodule CalculatorTest do
  use ExUnit.Case
  doctest Calculator

  test "невалидные параметры" do
    assert Calculator.calculate() == "невалидные параметры"
    assert Calculator.calculate(1) == "невалидные параметры"
    assert Calculator.calculate(1, 1) == "невалидные параметры"
    assert Calculator.calculate("1", "1") == "невалидные параметры"
    assert Calculator.calculate("1", "1", "1") == "невалидные параметры"
  end

  test "*" do
    assert Calculator.calculate("*", 3, 2) == 6
    assert Calculator.calculate("*", "3", 2) == "Второй параметр дожен быть числом"
    assert Calculator.calculate("*", 3, "2") == "Третий параметр должен быть числом и больше нуля при делении"
  end

  test "+" do
    assert Calculator.calculate("+", 3, 2) == 5
    assert Calculator.calculate("+", "3", 2) == "Второй параметр дожен быть числом"
    assert Calculator.calculate("+", 3, "2") == "Третий параметр должен быть числом и больше нуля при делении"
  end

  test "-" do
    assert Calculator.calculate("-", 3, 2) == 1
    assert Calculator.calculate("-", "3", 2) == "Второй параметр дожен быть числом"
    assert Calculator.calculate("-", 3, "2") == "Третий параметр должен быть числом и больше нуля при делении"
  end

  test "/" do
    assert Calculator.calculate("/", 6, 3) == 2
    assert Calculator.calculate("/", 3, 6) == 0.5
    assert Calculator.calculate("/", 3, 0) == %{error: "нельзя делить на ноль"}
    assert Calculator.calculate("/", "3", 2) == "Второй параметр дожен быть числом"
    assert Calculator.calculate("/", 3, "2") == "Третий параметр должен быть числом и больше нуля при делении"
  end
end
