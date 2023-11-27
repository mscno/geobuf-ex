defmodule DecodeGeometry do
  def decode(geo, precision, dimensions) do
    case geo.type do
      :POINT ->
        %{"type" => "Point", "coordinates" => make_point(geo.coords, precision)}

      :MULTIPOINT ->
        %{
          "type" => "MultiPoint",
          "coordinates" => make_multi_point(geo.coords, precision, dimensions)
        }

      :LINESTRING ->
        %{
          "type" => "LineString",
          "coordinates" => make_line_string(geo.coords, precision, dimensions)
        }

      :MULTILINESTRING ->
        %{
          "type" => "MultiLineString",
          "coordinates" => make_multi_line_string(geo.lengths, geo.coords, precision, dimensions)
        }

      :POLYGON ->
        %{
          "type" => "Polygon",
          "coordinates" => make_polygon(geo.lengths, geo.coords, precision, dimensions)
        }

      :MULTIPOLYGON ->
        %{
          "type" => "MultiPolygon",
          "coordinates" => make_multi_polygon(geo.lengths, geo.coords, precision, dimensions)
        }

      _ ->
        %{}
    end
  end

  defp make_point(in_coords, precision) do
    make_coords(in_coords, precision)
  end

  defp make_multi_point(in_coords, precision, dimension) do
    make_line(in_coords, precision, dimension, false)
  end

  defp make_line_string(in_coords, precision, dimension) do
    make_line(in_coords, precision, dimension, false)
  end

  defp make_multi_line_string(lengths, in_coords, precision, dimension) do
    {lines, _} =
      Enum.reduce(lengths, {[], in_coords}, fn length, {acc, coords} ->
        l = length * dimension
        line = make_line_string(Enum.take(coords, l), precision, dimension)
        remaining_coords = Enum.drop(coords, l)
        {[line | acc], remaining_coords}
      end)

    Enum.reverse(lines)
  end

  def make_polygon(lengths, in_coords, precision, dimension) do
    {rings, _} =
      Enum.reduce(lengths, {[], in_coords}, fn length, {acc, coords} ->
        l = length * dimension
        # Split the coords into the current ring and the remaining coords
        {current_coords, remaining_coords} = Enum.split(coords, l)
        # Make the ring of the current polygon
        ring = make_ring(current_coords, precision, dimension)
        # Add the ring to the accumulator
        {[ring | acc], remaining_coords}
      end)

    Enum.reverse(rings)
  end

  def make_multi_polygon(lengths, in_coords, precision, dimension) do
    [poly_count | lengths] = lengths

    {polygons, _} =
      Enum.reduce(0..(poly_count - 1), {[], in_coords}, fn _, {acc, coords} ->
        [ring_count | lengths] = lengths
        polygon = make_polygon([Enum.at(lengths, ring_count + 1)], coords, precision, dimension)
        skip = Enum.sum(Enum.take(lengths, ring_count)) * dimension
        remaining_coords = Enum.drop(coords, skip)
        {[polygon | acc], remaining_coords}
      end)

    Enum.reverse(polygons)
  end

  def make_ring([], _precision, _dimension), do: []

  def make_ring(in_coords, precision, dimension) do
    points = make_line(in_coords, precision, dimension, true)
    [first | _] = points
    points ++ [first]
  end

  def make_line(in_coords, precision, _dimension, _is_closed) do
    in_coords
    |> Enum.chunk_every(2)
    |> Enum.reduce({[0, 0], []}, fn coords, {prev_coords, acc} ->
      new_coords = Enum.zip_with(coords, prev_coords, &Kernel.+/2)
      {new_coords, [make_coords(new_coords, precision) | acc]}
    end)
    |> elem(1)
    |> Enum.reverse()
  end

  def make_coords(in_coords, precision) do
    e = Math.decode_precision(precision)
    Enum.map(in_coords, &Math.float_with_precision(&1, e))
  end
end
