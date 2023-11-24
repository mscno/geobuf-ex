defmodule Math do
  @max_precision :math.pow(10, 9)

  def int_with_precision(point, precision) do
    round(point * precision)
  end

  def float_with_precision(point, precision) do
    point / precision
  end

  def encode_precision(precision) do
    :math.ceil(:math.log(precision) / :math.log(10))
  end

  def decode_precision(precision) do
    :math.pow(10, precision)
  end
end
