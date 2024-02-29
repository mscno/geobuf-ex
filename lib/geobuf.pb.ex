defmodule Geobuf.Data.Geometry.Type do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :EMPTY, 0
  field :POINT, 1
  field :MULTIPOINT, 2
  field :LINESTRING, 3
  field :MULTILINESTRING, 4
  field :POLYGON, 5
  field :MULTIPOLYGON, 6
  field :GEOMETRYCOLLECTION, 7
end

defmodule Geobuf.DataSlice do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:length, 2, type: :uint32)
  field(:slice, 3, repeated: true, type: Geobuf.Data)
end

defmodule Geobuf.Data.Feature do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:id_type, 0)

  field(:geometry, 1, type: Geobuf.Data.Geometry)
  field(:id, 11, type: :string, oneof: 0)
  field(:int_id, 12, type: :sint64, json_name: "intId", oneof: 0)
  field(:values, 13, repeated: true, type: Geobuf.Data.Value)
  field(:properties, 14, repeated: true, type: :uint32)
  field(:custom_properties, 15, repeated: true, type: :uint32, json_name: "customProperties")
end

defmodule Geobuf.Data.Geometry do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:type, 1, type: Geobuf.Data.Geometry.Type, enum: true)
  field(:lengths, 2, repeated: true, type: :uint32)
  field(:coords, 3, repeated: true, type: :sint64)
  field(:geometries, 4, repeated: true, type: Geobuf.Data.Geometry)
  field(:values, 13, repeated: true, type: Geobuf.Data.Value)
  field(:custom_properties, 15, repeated: true, type: :uint32, json_name: "customProperties")
end

defmodule Geobuf.Data.FeatureCollection do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field(:features, 1, repeated: true, type: Geobuf.Data.Feature)
  field(:values, 13, repeated: true, type: Geobuf.Data.Value)
  field(:custom_properties, 15, repeated: true, type: :uint32, json_name: "customProperties")
end

defmodule Geobuf.Data.Value do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:value_type, 0)

  field(:string_value, 1, type: :string, json_name: "stringValue", oneof: 0)
  field(:double_value, 2, type: :double, json_name: "doubleValue", oneof: 0)
  field(:pos_int_value, 3, type: :uint64, json_name: "posIntValue", oneof: 0)
  field(:neg_int_value, 4, type: :uint64, json_name: "negIntValue", oneof: 0)
  field(:bool_value, 5, type: :bool, json_name: "boolValue", oneof: 0)
  field(:json_value, 6, type: :bytes, json_name: "jsonValue", oneof: 0)
end

defmodule Geobuf.Data do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof(:data_type, 0)

  field(:keys, 1, repeated: true, type: :string)
  field(:dimensions, 2, type: :uint32)
  field(:precision, 3, type: :uint32)

  field(:feature_collection, 4,
    type: Geobuf.Data.FeatureCollection,
    json_name: "featureCollection",
    oneof: 0
  )

  field(:feature, 5, type: Geobuf.Data.Feature, oneof: 0)
  field(:geometry, 6, type: Geobuf.Data.Geometry, oneof: 0)
end
