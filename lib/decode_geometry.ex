defmodule DecodeGeometry do
  def decode(geo, precision, dimensions) do
    case geo.type do
      :POINT -> make_point(geo.coords, precision)
      :MULTIPOINT -> make_multi_point(geo.coords, precision, dimensions)
      :LINESTRING -> make_line_string(geo.coords, precision, dimensions)
      :MULTILINESTRING -> make_multi_line_string(geo.lengths, geo.coords, precision, dimensions)
      :POLYGON -> make_polygon(geo.lengths, geo.coords, precision, dimensions)
      :MULTIPOLYGON -> make_multi_polygon(geo.lengths, geo.coords, precision, dimensions)
      _ -> %{}
    end
  end

  defp make_point(in_coords, precision) do
    %{"type" => "Point", "coordinates" => make_coords(in_coords, precision)}
  end

  defp make_multi_point(in_coords, precision, dimension) do
    %{"type" => "MultiPoint", "coordinates" => make_line(in_coords, precision, dimension, false)}
  end

  defp make_line_string(in_coords, precision, dimension) do
    %{"type" => "LineString", "coordinates" => make_line(in_coords, precision, dimension, false)}
  end

  defp make_multi_line_string(lengths, in_coords, precision, dimension) do
    {lines, _} = Enum.reduce(lengths, {[], in_coords}, fn length, {acc, coords} ->
      l = length * dimension
      line = make_line_string(Enum.take(coords, l), precision, dimension)
      remaining_coords = Enum.drop(coords, l)
      {[line | acc], remaining_coords}
    end)

    %{"type" => "MultiLineString", "coordinates" => Enum.reverse(lines)}
  end

  def make_polygon(lengths, in_coords, precision, dimension) do
    {rings, _} = Enum.reduce(lengths, {[], in_coords}, fn length, {acc, coords} ->
      l = length * dimension
      ring = make_ring(Enum.take(coords, l), precision, dimension)
      remaining_coords = Enum.drop(coords, l)
      {[ring | acc], remaining_coords}
    end)

    %{"type" => "Polygon", "coordinates" => Enum.reverse(rings)}
  end

  def make_multi_polygon(lengths, in_coords, precision, dimension) do
    [poly_count | lengths] = lengths
    {polygons, _} = Enum.reduce(0..(poly_count - 1), {[], in_coords}, fn _, {acc, coords} ->
      [ring_count | lengths] = lengths
      polygon = make_polygon(Enum.take(lengths, ring_count + 1), coords, precision, dimension)
      skip = Enum.sum(Enum.take(lengths, ring_count)) * dimension
      remaining_coords = Enum.drop(coords, skip)
      {[polygon | acc], remaining_coords}
    end)

    %{"type" => "MultiPolygon", "coordinates" => Enum.reverse(polygons)}
  end

  def make_ring(in_coords, precision, dimension) do
    points = make_line(in_coords, precision, dimension, true)
    [first | _] = points
    points ++ [first]
  end

  def make_line(in_coords, precision, dimension, is_closed) do
    prev_coords = [0, 0]
    in_coords
    |> Enum.chunk_every(2)
    |> Enum.with_index()
    |> Enum.map(fn {coords, i} ->
      prev_coords = Enum.zip_with(coords, prev_coords, &Kernel.+/2)
      make_point(prev_coords, precision)
    end)
  end

  def make_coords(in_coords, precision) do
    e = Math.decode_precision(precision)
    Enum.map(in_coords, &Math.float_with_precision(&1, e))
  end
end
