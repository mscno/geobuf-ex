defmodule GeobufTest.Geobuf.DataTest do
  use ExUnit.Case
  doctest Geobuf

  test "encodes a simple geobuf to pb" do
    data = %Geobuf.Data{
      keys: ["AREA", "COLORKEY", "area", "index"],
      dimensions: 2,
      precision: 7,
      data_type:
        {:feature,
         %Geobuf.Data.Feature{
           geometry: %Geobuf.Data.Geometry{
             type: :MULTIPOLYGON,
             lengths: [3, 1, 12, 1, 12, 1, 12],
             coords: [
               -835_373_850,
               339_659_119,
               289_331,
               -346_789,
               929_400,
               -126_920,
               1_395_789,
               -705_640,
               -306_860,
               -365_330,
               262_790,
               -496_701,
               -111_100,
               -274_590,
               -1_147_390,
               -360_079,
               -733_340,
               1_039_580,
               -264_050,
               154_950,
               -272_370,
               31630,
               -1_138_660,
               852_749,
               -835_373_850,
               339_659_119,
               289_331,
               -346_789,
               929_400,
               -126_920,
               1_395_789,
               -705_640,
               -306_860,
               -365_330,
               262_790,
               -496_701,
               -111_100,
               -274_590,
               -1_147_390,
               -360_079,
               -733_340,
               1_039_580,
               -264_050,
               154_950,
               -272_370,
               31630,
               -1_138_660,
               852_749,
               -835_373_850,
               339_659_119,
               289_331,
               -346_789,
               929_400,
               -126_920,
               1_395_789,
               -705_640,
               -306_860,
               -365_330,
               262_790,
               -496_701,
               -111_100,
               -274_590,
               -1_147_390,
               -360_079,
               -733_340,
               1_039_580,
               -264_050,
               154_950,
               -272_370,
               31630,
               -1_138_660,
               852_749
             ],
             geometries: [],
             values: [],
             custom_properties: [],
             __unknown_fields__: []
           },
           values: [
             %Geobuf.Data.Value{
               value_type: {:string_value, "13219"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:string_value, "#03E174"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:string_value, "13219"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:double_value, 1109.0},
               __unknown_fields__: []
             }
           ],
           properties: [0, 0, 1, 1, 2, 2, 3, 3],
           custom_properties: [],
           id_type: {:id, "1000001"},
           __unknown_fields__: []
         }},
      __unknown_fields__: []
    }

    encoded = Geobuf.Data.encode(data)
    decoded = Geobuf.Data.decode(encoded)

    assert data == decoded
  end

  test "encodes a empty geometry geobuf to pb" do
    data = %Geobuf.Data{
      keys: ["AREA", "COLORKEY", "area", "index"],
      dimensions: 2,
      precision: 7,
      data_type:
        {:feature,
         %Geobuf.Data.Feature{
           geometry: %Geobuf.Data.Geometry{
             type: :EMPTY,
             lengths: [],
             coords: [],
             geometries: [],
             values: [],
             custom_properties: [],
             __unknown_fields__: []
           },
           values: [
             %Geobuf.Data.Value{
               value_type: {:string_value, "13219"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:string_value, "#03E174"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:string_value, "13219"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:double_value, 1109.0},
               __unknown_fields__: []
             }
           ],
           properties: [0, 0, 1, 1, 2, 2, 3, 3],
           custom_properties: [],
           id_type: {:id, "1000001"},
           __unknown_fields__: []
         }},
      __unknown_fields__: []
    }

    encoded = Geobuf.Data.encode(data)
    decoded = Geobuf.Data.decode(encoded)

    assert data == decoded
  end

  test "decodes multipolygon with features from binary protobuf to Geobuf.Data" do

    data = %Geobuf.Data{
      keys: ["AREA", "COLORKEY", "area", "index"],
      dimensions: 2,
      precision: 7,
      data_type:
        {:feature,
         %Geobuf.Data.Feature{
           geometry: %Geobuf.Data.Geometry{
             type: :MULTIPOLYGON,
             lengths: [3, 1, 12, 1, 12, 1, 12],
             coords: [
               -835_373_850,
               339_659_119,
               289_331,
               -346_789,
               929_400,
               -126_920,
               1_395_789,
               -705_640,
               -306_860,
               -365_330,
               262_790,
               -496_701,
               -111_100,
               -274_590,
               -1_147_390,
               -360_079,
               -733_340,
               1_039_580,
               -264_050,
               154_950,
               -272_370,
               31630,
               -1_138_660,
               852_749,
               -835_373_850,
               339_659_119,
               289_331,
               -346_789,
               929_400,
               -126_920,
               1_395_789,
               -705_640,
               -306_860,
               -365_330,
               262_790,
               -496_701,
               -111_100,
               -274_590,
               -1_147_390,
               -360_079,
               -733_340,
               1_039_580,
               -264_050,
               154_950,
               -272_370,
               31630,
               -1_138_660,
               852_749,
               -835_373_850,
               339_659_119,
               289_331,
               -346_789,
               929_400,
               -126_920,
               1_395_789,
               -705_640,
               -306_860,
               -365_330,
               262_790,
               -496_701,
               -111_100,
               -274_590,
               -1_147_390,
               -360_079,
               -733_340,
               1_039_580,
               -264_050,
               154_950,
               -272_370,
               31630,
               -1_138_660,
               852_749
             ],
             geometries: [],
             values: [],
             custom_properties: [],
             __unknown_fields__: []
           },
           values: [
             %Geobuf.Data.Value{
               value_type: {:string_value, "13219"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:string_value, "#03E174"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:string_value, "13219"},
               __unknown_fields__: []
             },
             %Geobuf.Data.Value{
               value_type: {:double_value, 1109.0},
               __unknown_fields__: []
             }
           ],
           properties: [0, 0, 1, 1, 2, 2, 3, 3],
           custom_properties: [],
           id_type: {:id, "1000001"},
           __unknown_fields__: []
         }},
      __unknown_fields__: []
    }


    hex = "0a04415245410a08434f4c4f524b45590a04617265610a05696e646578100218072ab9020afb010806120703010c010c010c1aed01b3acd69c06dea5f6c302e6a823c9aa2af0b9718fbf0f9ab1aa01cf9156d7ba25a3cc2c8c8a20f9d03cf7c70dbbc221fb878c019dfa2bb7c259b8f37ee39d208cf512e39f219cee03c7ff8a019a8c68b3acd69c06dea5f6c302e6a823c9aa2af0b9718fbf0f9ab1aa01cf9156d7ba25a3cc2c8c8a20f9d03cf7c70dbbc221fb878c019dfa2bb7c259b8f37ee39d208cf512e39f219cee03c7ff8a019a8c68b3acd69c06dea5f6c302e6a823c9aa2af0b9718fbf0f9ab1aa01cf9156d7ba25a3cc2c8c8a20f9d03cf7c70dbbc221fb878c019dfa2bb7c259b8f37ee39d208cf512e39f219cee03c7ff8a019a8c686a070a0531333231396a090a07233033453137346a070a0531333231396a09110000000000549140720800000101020203035a0731303030303031"
    byte_stream = Base.decode16!(hex, case: :lower)


    encoded = Geobuf.Data.encode(data)
    decoded = Geobuf.Data.decode(encoded)
    data = Geobuf.Data.decode(byte_stream)

    assert data == decoded
  end

  test "decodes a point from protobuf binary to Geobuf.Data" do
    hex = "100218032a0c0a0a08011a06b6930fb0cf1c"

    byte_stream = Base.decode16!(hex, case: :lower)
    decoded = Geobuf.Data.decode(byte_stream)

    assert %Geobuf.Data{
             keys: [],
             dimensions: 2,
             precision: 3,
             data_type:
               {:feature,
                %Geobuf.Data.Feature{
                  geometry: %Geobuf.Data.Geometry{
                    type: :POINT,
                    lengths: [],
                    coords: [124_123, 234_456],
                    geometries: [],
                    values: [],
                    custom_properties: [],
                    __unknown_fields__: []
                  },
                  values: [],
                  properties: [],
                  custom_properties: [],
                  id_type: nil,
                  __unknown_fields__: []
                }},
             __unknown_fields__: []
           } == decoded
  end

  test "decodes a point from protobuf binary to Geobuf.Data with different point precisions" do
    hex = "100218062a0f0a0d08011a09f0ddaf76aa9bccdf01"

    byte_stream = Base.decode16!(hex, case: :lower)
    decoded = Geobuf.Data.decode(byte_stream)

    assert %Geobuf.Data{
             keys: [],
             dimensions: 2,
             precision: 6,
             data_type:
               {:feature,
                %Geobuf.Data.Feature{
                  geometry: %Geobuf.Data.Geometry{
                    type: :POINT,
                    lengths: [],
                    coords: [124_123_000, 234_456_789],
                    geometries: [],
                    values: [],
                    custom_properties: [],
                    __unknown_fields__: []
                  },
                  values: [],
                  properties: [],
                  custom_properties: [],
                  id_type: nil,
                  __unknown_fields__: []
                }},
             __unknown_fields__: []
           } == decoded
  end
end
