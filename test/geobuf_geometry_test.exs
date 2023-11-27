defmodule GeobufTest.GeobufGeometryTest do
  use ExUnit.Case
  doctest Geobuf

  test "make_multi_polygon" do
    lengths = [2, 1, 4, 2, 4, 4]
    coords = [10200, 200, 100, 0, 0, 100, -100, 0, 10000, 0, 100, 0, 0, 100, -100, 0, 10020, 20, 60, 0, 0, 60, -60, 0]
    dimension = 2
    precision = 2

    assert DecodeGeometry.make_multi_polygon(lengths, coords, precision, dimension) == [
        [
          [
            [102.0, 2.0], [103.0, 2.0], [103.0, 3.0], [102.0, 3.0], [102.0, 2.0]
          ]
        ],
        [
          [
            [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]

          ],
          [
            [100.2, 0.2], [100.8, 0.2], [100.8, 0.8], [100.2, 0.8], [100.2, 0.2]
          ]
        ]
      ]
  end
end
