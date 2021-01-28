defmodule Homework.Amount do
  use Ecto.Type
  def type, do: :integer

  def cast(amount) when is_integer(amount) do
    amount / 100
  end

  def cast(amount) when is_float(amount) do
    amount
  end

  def cast(_), do: :error

  def dump(amount) when is_float(amount) do
    {:ok, round(amount * 100)}
  end

  def dump(amount) when is_integer(amount) do
    {:ok, amount}
  end

  def load(amount) when is_integer(amount) do
    {:ok, amount / 100}
  end

  def load(amount) when is_float(amount) do
    {:ok, amount}
  end
end
