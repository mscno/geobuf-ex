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

  test "decode multipolygon from binary hex ok" do
    hex = "0a064144445249440a0850415243454c4e4f0a0a53484150455f415245410a0953484150455f4c454e0a095348504c494e4b4944100218092ace0a0a850a0806120e06010f018101010f010f0109014b1af0098f839ffc8e06b09789a5ae02b591029f67a1b8ed06baa70afbda02ae0cf9c302ac60db8a02f4a901b9b5019ee201e14dba8202840afaab019cae02b2b5d5018cadfd06f1c507cfb101aba5d601cb15efb90295830185aa02dfe801c18302adc8cfff8e0690e0fea4ae02deb543cf67dcd003b216ece0e502cf9703d2e802bd4bccba029b9a01c4f001a7da018a9001b58702d21e99c5029bca02dbe9ae019726878b02cb9201f9f301d5ef0181c401ffb402b78001ffaf02c32ef9e1e702c49803cde043c48d01d1c4a401d26ef1b703f307efce05bf0ce5f208a41a91f208dc2991f318d48301a3c825d2c601e1804aae5287d503be02bbd403f808b5d403f60eb1d403ae159dd303ae1bcfd203e62183d203e627edd003e62d87e404aa49e7e504e040fbe604ce38fdd202d01cc9d302ac18cbd302d01397d402ac0fe3d402980ae7d402ac06e9d402ce01edd4028d03afea09e31eb1eb09d10da5eb09d602b5c110fa2aa939e205f3399a06a739c007a939f607a739e208df38d209df38be0a9538f60a9538e40bcd37d00ccd37880dcb37ac0ebb36e20e83379a0ff135be10f335f610a935ac11a735d012973486139934f613cd33aa14cf339a15bd32ce15f731be16f331aa17ad31e2179b3098189b30bc19d32fbc19c32eaa1ac12e981bb12dcc1be92c861ca12cf21cd92ba81d8f2b961ec72acc1eb729841fed28ba1fdf27a620dd27de20cd2694218526cc21f524b822ab24b8229b23a623d522dc238b229224f920ca24b320fe24a11fb625931eee25c91da226811da426f11b9027e11ac627971ac6278919fe27bf18b228e916ea28e716ea288f15a029c714d629b7138c2aa712d629dd11c22acf10c22abd0ffa2aa708e0169507e216cd06981785069617f5049817ad0496179d03cc17ef2690ed02bae201cadea001e4ad01989602b68b028ce701dcd4028ca601e0b002c84cbd829cfa8e06e698f8a4ae02e9d5019b8abd01ebc1a901d2738fd8018d189fbf02dc24a79b028c7695d501e0b801a375bae501f7069af601deca02869baf015cf8ad02ac74d285029ad801eadd0192a7029ca001a6d902da539dde9afa8e06aea989a6ae02e99301c1cf8201adc7a901ccdd01c5e702e246f99d02b492018bd10198d101a36d92f9019602bc8602b6589aad71f11becdd01863ffe9c02e0a901ba8202a28602e6d001bcca029e8d01bcf202f03cf1bffcfb8e06a0bf99a6ae02edc502cb1ed9bf029637f59302b08601cbc701fec501f564c6ed01da21d8c849aceeeb01af8002db56fd804d9b8d9b818f06a6efb5a3ae02eca50997318c9405e123908f11cb7796b101f3f40289cc0da014d7cb34d422ffb934f24a918e16f00cd3cf2bbe2efdf864ec66be24c250e80aea15c00cea15d00dfc14e00ec614b8108c14c611d613d612e6129e13b212f6148a118416d210cc169e10a218f60ea418880efa199a0df819ae0cd01bbe0bd01bd00a981caa09de1cbe08a41d9807ec1daa06b41ebc05b41e9804fa1ef202b01e8602f81e60f81e0df6f23ea94db4d203c415b2ed01bc06aeed018403e6ec0104aaed01fb02a8ed01b106deec01b309de578302a6589301de5710e057b401e257da02e057c6039c57ec04e45790069c57fe069c57a408d656c809a057b60a9056920c9056c80c9256a40ebee801ae1f82e901e41ccae901ac198cea01f615d4ea01ac139aeb01f40f96eb01f40cdeeb01f209daeb01be06d8eb01ba039cec0106cccb01b50282b57ebb8e026a0c0a0a393731343330353930316a09117f6abc24c40447416a09118ee6c8ca7f77d0406a091100000000c096d0406a09110000000000d4d640720a01000201030204030004"
    byte_stream = Base.decode16!(hex, case: :lower)
    geobuf_data = Geobuf.Data.decode(byte_stream)

    decoded = Geobuf.decode(geobuf_data)

    assert decoded == %{
      "type"=> "Feature",
      "geometry"=> %{
        "type"=> "MultiPolygon",
        "coordinates"=> [
          [
            [
              [
                -105.088540872,
                40.572626392
              ],
              [
                -105.088558371,
                40.572619784
              ],
              [
                -105.095746356,
                40.572704229
              ],
              [
                -105.095768562,
                40.57270502
              ],
              [
                -105.095789295,
                40.572711186
              ],
              [
                -105.095806365,
                40.57272206
              ],
              [
                -105.095817978,
                40.572736539
              ],
              [
                -105.095822955,
                40.57275308
              ],
              [
                -105.095822313,
                40.572764085
              ],
              [
                -105.095802971,
                40.574512398
              ],
              [
                -105.088484629,
                40.574450581
              ],
              [
                -105.088495997,
                40.572695103
              ],
              [
                -105.088497379,
                40.572675015
              ],
              [
                -105.088505774,
                40.57265594
              ],
              [
                -105.08852067,
                40.572639331
              ],
              [
                -105.088540872,
                40.572626392
              ]
            ]
          ],
          [
            [
              [
                -105.092084247,
                40.572540936
              ],
              [
                -105.091531944,
                40.572534304
              ],
              [
                -105.091502202,
                40.572535737
              ],
              [
                -105.08857146,
                40.572509649
              ],
              [
                -105.088548379,
                40.572504818
              ],
              [
                -105.088528245,
                40.572494948
              ],
              [
                -105.088512851,
                40.572480976
              ],
              [
                -105.08850363,
                40.572464117
              ],
              [
                -105.088501669,
                40.572443304
              ],
              [
                -105.088522803,
                40.57101113
              ],
              [
                -105.088525247,
                40.570994038
              ],
              [
                -105.088534629,
                40.570978425
              ],
              [
                -105.088549968,
                40.57096588
              ],
              [
                -105.088569744,
                40.57095766
              ],
              [
                -105.0885892,
                40.570954682
              ],
              [
                -105.091536397,
                40.570980828
              ],
              [
                -105.092091444,
                40.570989886
              ],
              [
                -105.093439325,
                40.570996967
              ],
              [
                -105.093467478,
                40.570996461
              ],
              [
                -105.093513486,
                40.570995661
              ],
              [
                -105.093586369,
                40.570997343
              ],
              [
                -105.09365921,
                40.571000013
              ],
              [
                -105.093863187,
                40.571008439
              ],
              [
                -105.094170917,
                40.571021152
              ],
              [
                -105.094777174,
                40.571026423
              ],
              [
                -105.094807194,
                40.571026582
              ],
              [
                -105.094837176,
                40.571027154
              ],
              [
                -105.094867155,
                40.571028109
              ],
              [
                -105.094897132,
                40.571029476
              ],
              [
                -105.094927035,
                40.571031227
              ],
              [
                -105.094956899,
                40.57103339
              ],
              [
                -105.094986725,
                40.571035937
              ],
              [
                -105.095016476,
                40.571038868
              ],
              [
                -105.095055648,
                40.571043561
              ],
              [
                -105.095094932,
                40.571047705
              ],
              [
                -105.09513429,
                40.571051328
              ],
              [
                -105.095155985,
                40.57105316
              ],
              [
                -105.095177718,
                40.571054718
              ],
              [
                -105.095199452,
                40.571055974
              ],
              [
                -105.095221224,
                40.571056956
              ],
              [
                -105.095243034,
                40.571057608
              ],
              [
                -105.095264846,
                40.571058014
              ],
              [
                -105.095286659,
                40.571058117
              ],
              [
                -105.095308474,
                40.571057918
              ],
              [
                -105.09538901,
                40.571055948
              ],
              [
                -105.095469611,
                40.571055075
              ],
              [
                -105.095550206,
                40.571055246
              ],
              [
                -105.095685465,
                40.571057995
              ],
              [
                -105.095689134,
                40.571058364
              ],
              [
                -105.09569284,
                40.571058761
              ],
              [
                -105.095696508,
                40.571059241
              ],
              [
                -105.095700177,
                40.571059748
              ],
              [
                -105.095703845,
                40.571060309
              ],
              [
                -105.095707477,
                40.571060926
              ],
              [
                -105.095711109,
                40.571061597
              ],
              [
                -105.095714704,
                40.571062296
              ],
              [
                -105.095718299,
                40.57106305
              ],
              [
                -105.095721858,
                40.571063858
              ],
              [
                -105.095725417,
                40.571064694
              ],
              [
                -105.095728975,
                40.571065612
              ],
              [
                -105.095732461,
                40.571066557
              ],
              [
                -105.095735983,
                40.57106753
              ],
              [
                -105.095739432,
                40.571068585
              ],
              [
                -105.095742882,
                40.571069668
              ],
              [
                -105.095746295,
                40.571070778
              ],
              [
                -105.095749707,
                40.57107197
              ],
              [
                -105.095753047,
                40.571073189
              ],
              [
                -105.095756388,
                40.571074464
              ],
              [
                -105.095759691,
                40.571075765
              ],
              [
                -105.095762995,
                40.571077122
              ],
              [
                -105.095766226,
                40.571078505
              ],
              [
                -105.095769422,
                40.571079944
              ],
              [
                -105.095772616,
                40.571081437
              ],
              [
                -105.095775775,
                40.571082958
              ],
              [
                -105.095778861,
                40.571084506
              ],
              [
                -105.095781947,
                40.571086136
              ],
              [
                -105.095784997,
                40.571087766
              ],
              [
                -105.095787975,
                40.571089451
              ],
              [
                -105.095790952,
                40.571091191
              ],
              [
                -105.095793857,
                40.571092957
              ],
              [
                -105.095796726,
                40.571094752
              ],
              [
                -105.095799559,
                40.571096601
              ],
              [
                -105.095802356,
                40.571098477
              ],
              [
                -105.095805116,
                40.571100408
              ],
              [
                -105.09580784,
                40.571102366
              ],
              [
                -105.095810492,
                40.571104352
              ],
              [
                -105.095813107,
                40.571106365
              ],
              [
                -105.095815651,
                40.571108432
              ],
              [
                -105.095818194,
                40.571110527
              ],
              [
                -105.095820665,
                40.571112649
              ],
              [
                -105.0958231,
                40.571114799
              ],
              [
                -105.095825463,
                40.571117003
              ],
              [
                -105.095827789,
                40.571119207
              ],
              [
                -105.095830043,
                40.571121466
              ],
              [
                -105.095832262,
                40.571123752
              ],
              [
                -105.095834444,
                40.571126065
              ],
              [
                -105.095836553,
                40.571128406
              ],
              [
                -105.095838627,
                40.571130773
              ],
              [
                -105.095840628,
                40.571133168
              ],
              [
                -105.095842558,
                40.571135591
              ],
              [
                -105.095844451,
                40.57113804
              ],
              [
                -105.095846308,
                40.57114049
              ],
              [
                -105.095848093,
                40.571142994
              ],
              [
                -105.095849806,
                40.571145525
              ],
              [
                -105.095851482,
                40.571148056
              ],
              [
                -105.095853087,
                40.571150615
              ],
              [
                -105.095854655,
                40.5711532
              ],
              [
                -105.095856116,
                40.571155813
              ],
              [
                -105.095857576,
                40.571158426
              ],
              [
                -105.095858928,
                40.571161066
              ],
              [
                -105.095860244,
                40.571163733
              ],
              [
                -105.095861488,
                40.571166427
              ],
              [
                -105.09586266,
                40.571169094
              ],
              [
                -105.095863795,
                40.571171815
              ],
              [
                -105.095864859,
                40.571174536
              ],
              [
                -105.09586585,
                40.571177285
              ],
              [
                -105.095866382,
                40.571178741
              ],
              [
                -105.095866841,
                40.571180198
              ],
              [
                -105.095867264,
                40.571181682
              ],
              [
                -105.095867651,
                40.571183165
              ],
              [
                -105.095867966,
                40.571184649
              ],
              [
                -105.095868245,
                40.571186132
              ],
              [
                -105.095868452,
                40.571187642
              ],
              [
                -105.09587094,
                40.57121101
              ],
              [
                -105.095856447,
                40.572527783
              ],
              [
                -105.095845325,
                40.572545587
              ],
              [
                -105.09582821,
                40.572560377
              ],
              [
                -105.095806404,
                40.572571007
              ],
              [
                -105.0957869,
                40.572575907
              ],
              [
                -105.092084247,
                40.572540936
              ]
            ]
          ],
          [
            [
              [
                -105.086419103,
                40.572487219
              ],
              [
                -105.086432788,
                40.570938277
              ],
              [
                -105.08782145,
                40.570945678
              ],
              [
                -105.087835282,
                40.570944135
              ],
              [
                -105.087855714,
                40.570946485
              ],
              [
                -105.087873846,
                40.570954043
              ],
              [
                -105.087887489,
                40.570965867
              ],
              [
                -105.087894995,
                40.570980552
              ],
              [
                -105.087895439,
                40.570996309
              ],
              [
                -105.087874272,
                40.57243164
              ],
              [
                -105.087874226,
                40.572450964
              ],
              [
                -105.08786678,
                40.572467709
              ],
              [
                -105.087852943,
                40.572481906
              ],
              [
                -105.087834054,
                40.57249216
              ],
              [
                -105.087811955,
                40.572497517
              ],
              [
                -105.086419103,
                40.572487219
              ]
            ]
          ],
          [
            [
              [
                -105.086408591,
                40.573676119
              ],
              [
                -105.086418052,
                40.57260607
              ],
              [
                -105.087807067,
                40.572620252
              ],
              [
                -105.087830078,
                40.572624781
              ],
              [
                -105.087848379,
                40.572634151
              ],
              [
                -105.087861761,
                40.572647539
              ],
              [
                -105.087868755,
                40.572663484
              ],
              [
                -105.087868616,
                40.572680282
              ],
              [
                -105.087862957,
                40.573608871
              ],
              [
                -105.087864742,
                40.573623069
              ],
              [
                -105.087860707,
                40.573641308
              ],
              [
                -105.087849843,
                40.573657849
              ],
              [
                -105.087833058,
                40.573671212
              ],
              [
                -105.087811908,
                40.573680251
              ],
              [
                -105.087788198,
                40.573684147
              ],
              [
                -105.086408591,
                40.573676119
              ]
            ]
          ],
          [
            [
              [
                -105.088258041,
                40.573808592
              ],
              [
                -105.088278896,
                40.573806634
              ],
              [
                -105.088299357,
                40.573810165
              ],
              [
                -105.088317016,
                40.573818765
              ],
              [
                -105.08832979,
                40.573831436
              ],
              [
                -105.088336249,
                40.573846639
              ],
              [
                -105.088334092,
                40.574449307
              ],
              [
                -105.08640191,
                40.574432899
              ],
              [
                -105.08640746,
                40.573802052
              ],
              [
                -105.088258041,
                40.573808592
              ]
            ]
          ],
          [
            [
              [
                -105.09375163,
                40.570895315
              ],
              [
                -105.09367548,
                40.570892167
              ],
              [
                -105.093633234,
                40.570889878
              ],
              [
                -105.093493002,
                40.570882224
              ],
              [
                -105.093481663,
                40.570858358
              ],
              [
                -105.093593028,
                40.570859654
              ],
              [
                -105.094023856,
                40.570861872
              ],
              [
                -105.094453552,
                40.570866665
              ],
              [
                -105.094634681,
                40.570867489
              ],
              [
                -105.094992035,
                40.570870464
              ],
              [
                -105.095818978,
                40.570877046
              ],
              [
                -105.095816643,
                40.570882199
              ],
              [
                -105.095815951,
                40.570883596
              ],
              [
                -105.095815151,
                40.570884993
              ],
              [
                -105.095814279,
                40.570886335
              ],
              [
                -105.095813335,
                40.57088765
              ],
              [
                -105.095812283,
                40.570888936
              ],
              [
                -105.09581116,
                40.570890195
              ],
              [
                -105.095809965,
                40.570891398
              ],
              [
                -105.095808734,
                40.570892575
              ],
              [
                -105.095807395,
                40.570893668
              ],
              [
                -105.095805985,
                40.570894733
              ],
              [
                -105.095804539,
                40.570895772
              ],
              [
                -105.095802986,
                40.570896727
              ],
              [
                -105.095801432,
                40.570897627
              ],
              [
                -105.095799771,
                40.570898472
              ],
              [
                -105.095798111,
                40.570899263
              ],
              [
                -105.095796343,
                40.570899998
              ],
              [
                -105.095794575,
                40.570900678
              ],
              [
                -105.095792771,
                40.570901275
              ],
              [
                -105.095790932,
                40.570901818
              ],
              [
                -105.095789058,
                40.570902278
              ],
              [
                -105.095787148,
                40.570902683
              ],
              [
                -105.095785202,
                40.570903033
              ],
              [
                -105.095783256,
                40.570903301
              ],
              [
                -105.095781275,
                40.570903486
              ],
              [
                -105.095779331,
                40.570903617
              ],
              [
                -105.095777351,
                40.570903665
              ],
              [
                -105.095775371,
                40.570903658
              ],
              [
                -105.095260112,
                40.570898709
              ],
              [
                -105.095230262,
                40.570900087
              ],
              [
                -105.095215069,
                40.570900501
              ],
              [
                -105.095199878,
                40.570900695
              ],
              [
                -105.095184723,
                40.570900697
              ],
              [
                -105.095169534,
                40.570900507
              ],
              [
                -105.095154346,
                40.570900098
              ],
              [
                -105.095139195,
                40.570899496
              ],
              [
                -105.09513358,
                40.570899366
              ],
              [
                -105.095127929,
                40.570899292
              ],
              [
                -105.095122314,
                40.5708993
              ],
              [
                -105.095116698,
                40.57089939
              ],
              [
                -105.095111081,
                40.570899563
              ],
              [
                -105.095105465,
                40.57089979
              ],
              [
                -105.095099883,
                40.5709001
              ],
              [
                -105.095094265,
                40.570900492
              ],
              [
                -105.095088683,
                40.570900939
              ],
              [
                -105.095083101,
                40.570901469
              ],
              [
                -105.095077554,
                40.570902081
              ],
              [
                -105.09507197,
                40.570902748
              ],
              [
                -105.095066458,
                40.570903525
              ],
              [
                -105.095060946,
                40.570904329
              ],
              [
                -105.095055433,
                40.570905243
              ],
              [
                -105.095040554,
                40.57090725
              ],
              [
                -105.095025641,
                40.570909092
              ],
              [
                -105.095010692,
                40.570910714
              ],
              [
                -105.09499571,
                40.570912117
              ],
              [
                -105.094980692,
                40.570913355
              ],
              [
                -105.094965639,
                40.570914373
              ],
              [
                -105.094950588,
                40.570915199
              ],
              [
                -105.094935501,
                40.570915832
              ],
              [
                -105.094920416,
                40.570916247
              ],
              [
                -105.094905332,
                40.570916468
              ],
              [
                -105.094890214,
                40.570916471
              ],
              [
                -105.094877184,
                40.570916316
              ],
              [
                -105.093841599,
                40.570899006
              ],
              [
                -105.09375163,
                40.570895315
              ]
            ]
          ]
        ]
      },
      "properties" => %{
        "ADDRID" => 23376,
        "PARCELNO" => "9714305901",
        "SHAPE_AREA" => 3017096.287,
        "SHAPE_LEN" => 16861.996752,
        "SHPLINKID" => 16987
      }
    }

  end
end
