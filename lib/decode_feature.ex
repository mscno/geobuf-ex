defmodule DecodeFeature do
  @geojson_types %{
    :feature_collection => "FeatureCollection",
    :feature => "Feature",
    :point => "Point",
    :multi_point => "MultiPoint",
    :line_string => "LineString",
    :multi_line_string => "MultiLineString",
    :polygon => "Polygon",
    :multi_polygon => "MultiPolygon"
  }

  # TODO: This is not working yet, to be fixed in a future release
  def decode(%Geobuf.Data{data_type: {:feature_collection, feature_collection}}) do
    %{
      "type" => "FeatureCollection",
      "features" => Enum.map(feature_collection.features, &decode/1)
    }
  end

  def decode(%Geobuf.Data{data_type: {:feature, feature}}= data) do
    %{
      "properties" => decode_properties(feature.properties, feature.values, data.keys),
      "type" => "Feature",
      "geometry" => decode_geometry(feature.geometry, data.precision, data.dimensions),
    } |> maybe_add_id(feature.id_type)
  end

  def decode(%Geobuf.Data{data_type: {:geometry, geometry}}= data) do
    decode_geometry(geometry, data.precision, data.dimensions)
  end

  defp maybe_add_id(feature, id) do
    if id != nil do
      Map.put(feature, "id", decode_id(id))
    else
      feature
    end
  end

  defp decode_id(nil), do: nil
  defp decode_id({:id, id}), do: id


  defp decode_properties(properties, values, keys) do
    Enum.chunk_every(properties, 2)
    |> Enum.map(fn [key_idx, val_idx] ->
      {keys |> Enum.at(key_idx), values |> Enum.at(val_idx) |> decode_value()}
    end)
    |> Enum.into(%{})
  end

  defp decode_geometry(geo, precision, dimensions) do
    DecodeGeometry.decode(geo, precision, dimensions)
  end

  defp new_feature(coordinates) do
    # Implement your feature creation logic here
  end

  defp decode_value(%Geobuf.Data.Value{value_type: {type, value}}) do
    case type do
      :bool_value -> value
      :double_value -> value
      :string_value -> value
      :pos_int_value -> value
      :neg_int_value -> -value
      :json_value -> decode_json(value)
      _ -> nil
    end
  end

  defp decode_json(json_value) do
    case Jason.decode(json_value) do
      {:ok, m} -> m
      {:error, _} -> raise "Failed to decode JSON"
    end
  end
end
