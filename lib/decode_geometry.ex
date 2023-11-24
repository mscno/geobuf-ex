defmodule DecodeGeometry do
  def decode(geo, precision, dimensions) do
    case geo.type do
      :POINT -> make_point(geo.coords, precision)
      :MULTI_POINT -> make_multi_point(geo.coords, precision, dimensions)
      :LINE_STRING -> make_line_string(geo.coords, precision, dimensions)
      :MULTI_LINE_STRING -> make_multi_line_string(geo.lengths, geo.coords, precision, dimensions)
      :POLYGON -> make_polygon(geo.lengths, geo.coords, precision, dimensions)
      :MULTI_POLYGON -> make_multi_polygon(geo.lengths, geo.coords, precision, dimensions)
      _ -> %{}
    end
  end

  defp make_point(in_coords, precision) do
    %{"type" => "Point", "coordinates" => make_coords(in_coords, precision)}
  end

  defp make_multi_point(in_coords, precision, dimension) do
    %{}
  end

  defp make_line_string(in_coords, precision, dimension) do
    %{}
  end

  defp make_multi_line_string(lengths, in_coords, precision, dimension) do
    %{}
  end

  defp make_polygon(lengths, in_coords, precision, dimension) do
    %{}
  end

  defp make_multi_polygon(lengths, in_coords, precision, dimension) do
    %{}
  end

  def make_coords(in_coords, precision) do
    e = Math.decode_precision(precision)
    Enum.map(in_coords, &Math.float_with_precision(&1, e))
  end
end
