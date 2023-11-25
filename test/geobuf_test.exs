defmodule GeobufTest.GeobufTest do
  use ExUnit.Case
  doctest Geobuf

  test "decodes point feature from Geobuf.Data to GeoJson Feature" do
    geobuf_data = %Geobuf.Data{
      keys: ["foo"],
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
             custom_properties: [],
             __unknown_fields__: []
           },
           values: [
             %Geobuf.Data.Value{
               value_type: {:string_value, "bar"},
               __unknown_fields__: []
             }
           ],
           properties: [0, 0],
           custom_properties: [],
           id_type: nil,
           __unknown_fields__: []
         }},
      __unknown_fields__: []
    }

    geojson_feature = %{
      "type" => "Feature",
      "geometry" => %{"type" => "Point", "coordinates" => [124.123, 234.456]},
      "properties" => %{"foo" => "bar"}
    }

    decoded_feature = Geobuf.decode(geobuf_data)

    assert geojson_feature == decoded_feature
  end


  test "decodes multipolygon with features from Geobuf.Data to GeoJson Feature" do
    geobuf_data = %Geobuf.Data{
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
               852_748
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

    geojson_feature = %{
      "id" => "1000001",
      "type" => "Feature",
      "geometry" => %{
        "type" => "MultiPolygon",
        "coordinates" => [
          [
            [
              [
                -83.537385,
                33.9659119
              ],
              [
                -83.5084519,
                33.931233
              ],
              [
                -83.4155119,
                33.918541
              ],
              [
                -83.275933,
                33.847977
              ],
              [
                -83.306619,
                33.811444
              ],
              [
                -83.28034,
                33.7617739
              ],
              [
                -83.29145,
                33.7343149
              ],
              [
                -83.406189,
                33.698307
              ],
              [
                -83.479523,
                33.802265
              ],
              [
                -83.505928,
                33.81776
              ],
              [
                -83.533165,
                33.820923
              ],
              [
                -83.647031,
                33.9061979
              ],
              [
                -83.537385,
                33.9659119
              ]
            ]
          ],
          [
            [
              [
                -83.537385,
                33.9659119
              ],
              [
                -83.5084519,
                33.931233
              ],
              [
                -83.4155119,
                33.918541
              ],
              [
                -83.275933,
                33.847977
              ],
              [
                -83.306619,
                33.811444
              ],
              [
                -83.28034,
                33.7617739
              ],
              [
                -83.29145,
                33.7343149
              ],
              [
                -83.406189,
                33.698307
              ],
              [
                -83.479523,
                33.802265
              ],
              [
                -83.505928,
                33.81776
              ],
              [
                -83.533165,
                33.820923
              ],
              [
                -83.647031,
                33.9061979
              ],
              [
                -83.537385,
                33.9659119
              ]
            ]
          ],
          [
            [
              [
                -83.537385,
                33.9659119
              ],
              [
                -83.5084519,
                33.931233
              ],
              [
                -83.4155119,
                33.918541
              ],
              [
                -83.275933,
                33.847977
              ],
              [
                -83.306619,
                33.811444
              ],
              [
                -83.28034,
                33.7617739
              ],
              [
                -83.29145,
                33.7343149
              ],
              [
                -83.406189,
                33.698307
              ],
              [
                -83.479523,
                33.802265
              ],
              [
                -83.505928,
                33.81776
              ],
              [
                -83.533165,
                33.820923
              ],
              [
                -83.647031,
                33.9061978
              ],
              [
                -83.537385,
                33.9659119
              ]
            ]
          ]
        ]
      },
      "properties" => %{
        "AREA" => "13219",
        "COLORKEY" => "#03E174",
        "area" => "13219",
        "index" => 1109
      }
    }

    decoded_feature = Geobuf.decode(geobuf_data)

    assert geojson_feature == decoded_feature
  end
end
