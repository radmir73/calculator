defmodule Calculator do
  @moduledoc """
  Documentation for `Calculator`.
  """

  @doc """

  ## Examples

      iex> Calculator.calculate()
      "невалидные параметры"

      iex> Calculator.calculate("*", 2, 3)
      6

      iex> Calculator.calculate("+", 2, 3)
      5

      iex> Calculator.calculate("-", 1, 3)
      -2

      iex> Calculator.calculate("/", 6, 3)
      2.0
  """

  defmacro is_not_operator(operator) do
    quote do
      unquote(operator) != "*" and unquote(operator) != "/" and unquote(operator) != "-" and unquote(operator) != "+"
    end
  end

  def calculate() do
    invalid_answer()
  end

  def calculate(_) do
    invalid_answer()
  end

  def calculate(_, _) do
    invalid_answer()
  end

  def calculate(var, _, _)  when is_not_operator(var) do
    invalid_answer()
  end

  def calculate(_, number1, _)  when is_number(number1) == false do
    "Второй параметр дожен быть числом"
  end

  def calculate(_, _, number2)  when is_number(number2) == false do
    "Третий параметр должен быть числом и больше нуля при делении"
  end

  def calculate("*", number1, number2) do
    number1 * number2
  end

  def calculate("+", number1, number2) do
    number1 + number2
  end

  def calculate("-", number1, number2) do
    number1 - number2
  end

  def calculate("/", number1, number2) when number2 > 0 do
    number1 / number2
  end

  def calculate("/", number1, number2) when number2 == 0 do
    _ = [number1, number2]

    %{error: "нельзя делить на ноль"}
  end

  defp invalid_operator() do
    "невалидные параметры"
  end
end
