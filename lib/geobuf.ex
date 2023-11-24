defmodule Geobuf do
  @moduledoc """
  Documentation for `Geobuf`.
  """

  @doc """
  decode should convert a %Geobuf.Data.Feature{} struct to a GeoJSON Feature. See unit test


  """
  def decode(data) do
    DecodeFeature.decode(data)
  end
end
