{
  "cells": [
    {
      "position": {
        "x": 0,
        "y": 0
      },
      "size": {
        "height": 10,
        "width": 10
      },
      "angle": 0,
      "type": "Statechart",
      "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "MyStatechart"
        },
        "specification": {
          "text": "@CycleBased(200)\n/*\n * This is an example of a digital watch. \n * It is a classic watch with four buttons that control the \n * different functions. Available functions are \n * - clock\n * - alarm 1 & 2\n * - chime\n * - stop watch\n * - light\n */\n \n/* \n * The display is part of the watch's external interface. \n */\ninterface display:\n  var first : integer\n  var second : integer\n  var third : integer\n  var text : string\n\t \n/*\n * The buttons are also part of the external interface.\n */\ninterface button:\n  in event mode\n  in event light\t\t// light start stop\n  in event light_r\t// light released\n  in event set \t\t// set\n  in event onoff \t\t// on/off date\n\n/*  */\ninternal:\n  var time : integer = 0\t// elapsed time in tenth of a second\n\t\n  var alarm_1_time : integer = 0\n  var alarm_1_enabled : boolean = false\n  var alarm_2_time : integer = 0\n  var alarm_2_enabled : boolean = false\n\n  var chime_enabled : boolean = false\n   \n  var stop_time : integer = 0\n  var stop_lap_time : integer = 0\n  var stop_display_time : integer = 0\n   \n  var time_set : integer = 0\n   \n  // count the time - assume 100ms cycles\n  oncycle /  time += 1 \n   \n  // handle day overflow after 24 hours\n  oncycle [time >= 864000] / time = 0 \n"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -538,
        "y": -172
      },
      "size": {
        "height": 1141,
        "width": 2095
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "z": 873,
      "embeds": [
        "33405960-b811-42ae-8395-820b268d6417",
        "0335f3fc-4a44-4009-b060-71e585033ce9",
        "907abe78-fd1e-44df-91f6-cc1aaf2b9f82",
        "ab4554b6-0491-4b4c-a30c-5d523b215e38",
        "af27453f-9b2d-427e-9d6e-091c4dae8c99",
        "129d9dfc-7929-49c2-92d6-d0550ecd8515",
        "c7a5b367-ef2b-4f21-b11c-bf62595c74c7",
        "e9694e7e-5fa5-4bca-804f-ae956f422f25",
        "411e8df5-cf67-45c6-9e26-4cf90a69dd1e",
        "a814574e-ffcb-4bb2-bda7-1d37bc6d7861",
        "3c5140b1-f12f-4a7e-85ef-89fa10be4387"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "modes"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -510.5,
        "y": -107
      },
      "size": {
        "height": 1039,
        "width": 1359
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25",
      "z": 874,
      "embeds": [
        "1176d783-1626-47a6-ac98-04f6684fcec5"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {
        "name": {
          "text": "Regular",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "always / time_set = 0 // reset the set time as soon as possible"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": -473.5,
        "y": -146
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "411e8df5-cf67-45c6-9e26-4cf90a69dd1e",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 875,
      "embeds": [
        "97375333-e25a-4dd0-9983-29b610a26962"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1027.506727218628,
        "y": -53
      },
      "size": {
        "height": 240,
        "width": 156
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "a814574e-ffcb-4bb2-bda7-1d37bc6d7861",
      "z": 876,
      "embeds": [
        "a0704655-9bb4-4cfa-86ac-0591c84103a9"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {
        "name": {
          "text": "Alarm",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 959.5067272186279,
        "y": 268.67968368530273
      },
      "size": {
        "height": 483.109375,
        "width": 522
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "3c5140b1-f12f-4a7e-85ef-89fa10be4387",
      "z": 877,
      "embeds": [
        "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {
        "name": {
          "text": "SetTime",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  display.first = (time_set / 36000) % 24;\r\n  display.second = (time_set / 600) % 60;\r\n  display.third = (time_set / 10) % 60"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -509.5,
        "y": -68.40625
      },
      "size": {
        "height": 999.40625,
        "width": 1357
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "z": 885,
      "embeds": [
        "71e16796-4f1f-4eb1-9d74-1bd270b9a23e",
        "076d8913-7f7d-4e80-8d8e-f70467822c5d",
        "ed244c17-dadb-43ce-8173-94d589461818",
        "912352c9-d672-4fe9-bf8e-1365c664be11",
        "05a9893c-e27c-4e22-bf6a-a92d1383e97f",
        "67b10671-9abe-4bb8-9908-4f4adacf4f87",
        "ce7c9c54-c8f9-467f-a378-428466509838",
        "11311809-9e11-4051-8c1d-3b81fe832165",
        "8965aaf3-7c57-42f5-9435-721367c202ae",
        "ee7e9ff7-3a32-4b1e-a835-b158bff075c5",
        "a00a4336-fb7a-4656-bf91-e9e3aebadaca",
        "138f54f1-1302-497d-b4d2-b65f9e38bf42",
        "330fae2f-b3e3-462b-ab19-b931909122cf",
        "133e1a67-8861-4a9f-959d-ba77a71117a6",
        "a5c5e4f3-9fc5-4785-849c-b20732d71b12",
        "da6ad909-67ba-42fb-80b2-4f5d6f1f3641",
        "238dd18b-d312-493b-a6a8-06489bb7b599",
        "a4f526e2-8e43-4258-b56f-83356956a870",
        "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "67339877-2190-4020-9216-bad8568208cc",
        "ec3c6734-181a-4d41-8c50-37eee3319833"
      ],
      "parent": "e9694e7e-5fa5-4bca-804f-ae956f422f25",
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -473.5,
        "y": -131
      },
      "id": "97375333-e25a-4dd0-9983-29b610a26962",
      "z": 886,
      "parent": "411e8df5-cf67-45c6-9e26-4cf90a69dd1e",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 1028.506727218628,
        "y": -14.40625
      },
      "size": {
        "height": 200.40625,
        "width": 154
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "a0704655-9bb4-4cfa-86ac-0591c84103a9",
      "z": 887,
      "parent": "a814574e-ffcb-4bb2-bda7-1d37bc6d7861",
      "embeds": [
        "2fa7d171-eaed-4d51-bc67-b570f13c200e",
        "202ee3b4-e693-4772-ba6a-7b9d7087fe51"
      ],
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 960.5067272186279,
        "y": 357.66405868530273
      },
      "size": {
        "height": 393.125,
        "width": 520
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "z": 888,
      "parent": "3c5140b1-f12f-4a7e-85ef-89fa10be4387",
      "embeds": [
        "1f80ce41-24e3-40c6-918b-7f71117e4e5e",
        "62e5378d-9e7b-4456-a8d6-90a96810be25",
        "14837309-91a2-46ec-a008-08a8c3c34f73",
        "db0c3088-351c-4059-bb65-cc4c88cd468f",
        "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9",
        "db0ab275-833c-4d93-9635-710de5496ef5",
        "3714ada9-6a7a-4253-9e8a-f68124a12565"
      ],
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -474.5,
        "y": -14
      },
      "size": {
        "height": 266,
        "width": 349
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
      "z": 889,
      "embeds": [
        "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "text": "Clock",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry [time_set > 0] / time = time_set\r\n\r\nalways [time % 10 == 0] / \r\n  display.first = (time / 36000) % 24;\r\n  display.second = (time / 600) % 60;\r\n  display.third = (time / 10) % 60;\r\n  display.text = \"\""
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": -308.5,
        "y": -53
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "330fae2f-b3e3-462b-ab19-b931909122cf",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 890,
      "embeds": [
        "740cdce9-11a0-4849-aff2-5ff4eab957f6"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -475.5,
        "y": 306
      },
      "size": {
        "height": 588,
        "width": 791
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "133e1a67-8861-4a9f-959d-ba77a71117a6",
      "z": 891,
      "embeds": [
        "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "text": "Stop Watch",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "// show the current stop watch time MM:SS:TENTH\r\nalways / \r\n  display.first = (alarm_2_time / 600) % 60;\r\n  display.second = (stop_display_time / 10) % 60;\r\n  display.third = (stop_display_time) % 10;\r\n  display.text = \"Stop\""
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 416.86456298828125,
        "y": 230
      },
      "size": {
        "height": 194.765625,
        "width": 395.05859375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "a5c5e4f3-9fc5-4785-849c-b20732d71b12",
      "z": 892,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "text": "Alarm 1",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry [time_set > 0] / alarm_1_time = time_set\r\n\r\nalways / \r\n  display.first = (alarm_1_time / 36000) % 24;\r\n  display.second = (alarm_1_time / 600) % 60;\r\n  display.third = (alarm_1_time / 10) % 60;\r\n  display.text = (alarm_1_enabled) \r\n    ? \"Alarm 1 ON\" : \"Alarm 1 OFF\"\r\n\t\r\nbutton.onoff / alarm_1_enabled = ! alarm_1_enabled"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 511.36456298828125,
        "y": 10.374992370605469
      },
      "size": {
        "height": 115,
        "width": 203
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "da6ad909-67ba-42fb-80b2-4f5d6f1f3641",
      "z": 893,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "text": "Date",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  display.first = 24;\r\n  display.second = 12;\r\n  display.third = 2005;\r\n  display.text = \"Date\""
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 418.9322814941406,
        "y": 498
      },
      "size": {
        "height": 194.765625,
        "width": 387.86456298828125
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "238dd18b-d312-493b-a6a8-06489bb7b599",
      "z": 894,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "text": "Alarm 2",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry [time_set > 0] / alarm_2_time = time_set\r\n\r\nalways / \r\n  display.first = (alarm_2_time / 36000) % 24;\r\n  display.second = (alarm_2_time / 600) % 60;\r\n  display.third = (alarm_2_time / 10) % 60;\r\n  display.text = (alarm_2_enabled) \r\n    ? \"Alarm 2 ON\" : \"Alarm 2 OFF\"\r\n\t\r\nbutton.onoff / alarm_2_enabled = !alarm_2_enabled"
        }
      }
    },
    {
      "type": "Exit",
      "position": {
        "x": 57.5,
        "y": 184
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "a4f526e2-8e43-4258-b56f-83356956a870",
      "z": 895,
      "embeds": [
        "7e2d6517-172a-4071-b1d8-b67761bceb25"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 478.0733337402344,
        "y": 751.7890586853027
      },
      "size": {
        "height": 77.18749618530273,
        "width": 272.64105224609375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
      "z": 896,
      "embeds": [
        "6bd6486b-2476-404b-ae04-f85558f87308"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "text": "Set Chime",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\r\n  display.text = (chime_enabled) \r\n    ? \"Chime ON\" : \"Chime OFF\""
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 766,
        "y": -38
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "DeepHistory",
      "id": "67339877-2190-4020-9216-bad8568208cc",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <rect width=\"3\" height =\"10\" x=\"80\" y=\"23\" rx=\"5\" />\n      <rect width=\"3\" height =\"10\" x=\"81\" y=\"22\" rx=\"5\" transform=\"rotate(60, 81, 22)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"22\" rx=\"5\" transform=\"rotate(120, 82, 22)\" />\n      <rect width=\"3\" height =\"10\" x=\"83\" y=\"23\" rx=\"5\" transform=\"rotate(180, 83, 23)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"25\" rx=\"5\" transform=\"rotate(240, 82, 25)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"25\" rx=\"5\" transform=\"rotate(300, 82, 25)\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 897,
      "embeds": [
        "65f8ed9e-d00d-4807-bca7-8a91dc47a21e"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 796,
        "y": 784
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "ShallowHistory",
      "id": "ec3c6734-181a-4d41-8c50-37eee3319833",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 898,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "embeds": [
        "53cf4dc9-099f-45c7-83e6-18ee5915095b"
      ],
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1053.0452489852905,
        "y": 100
      },
      "size": {
        "height": 60,
        "width": 104.9229564666748
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2fa7d171-eaed-4d51-bc67-b570f13c200e",
      "z": 910,
      "parent": "a0704655-9bb4-4cfa-86ac-0591c84103a9",
      "attrs": {
        "name": {
          "text": "alarm 2 beeps",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1053.0452489852905,
        "y": 10.374992370605469
      },
      "size": {
        "height": 60,
        "width": 104.9229564666748
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "202ee3b4-e693-4772-ba6a-7b9d7087fe51",
      "z": 911,
      "parent": "a0704655-9bb4-4cfa-86ac-0591c84103a9",
      "attrs": {
        "name": {
          "text": "alarm 1 beeps",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 997.7712688446045,
        "y": 424.765625
      },
      "size": {
        "height": 60,
        "width": 445.4709167480469
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "db0c3088-351c-4059-bb65-cc4c88cd468f",
      "z": 912,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {
        "name": {
          "text": "hr",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "button.onoff / display.first =( (display.first + 1) % 24)"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1004.9707164764404,
        "y": 647.7890586853027
      },
      "size": {
        "height": 60,
        "width": 431.072021484375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9",
      "z": 914,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {
        "name": {
          "text": "sec",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "button.onoff / display.third = (display.third + 1) % 60"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -473.5,
        "y": 125.37499237060547
      },
      "size": {
        "height": 125.62500762939453,
        "width": 347
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "z": 917,
      "parent": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
      "embeds": [
        "fb0301e1-f2f0-4dd9-928d-fdc2cba75141",
        "53b82564-e9a1-4bce-8904-e6c774470175",
        "a137f706-57ef-404b-a738-3ec537ac14af",
        "53179ffe-4e01-450b-ab61-ad68f69baf55",
        "99bd1734-26a7-4888-ba73-2acde8374455",
        "41c5bde0-2848-4cf5-84b7-8834aede26b5"
      ],
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -308.5,
        "y": -38
      },
      "id": "740cdce9-11a0-4849-aff2-5ff4eab957f6",
      "z": 918,
      "parent": "330fae2f-b3e3-462b-ab19-b931909122cf",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -474.5,
        "y": 428.57811737060547
      },
      "size": {
        "height": 464.42188262939453,
        "width": 789
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "z": 919,
      "embeds": [
        "9a03fc74-d92e-4cbc-b006-8be4a58ed1eb",
        "81a326c1-62c5-43fb-a8e9-f381ca693cf0",
        "32362f83-873e-4da9-bcea-ae2cd3fdfeb6",
        "6dd6085d-eec1-4a84-a716-0d6d7f8c3052",
        "991a771b-8918-4ceb-bd2b-603c523912ad",
        "33050b49-531f-45e2-af94-a8b452f0ab20",
        "ac6a577d-aff9-48ed-b487-57f48da1a2f5",
        "94ca488d-7a88-423a-8023-f5722e680eb9",
        "3cbc07e1-1cd4-4f60-b67b-1495d62d8c0b"
      ],
      "parent": "133e1a67-8861-4a9f-959d-ba77a71117a6",
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 766,
        "y": -23
      },
      "id": "65f8ed9e-d00d-4807-bca7-8a91dc47a21e",
      "z": 922,
      "parent": "67339877-2190-4020-9216-bad8568208cc",
      "attrs": {
        "label": {
          "text": "deep_entry",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -230.5,
        "y": 160
      },
      "size": {
        "height": 60,
        "width": 71.01345443725586
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "53179ffe-4e01-450b-ab61-ad68f69baf55",
      "z": 924,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "attrs": {
        "name": {
          "text": "wait_set",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -413.5,
        "y": 160
      },
      "size": {
        "height": 60,
        "width": 71.01345443725586
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "99bd1734-26a7-4888-ba73-2acde8374455",
      "z": 925,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "attrs": {
        "name": {
          "text": "normal",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": -453.5,
        "y": 184
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "41c5bde0-2848-4cf5-84b7-8834aede26b5",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 926,
      "embeds": [
        "b75f2723-a507-4165-94fc-e4fa88345350"
      ],
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -443.5,
        "y": 583.7890586853027
      },
      "size": {
        "height": 281,
        "width": 727
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "33050b49-531f-45e2-af94-a8b452f0ab20",
      "z": 930,
      "embeds": [
        "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
        "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729"
      ],
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "attrs": {
        "name": {
          "text": "Operation",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -385.9136276245117,
        "y": 451.90625190734863
      },
      "size": {
        "height": 77.18749618530273,
        "width": 171.82725524902344
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ac6a577d-aff9-48ed-b487-57f48da1a2f5",
      "z": 931,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "attrs": {
        "name": {
          "text": "Zero",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  stop_time = 0; \r\n  stop_lap_time = 0"
        }
      }
    },
    {
      "type": "Synchronization",
      "position": {
        "x": -304.5,
        "y": 536.5
      },
      "size": {
        "width": 8,
        "height": 41
      },
      "angle": 90,
      "fillOpacity": 1,
      "embedable": false,
      "linkable": true,
      "id": "94ca488d-7a88-423a-8023-f5722e680eb9",
      "z": 932,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": -438.5,
        "y": 483
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "DeepHistory",
      "id": "3cbc07e1-1cd4-4f60-b67b-1495d62d8c0b",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <rect width=\"3\" height =\"10\" x=\"80\" y=\"23\" rx=\"5\" />\n      <rect width=\"3\" height =\"10\" x=\"81\" y=\"22\" rx=\"5\" transform=\"rotate(60, 81, 22)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"22\" rx=\"5\" transform=\"rotate(120, 82, 22)\" />\n      <rect width=\"3\" height =\"10\" x=\"83\" y=\"23\" rx=\"5\" transform=\"rotate(180, 83, 23)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"25\" rx=\"5\" transform=\"rotate(240, 82, 25)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"25\" rx=\"5\" transform=\"rotate(300, 82, 25)\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 933,
      "embeds": [
        "8c87f26c-077a-4a8a-8627-02161371b1bb"
      ],
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -453.5,
        "y": 199
      },
      "id": "b75f2723-a507-4165-94fc-e4fa88345350",
      "z": 939,
      "parent": "41c5bde0-2848-4cf5-84b7-8834aede26b5",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -442.5,
        "y": 622.3828086853027
      },
      "size": {
        "height": 241.40625,
        "width": 395.5455801104972
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "z": 940,
      "parent": "33050b49-531f-45e2-af94-a8b452f0ab20",
      "embeds": [
        "60ebb2d4-b94a-4d6e-bb73-b6dc4f289935",
        "43ed297b-bd1b-4564-8533-7e4922587c81",
        "ac886ed5-1d38-4391-984f-95393b692baf",
        "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e",
        "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9",
        "27452d29-aa3b-4c76-bd4e-7acd70a73a7f"
      ],
      "attrs": {
        "name": {
          "text": "display"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -46.95441988950279,
        "y": 622.3828086853027
      },
      "size": {
        "height": 241.40625,
        "width": 329.45441988950273
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "z": 941,
      "parent": "33050b49-531f-45e2-af94-a8b452f0ab20",
      "embeds": [
        "b1260d1a-2b9b-4392-ad8f-b1140c18b2f7",
        "c39ae932-a617-4c9c-a327-45a536f1ae41",
        "95f318df-d502-43da-8134-9e0556c7f62c",
        "4b133d77-47b2-4a75-ae6c-a5ea95dcd324",
        "d5de9484-5319-4394-a583-1690eb08e613",
        "655f488c-967f-493b-9eac-83d1cff60724"
      ],
      "attrs": {
        "name": {
          "text": "run"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -438.5,
        "y": 498
      },
      "id": "8c87f26c-077a-4a8a-8627-02161371b1bb",
      "z": 942,
      "parent": "3cbc07e1-1cd4-4f60-b67b-1495d62d8c0b",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -370.5,
        "y": 666.3046913146973
      },
      "size": {
        "height": 60.390625,
        "width": 258.24217224121094
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e",
      "z": 943,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "attrs": {
        "name": {
          "text": "regular",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "always / \r\n  stop_display_time = stop_time"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": -415.5,
        "y": 692.7890586853027
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 944,
      "embeds": [
        "3beb7d85-e103-47fe-a5d3-0f08920ee6ec"
      ],
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -415.5,
        "y": 767.7890586853027
      },
      "size": {
        "height": 77.18749618530273,
        "width": 351.8619689941406
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "27452d29-aa3b-4c76-bd4e-7acd70a73a7f",
      "z": 945,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "attrs": {
        "name": {
          "text": "lap",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  stop_lap_time = stop_time - stop_lap_time;\r\n  stop_display_time = stop_lap_time"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 16.63065548891518,
        "y": 771.3828067779541
      },
      "size": {
        "height": 68.59374809265137,
        "width": 231.41492462158203
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "4b133d77-47b2-4a75-ae6c-a5ea95dcd324",
      "z": 949,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "attrs": {
        "name": {
          "text": "count",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "oncycle / stop_time += 1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 16.63065548891518,
        "y": 680.2890586853027
      },
      "size": {
        "height": 60,
        "width": 150
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d5de9484-5319-4394-a583-1690eb08e613",
      "z": 950,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "attrs": {
        "name": {
          "text": "pause",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 224.0060848425765,
        "y": 716.7890586853027
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "655f488c-967f-493b-9eac-83d1cff60724",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 951,
      "embeds": [
        "656b03c4-83b9-4a31-92c3-8bbedc203491"
      ],
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -415.5,
        "y": 707.7890586853027
      },
      "id": "3beb7d85-e103-47fe-a5d3-0f08920ee6ec",
      "z": 955,
      "parent": "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 224.0060848425765,
        "y": 731.7890586853027
      },
      "id": "656b03c4-83b9-4a31-92c3-8bbedc203491",
      "z": 956,
      "parent": "655f488c-967f-493b-9eac-83d1cff60724",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "3c5140b1-f12f-4a7e-85ef-89fa10be4387"
      },
      "target": {
        "id": "ec3c6734-181a-4d41-8c50-37eee3319833"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.light, after 120s"
            }
          },
          "position": {
            "distance": 0.5524092236920973,
            "offset": 12,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "0335f3fc-4a44-4009-b060-71e585033ce9",
      "z": 957,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "vertices": [
        {
          "x": 1250,
          "y": 916
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9"
      },
      "target": {
        "id": "ec3c6734-181a-4d41-8c50-37eee3319833"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set \r\n  / time_set = \r\n    (3600 * display.first  \r\n    + 60 * display.second \r\n    + display.third) * 10\t"
            }
          },
          "position": {
            "distance": 0.5635960038376303,
            "offset": 30,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "907abe78-fd1e-44df-91f6-cc1aaf2b9f82",
      "z": 957,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "vertices": [
        {
          "x": 968,
          "y": 862
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400"
      },
      "target": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 229.42666625976562,
            "dy": 76.20831298828125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.onoff / \r\n   chime_enabled = !chime_enabled"
            }
          },
          "position": {
            "offset": 24,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "6bd6486b-2476-404b-ae04-f85558f87308",
      "z": 957,
      "parent": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
      "vertices": [
        {
          "x": 533.5,
          "y": 864.1874961853027
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "238dd18b-d312-493b-a6a8-06489bb7b599"
      },
      "target": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 139.42666625976562,
            "dy": 15.02081298828125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.mode"
            }
          },
          "position": {
            "distance": 0.5169439054028301,
            "offset": -57,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "076d8913-7f7d-4e80-8d8e-f70467822c5d",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "238dd18b-d312-493b-a6a8-06489bb7b599",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 23.567718505859375,
            "dy": 83.80990600585938,
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "a4f526e2-8e43-4258-b56f-83356956a870"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set \r\n  / time_set = alarm_2_time"
            }
          },
          "position": {
            "distance": 0.7203699897555934,
            "offset": 20.11181640625,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "912352c9-d672-4fe9-bf8e-1365c664be11",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": [
        {
          "x": 365.5,
          "y": 528
        },
        {
          "x": 311.5,
          "y": 265
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "a5c5e4f3-9fc5-4785-849c-b20732d71b12"
      },
      "target": {
        "id": "238dd18b-d312-493b-a6a8-06489bb7b599",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 195.56771850585938,
            "dy": 77.80990600585938,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.mode"
            }
          },
          "position": {
            "distance": 0.5546225558599619,
            "offset": -51,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "ed244c17-dadb-43ce-8173-94d589461818",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "a5c5e4f3-9fc5-4785-849c-b20732d71b12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 31.63543701171875,
            "dy": 21.809890747070312,
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "a4f526e2-8e43-4258-b56f-83356956a870"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set\r\n  / time_set = alarm_1_time"
            }
          },
          "position": {
            "distance": 0.5323651009088041,
            "offset": 13.997602110550691,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "67b10671-9abe-4bb8-9908-4f4adacf4f87",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": [
        {
          "x": 287.5,
          "y": 191.5
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "3cbc07e1-1cd4-4f60-b67b-1495d62d8c0b"
      },
      "target": {
        "id": "ac6a577d-aff9-48ed-b487-57f48da1a2f5",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 37.41363525390625,
            "dy": 40.09375,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "81a326c1-62c5-43fb-a8e9-f381ca693cf0",
      "z": 957,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "94ca488d-7a88-423a-8023-f5722e680eb9"
      },
      "target": {
        "id": "ac6a577d-aff9-48ed-b487-57f48da1a2f5",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 85.41363525390625,
            "dy": 67.09375,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "32362f83-873e-4da9-bcea-ae2cd3fdfeb6",
      "z": 957,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "d5de9484-5319-4394-a583-1690eb08e613"
      },
      "target": {
        "id": "94ca488d-7a88-423a-8023-f5722e680eb9"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "always"
            }
          },
          "position": {
            "distance": 0.45238054507880626,
            "offset": 9,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "6dd6085d-eec1-4a84-a716-0d6d7f8c3052",
      "z": 957,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "vertices": [
        {
          "x": -90,
          "y": 644
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "655f488c-967f-493b-9eac-83d1cff60724"
      },
      "target": {
        "id": "4b133d77-47b2-4a75-ae6c-a5ea95dcd324",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 214.96051025390625,
            "dy": 17.40625,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "b1260d1a-2b9b-4392-ad8f-b1140c18b2f7",
      "z": 957,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "d5de9484-5319-4394-a583-1690eb08e613"
      },
      "target": {
        "id": "4b133d77-47b2-4a75-ae6c-a5ea95dcd324",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 99.4149169921875,
            "dy": 21.53839111328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.light"
            }
          },
          "position": {
            "distance": 0.46783476713271904,
            "offset": -50,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "95f318df-d502-43da-8134-9e0556c7f62c",
      "z": 957,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "4b133d77-47b2-4a75-ae6c-a5ea95dcd324"
      },
      "target": {
        "id": "d5de9484-5319-4394-a583-1690eb08e613",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 52.4149169921875,
            "dy": 54.63214111328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.light"
            }
          },
          "position": {
            "distance": 0.5000005496894103,
            "offset": -54,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "c39ae932-a617-4c9c-a327-45a536f1ae41",
      "z": 957,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "27452d29-aa3b-4c76-bd4e-7acd70a73a7f"
      },
      "target": {
        "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 103,
            "dy": 62.61651611328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.onoff"
            }
          },
          "position": {
            "distance": 0.4742731556108502,
            "offset": -53,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "43ed297b-bd1b-4564-8533-7e4922587c81",
      "z": 957,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9"
      },
      "target": {
        "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 27,
            "dy": 36.61651611328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "ac886ed5-1d38-4391-984f-95393b692baf",
      "z": 957,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e"
      },
      "target": {
        "id": "27452d29-aa3b-4c76-bd4e-7acd70a73a7f",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 202,
            "dy": 9.13214111328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.onoff"
            }
          },
          "position": {
            "distance": 0.5486740591346742,
            "offset": -49,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "60ebb2d4-b94a-4d6e-bb73-b6dc4f289935",
      "z": 957,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "ac6a577d-aff9-48ed-b487-57f48da1a2f5"
      },
      "target": {
        "id": "33050b49-531f-45e2-af94-a8b452f0ab20",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 362,
            "dy": 37.34307861328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.light"
            }
          },
          "position": {
            "distance": 0.7900035099395891,
            "offset": -54.05583190917969,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "991a771b-8918-4ceb-bd2b-603c523912ad",
      "z": 957,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "vertices": [
        {
          "x": -122.5,
          "y": 489
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "41c5bde0-2848-4cf5-84b7-8834aede26b5"
      },
      "target": {
        "id": "99bd1734-26a7-4888-ba73-2acde8374455",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 65,
            "dy": 31.7069091796875,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "fb0301e1-f2f0-4dd9-928d-fdc2cba75141",
      "z": 957,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "99bd1734-26a7-4888-ba73-2acde8374455"
      },
      "target": {
        "id": "53179ffe-4e01-450b-ab61-ad68f69baf55",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 11,
            "dy": 20.7069091796875,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "a137f706-57ef-404b-a738-3ec537ac14af",
      "z": 957,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "53179ffe-4e01-450b-ab61-ad68f69baf55"
      },
      "target": {
        "id": "a4f526e2-8e43-4258-b56f-83356956a870"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set \r\n  / time_set = time"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "ce7c9c54-c8f9-467f-a378-428466509838",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "53179ffe-4e01-450b-ab61-ad68f69baf55"
      },
      "target": {
        "id": "99bd1734-26a7-4888-ba73-2acde8374455",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 48,
            "dy": 39.7069091796875,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after 2 s"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "53b82564-e9a1-4bce-8904-e6c774470175",
      "z": 957,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "da6ad909-67ba-42fb-80b2-4f5d6f1f3641"
      },
      "target": {
        "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 345,
            "dy": 84,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.onoff, after 120s"
            }
          },
          "position": {
            "distance": 0.49842980768806133,
            "offset": 12,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "11311809-9e11-4051-8c1d-3b81fe832165",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "330fae2f-b3e3-462b-ab19-b931909122cf"
      },
      "target": {
        "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 173,
            "dy": 12,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "a00a4336-fb7a-4656-bf91-e9e3aebadaca",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "133e1a67-8861-4a9f-959d-ba77a71117a6"
      },
      "target": {
        "x": 22,
        "y": 402,
        "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 180,
            "dy": 101.625,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.mode"
            }
          },
          "position": {
            "distance": 0.4722222222222222,
            "offset": 47,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "ee7e9ff7-3a32-4b1e-a835-b158bff075c5",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 333,
            "dy": 117,
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "a5c5e4f3-9fc5-4785-849c-b20732d71b12",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 63.63543701171875,
            "dy": 15.809890747070312,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.mode"
            }
          },
          "position": {
            "distance": 0.45226265133367366,
            "offset": -9,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "05a9893c-e27c-4e22-bf6a-a92d1383e97f",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42"
      },
      "target": {
        "id": "da6ad909-67ba-42fb-80b2-4f5d6f1f3641",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 5.13543701171875,
            "dy": 25.434906005859375,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.onoff"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "8965aaf3-7c57-42f5-9435-721367c202ae",
      "z": 957,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "411e8df5-cf67-45c6-9e26-4cf90a69dd1e"
      },
      "target": {
        "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 44.5,
            "dy": 28,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "c7a5b367-ef2b-4f21-b11c-bf62595c74c7",
      "z": 957,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25"
      },
      "target": {
        "id": "3c5140b1-f12f-4a7e-85ef-89fa10be4387",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 70.4932861328125,
            "dy": 21.513015747070312,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": " # set_time >"
            }
          },
          "position": {
            "distance": 0.3919016744690794,
            "offset": -14.999997558593748,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "3",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "ab4554b6-0491-4b4c-a30c-5d523b215e38",
      "z": 957,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25"
      },
      "target": {
        "id": "2fa7d171-eaed-4d51-bc67-b570f13c200e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 25.9547119140625,
            "dy": 32.80989074707031,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "[time == alarm_2_time \r\n && alarm_2_enabled]"
            }
          },
          "position": {
            "distance": 0.4804449983576754,
            "offset": -16.000002441406252,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "af27453f-9b2d-427e-9d6e-091c4dae8c99",
      "z": 957,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25"
      },
      "target": {
        "id": "202ee3b4-e693-4772-ba6a-7b9d7087fe51",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 36.9547119140625,
            "dy": 35.43490219116211,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "[time == alarm_1_time \r\n  && alarm_1_enabled]"
            }
          },
          "position": {
            "distance": 0.44622353661238084,
            "offset": -15.000000057220456,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "129d9dfc-7929-49c2-92d6-d0550ecd8515",
      "z": 957,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 1213.006727218628,
        "y": 380
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "db0ab275-833c-4d93-9635-710de5496ef5",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 961,
      "embeds": [
        "93f14c6f-f62e-491c-a3e7-863385cc9387"
      ],
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 1213.006727218628,
        "y": 395
      },
      "id": "93f14c6f-f62e-491c-a3e7-863385cc9387",
      "z": 962,
      "parent": "db0ab275-833c-4d93-9635-710de5496ef5",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "db0ab275-833c-4d93-9635-710de5496ef5"
      },
      "target": {
        "id": "db0c3088-351c-4059-bb65-cc4c88cd468f",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 222.228759765625,
            "dy": 25.044281005859375,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "14837309-91a2-46ec-a008-08a8c3c34f73",
      "z": 963,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 990.5718364715576,
        "y": 541.0937480926514
      },
      "size": {
        "height": 60,
        "width": 459.8697814941406
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "3714ada9-6a7a-4253-9e8a-f68124a12565",
      "z": 964,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {
        "name": {
          "text": "min",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "button.onoff / display.second =( (display.second + 1) % 60)"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "db0c3088-351c-4059-bb65-cc4c88cd468f"
      },
      "target": {
        "id": "3714ada9-6a7a-4253-9e8a-f68124a12565",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 232.42816162109375,
            "dy": 41.716156005859375,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set"
            }
          },
          "position": {
            "distance": 0.4999998347423572,
            "offset": -47.00000000000001,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "1f80ce41-24e3-40c6-918b-7f71117e4e5e",
      "z": 965,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "3714ada9-6a7a-4253-9e8a-f68124a12565"
      },
      "target": {
        "id": "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 217.029296875,
            "dy": 46.02081298828125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set"
            }
          },
          "position": {
            "distance": 0.5428266047410334,
            "offset": -43,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "62e5378d-9e7b-4456-a8d6-90a96810be25",
      "z": 965,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 1606,
        "y": -172
      },
      "size": {
        "height": 402,
        "width": 327
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "z": 967,
      "embeds": [
        "6c971143-ce26-4b14-b671-799cab972178",
        "c75cd9ab-118e-47fd-a7bc-81517b0583b4",
        "3eccadd4-7e3c-4e18-902d-b12a04efb15d",
        "dde24052-0187-4d15-9d92-3e7fe6d39211",
        "ade348f7-33cc-4b6b-9187-bda7fd7e05d1",
        "81f46214-30b6-4a9f-b63b-0cdab90daae8"
      ],
      "attrs": {
        "priority": {
          "text": 2
        },
        "name": {
          "text": "chime"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1659,
        "y": 82.5
      },
      "size": {
        "height": 73,
        "width": 148
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "dde24052-0187-4d15-9d92-3e7fe6d39211",
      "z": 988,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "attrs": {
        "name": {
          "text": "beep",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1660.9865455627441,
        "y": -60
      },
      "size": {
        "height": 70.37499237060547,
        "width": 146.01345443725586
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ade348f7-33cc-4b6b-9187-bda7fd7e05d1",
      "z": 989,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "attrs": {
        "name": {
          "text": "quiet",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 1725.5,
        "y": -146
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "81f46214-30b6-4a9f-b63b-0cdab90daae8",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 990,
      "embeds": [
        "9a75090e-f518-4da7-a96d-7b1e5a72e6f8"
      ],
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 1725.5,
        "y": -131
      },
      "id": "9a75090e-f518-4da7-a96d-7b1e5a72e6f8",
      "z": 991,
      "parent": "81f46214-30b6-4a9f-b63b-0cdab90daae8",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "81f46214-30b6-4a9f-b63b-0cdab90daae8"
      },
      "target": {
        "id": "ade348f7-33cc-4b6b-9187-bda7fd7e05d1",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 72.013427734375,
            "dy": 52.13213348388672,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "3eccadd4-7e3c-4e18-902d-b12a04efb15d",
      "z": 992,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "dde24052-0187-4d15-9d92-3e7fe6d39211"
      },
      "target": {
        "id": "ade348f7-33cc-4b6b-9187-bda7fd7e05d1",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 48.013427734375,
            "dy": 55.13213348388672,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after 2 s"
            }
          },
          "position": {
            "distance": 0.48613612403589346,
            "offset": -45,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "c75cd9ab-118e-47fd-a7bc-81517b0583b4",
      "z": 994,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "ade348f7-33cc-4b6b-9187-bda7fd7e05d1"
      },
      "target": {
        "id": "dde24052-0187-4d15-9d92-3e7fe6d39211",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 93,
            "dy": 21.63213348388672,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "[chime_enabled \r\n&& time % 36000 == 0]"
            }
          },
          "position": {
            "distance": 0.5693193036640929,
            "offset": -84,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "6c971143-ce26-4b14-b671-799cab972178",
      "z": 1007,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 1606,
        "y": 283.30469131469727
      },
      "size": {
        "height": 383,
        "width": 327
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "z": 1008,
      "embeds": [
        "cdcca161-2c52-418d-98f7-9eae6361674c",
        "425ac799-805b-4db3-b0e8-cfc2bc513deb",
        "b65fea35-338d-47ab-854a-223345f91b8e",
        "89fcaac9-f4eb-4597-9b4e-1ae42bc94adb",
        "451d07e1-69e6-4eaf-ae57-322711183e7b",
        "59fb0217-b90c-4557-b31a-6888585688b2"
      ],
      "attrs": {
        "priority": {
          "text": 3
        },
        "name": {
          "text": "lght"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1701,
        "y": 529.0937480926514
      },
      "size": {
        "height": 72,
        "width": 152
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "89fcaac9-f4eb-4597-9b4e-1ae42bc94adb",
      "z": 1009,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "attrs": {
        "name": {
          "text": "on",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1701,
        "y": 397.796875
      },
      "size": {
        "height": 68,
        "width": 152
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "451d07e1-69e6-4eaf-ae57-322711183e7b",
      "z": 1010,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "attrs": {
        "name": {
          "text": "off",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 1769.5,
        "y": 331.66405868530273
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "59fb0217-b90c-4557-b31a-6888585688b2",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 1011,
      "embeds": [
        "3f3b4301-0da8-4e79-8df3-c0b754b55568"
      ],
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 1769.5,
        "y": 346.66405868530273
      },
      "id": "3f3b4301-0da8-4e79-8df3-c0b754b55568",
      "z": 1015,
      "parent": "59fb0217-b90c-4557-b31a-6888585688b2",
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "59fb0217-b90c-4557-b31a-6888585688b2"
      },
      "target": {
        "id": "451d07e1-69e6-4eaf-ae57-322711183e7b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 77,
            "dy": 29.203125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "b65fea35-338d-47ab-854a-223345f91b8e",
      "z": 1016,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "451d07e1-69e6-4eaf-ae57-322711183e7b"
      },
      "target": {
        "id": "89fcaac9-f4eb-4597-9b4e-1ae42bc94adb",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 108,
            "dy": 52.03839111328125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.light"
            }
          },
          "position": {
            "distance": 0.4841998313196197,
            "offset": -50,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "cdcca161-2c52-418d-98f7-9eae6361674c",
      "z": 1016,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "89fcaac9-f4eb-4597-9b4e-1ae42bc94adb"
      },
      "target": {
        "id": "451d07e1-69e6-4eaf-ae57-322711183e7b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 36,
            "dy": 34.203125,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.light_r"
            }
          },
          "position": {
            "distance": 0.5474007374906189,
            "offset": -65,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "425ac799-805b-4db3-b0e8-cfc2bc513deb",
      "z": 1016,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 796,
        "y": 764
      },
      "id": "53cf4dc9-099f-45c7-83e6-18ee5915095b",
      "z": 1017,
      "parent": "ec3c6734-181a-4d41-8c50-37eee3319833",
      "attrs": {
        "label": {
          "text": "time_set",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": 15,
          "textVerticalAnchor": "bottom"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 57.5,
        "y": 164
      },
      "id": "7e2d6517-172a-4071-b1d8-b67761bceb25",
      "z": 1018,
      "parent": "a4f526e2-8e43-4258-b56f-83356956a870",
      "attrs": {
        "label": {
          "text": "set_time",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": 15,
          "textVerticalAnchor": "bottom"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "a814574e-ffcb-4bb2-bda7-1d37bc6d7861"
      },
      "target": {
        "id": "67339877-2190-4020-9216-bad8568208cc"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after 30s,\r\nbutton.mode, \r\nbutton.light,\r\nbutton.set, \r\nbutton.onoff"
            }
          },
          "position": {
            "distance": 0.41886736893914034,
            "offset": 27,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "33405960-b811-42ae-8395-820b268d6417",
      "z": 1019,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e"
      },
      "target": {
        "id": "94ca488d-7a88-423a-8023-f5722e680eb9"
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.onoff"
            }
          },
          "position": {
            "distance": 0.10513302651468369,
            "offset": 48,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "9a03fc74-d92e-4cbc-b006-8be4a58ed1eb",
      "z": 1020,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 21.926666259765625,
            "dy": 43.2109375,
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "x": 294,
        "y": 731,
        "id": "133e1a67-8861-4a9f-959d-ba77a71117a6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 785,
            "dy": 373.421875,
            "rotate": true
          }
        },
        "priority": true
      },
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.mode"
            }
          },
          "position": {
            "distance": 0.1958039074507962,
            "offset": 10.584489363437692,
            "angle": 0
          }
        },
        {
          "attrs": {
            "root": {
              "opacity": 1
            },
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "71e16796-4f1f-4eb1-9d74-1bd270b9a23e",
      "z": 1021,
      "vertices": [
        {
          "x": 366.5,
          "y": 761
        }
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "attrs": {}
    }
  ]
}