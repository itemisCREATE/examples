{
  "cells": [
    {
      "position": {
        "x": 22,
        "y": -328
      },
      "size": {
        "height": 10,
        "width": 10
      },
      "type": "Statechart",
      "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
      "attrs": {
        "name": {
          "text": "MyStatechart"
        },
        "specification": {
          "text": "@CycleBased(200)\n/*\n * This is an example of a digital watch. \n * It is a classic watch with four buttons that control the \n * different functions. Available functions are \n * - clock\n * - alarm 1 & 2\n * - chime\n * - stop watch\n * - light\n */\n \n/* \n * The display is part of the watch's external interface. \n */\ninterface display:\n  var first : integer\n  var second : integer\n  var third : integer\n  var text : string\n\t \n/*\n * The buttons are also part of the external interface.\n */\ninterface button:\n  in event mode\n  in event light\t\t// light start stop\n  in event light_r\t// light released\n  in event set \t\t// set\n  in event onoff \t\t// on/off date\n\n/*  */\ninternal:\n  var time : integer = 0\t// elapsed time in tenth of a second\n\t\n  var alarm_1_time : integer = 0\n  var alarm_1_enabled : boolean = false\n  var alarm_2_time : integer = 0\n  var alarm_2_enabled : boolean = false\n\n  var chime_enabled : boolean = false\n   \n  var stop_time : integer = 0\n  var stop_lap_time : integer = 0\n  var stop_display_time : integer = 0\n   \n  var time_set : integer = 0\n   \n  // count the time - assume 100ms cycles\n  oncycle /  time += 1 \n   \n  // handle day overflow after 24 hours\n  oncycle [time >= 864000] / time = 0 \n"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": -1025,
        "y": -440
      },
      "size": {
        "width": 1788,
        "height": 930
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "modes"
        }
      },
      "id": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "z": 1530,
      "embeds": [
        "ab4554b6-0491-4b4c-a30c-5d523b215e38",
        "907abe78-fd1e-44df-91f6-cc1aaf2b9f82",
        "0335f3fc-4a44-4009-b060-71e585033ce9",
        "129d9dfc-7929-49c2-92d6-d0550ecd8515",
        "af27453f-9b2d-427e-9d6e-091c4dae8c99",
        "33405960-b811-42ae-8395-820b268d6417",
        "c7a5b367-ef2b-4f21-b11c-bf62595c74c7",
        "e9694e7e-5fa5-4bca-804f-ae956f422f25",
        "411e8df5-cf67-45c6-9e26-4cf90a69dd1e",
        "a814574e-ffcb-4bb2-bda7-1d37bc6d7861",
        "3c5140b1-f12f-4a7e-85ef-89fa10be4387"
      ]
    },
    {
      "position": {
        "x": -997.5,
        "y": -375
      },
      "size": {
        "width": 1200,
        "height": 837
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Regular",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "always / time_set = 0 // reset the set time as soon as possible"
        }
      },
      "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25",
      "z": 1531,
      "embeds": [
        "1176d783-1626-47a6-ac98-04f6684fcec5"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": -960.5,
        "y": -414
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "411e8df5-cf67-45c6-9e26-4cf90a69dd1e",
      "z": 1532,
      "embeds": [
        "97375333-e25a-4dd0-9983-29b610a26962"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": -994.5,
        "y": -330
      },
      "size": {
        "width": 1194,
        "height": 789
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "z": 1532,
      "embeds": [
        "05a9893c-e27c-4e22-bf6a-a92d1383e97f",
        "67b10671-9abe-4bb8-9908-4f4adacf4f87",
        "ed244c17-dadb-43ce-8173-94d589461818",
        "076d8913-7f7d-4e80-8d8e-f70467822c5d",
        "912352c9-d672-4fe9-bf8e-1365c664be11",
        "71e16796-4f1f-4eb1-9d74-1bd270b9a23e",
        "8965aaf3-7c57-42f5-9435-721367c202ae",
        "11311809-9e11-4051-8c1d-3b81fe832165",
        "ce7c9c54-c8f9-467f-a378-428466509838",
        "ee7e9ff7-3a32-4b1e-a835-b158bff075c5",
        "a00a4336-fb7a-4656-bf91-e9e3aebadaca",
        "138f54f1-1302-497d-b4d2-b65f9e38bf42",
        "330fae2f-b3e3-462b-ab19-b931909122cf",
        "133e1a67-8861-4a9f-959d-ba77a71117a6",
        "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "a4f526e2-8e43-4258-b56f-83356956a870",
        "da6ad909-67ba-42fb-80b2-4f5d6f1f3641",
        "238dd18b-d312-493b-a6a8-06489bb7b599",
        "a5c5e4f3-9fc5-4785-849c-b20732d71b12",
        "67339877-2190-4020-9216-bad8568208cc",
        "ec3c6734-181a-4d41-8c50-37eee3319833"
      ],
      "parent": "e9694e7e-5fa5-4bca-804f-ae956f422f25"
    },
    {
      "type": "Transition",
      "attrs": {},
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
            "dx": "55.312%",
            "dy": "7.188%",
            "rotate": true
          }
        },
        "priority": true
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "05a9893c-e27c-4e22-bf6a-a92d1383e97f",
      "z": 1533,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "67b10671-9abe-4bb8-9908-4f4adacf4f87",
      "z": 1534,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "ed244c17-dadb-43ce-8173-94d589461818",
      "z": 1535,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "238dd18b-d312-493b-a6a8-06489bb7b599",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "6.431%",
            "dy": "64.18%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "95.895%",
            "dy": "64.777%",
            "rotate": true
          }
        },
        "priority": true
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "076d8913-7f7d-4e80-8d8e-f70467822c5d",
      "z": 1536,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "238dd18b-d312-493b-a6a8-06489bb7b599",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.619%",
            "dy": "10.782%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "a4f526e2-8e43-4258-b56f-83356956a870"
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "912352c9-d672-4fe9-bf8e-1365c664be11",
      "z": 1537,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        "id": "133e1a67-8861-4a9f-959d-ba77a71117a6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "38.861%",
            "dy": "70.732%",
            "rotate": true
          }
        },
        "priority": true
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
            "distance": 0.29103247713532904,
            "offset": 24.545325985884425,
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "71e16796-4f1f-4eb1-9d74-1bd270b9a23e",
      "z": 1538,
      "vertices": [],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "8965aaf3-7c57-42f5-9435-721367c202ae",
      "z": 1539,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "11311809-9e11-4051-8c1d-3b81fe832165",
      "z": 1540,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "53179ffe-4e01-450b-ab61-ad68f69baf55"
      },
      "target": {
        "id": "a4f526e2-8e43-4258-b56f-83356956a870"
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "ce7c9c54-c8f9-467f-a378-428466509838",
      "z": 1541,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "ee7e9ff7-3a32-4b1e-a835-b158bff075c5",
      "z": 1542,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5",
      "vertices": []
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -960.5,
        "y": -399
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "97375333-e25a-4dd0-9983-29b610a26962",
      "z": 1543,
      "parent": "411e8df5-cf67-45c6-9e26-4cf90a69dd1e"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "a00a4336-fb7a-4656-bf91-e9e3aebadaca",
      "z": 1543,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "position": {
        "x": -959.5,
        "y": -271
      },
      "size": {
        "width": 353,
        "height": 266
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Clock",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry [time_set > 0] / time = time_set\r\n\r\nalways [time % 10 == 0] / \r\n  display.first = (time / 36000) % 24;\r\n  display.second = (time / 600) % 60;\r\n  display.third = (time / 10) % 60;\r\n  display.text = \"\""
        }
      },
      "id": "138f54f1-1302-497d-b4d2-b65f9e38bf42",
      "z": 1544,
      "embeds": [
        "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "position": {
        "x": -956.5,
        "y": -142
      },
      "size": {
        "width": 347,
        "height": 134
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "z": 1545,
      "embeds": [
        "fb0301e1-f2f0-4dd9-928d-fdc2cba75141",
        "53b82564-e9a1-4bce-8904-e6c774470175",
        "a137f706-57ef-404b-a738-3ec537ac14af",
        "53179ffe-4e01-450b-ab61-ad68f69baf55",
        "99bd1734-26a7-4888-ba73-2acde8374455",
        "41c5bde0-2848-4cf5-84b7-8834aede26b5"
      ],
      "parent": "138f54f1-1302-497d-b4d2-b65f9e38bf42"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "fb0301e1-f2f0-4dd9-928d-fdc2cba75141",
      "z": 1546,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "53b82564-e9a1-4bce-8904-e6c774470175",
      "z": 1547,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "a137f706-57ef-404b-a738-3ec537ac14af",
      "z": 1548,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
    },
    {
      "position": {
        "x": -713.5,
        "y": -107.37499237060547
      },
      "size": {
        "height": 60,
        "width": 71.01345443725586
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "wait_set",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "53179ffe-4e01-450b-ab61-ad68f69baf55",
      "z": 1549,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
    },
    {
      "position": {
        "x": -896.5,
        "y": -107.37499237060547
      },
      "size": {
        "height": 60,
        "width": 71.01345443725586
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "normal",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "99bd1734-26a7-4888-ba73-2acde8374455",
      "z": 1550,
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
    },
    {
      "position": {
        "x": -936.5,
        "y": -83.37499237060547
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "41c5bde0-2848-4cf5-84b7-8834aede26b5",
      "z": 1551,
      "embeds": [
        "b75f2723-a507-4165-94fc-e4fa88345350"
      ],
      "parent": "f8a6836c-2196-475b-be8c-8b8fe2cbde76"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -936.5,
        "y": -68.37499237060547
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "b75f2723-a507-4165-94fc-e4fa88345350",
      "z": 1552,
      "parent": "41c5bde0-2848-4cf5-84b7-8834aede26b5"
    },
    {
      "position": {
        "x": -793.5,
        "y": -310
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "330fae2f-b3e3-462b-ab19-b931909122cf",
      "z": 1553,
      "embeds": [
        "740cdce9-11a0-4849-aff2-5ff4eab957f6"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -793.5,
        "y": -295
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "740cdce9-11a0-4849-aff2-5ff4eab957f6",
      "z": 1554,
      "parent": "330fae2f-b3e3-462b-ab19-b931909122cf"
    },
    {
      "position": {
        "x": -966,
        "y": 59
      },
      "size": {
        "height": 123,
        "width": 404
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Stop Watch",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "subdiagram": {
          "active": true
        },
        "specification": {
          "text": "// show the current stop watch time MM:SS:TENTH\r\nalways / \r\n  display.first = (alarm_2_time / 600) % 60;\r\n  display.second = (stop_display_time / 10) % 60;\r\n  display.third = (stop_display_time) % 10;\r\n  display.text = \"Stop\""
        },
        "active": true
      },
      "id": "133e1a67-8861-4a9f-959d-ba77a71117a6",
      "z": 1555,
      "embeds": [
        "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "position": {
        "x": -636,
        "y": 285
      },
      "size": {
        "height": 77.18749618530273,
        "width": 273.2161407470703
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Set Chime",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\r\n  display.text = (chime_enabled) \r\n    ? \"Chime ON\" : \"Chime OFF\""
        }
      },
      "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
      "z": 1583,
      "embeds": [
        "6bd6486b-2476-404b-ae04-f85558f87308"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400"
      },
      "target": {
        "id": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "88.575%",
            "dy": "76.437%",
            "rotate": true
          }
        },
        "priority": true
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "6bd6486b-2476-404b-ae04-f85558f87308",
      "z": 1584,
      "parent": "8cc0c8e0-1016-4514-b9c0-d8ed66a23400",
      "vertices": [
        {
          "x": -598,
          "y": 402
        }
      ]
    },
    {
      "position": {
        "x": -435,
        "y": -64
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Exit",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "a4f526e2-8e43-4258-b56f-83356956a870",
      "z": 1585,
      "embeds": [
        "7e2d6517-172a-4071-b1d8-b67761bceb25"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -435,
        "y": -84
      },
      "attrs": {
        "label": {
          "text": "set_time",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": 15,
          "textVerticalAnchor": "bottom"
        }
      },
      "id": "7e2d6517-172a-4071-b1d8-b67761bceb25",
      "z": 1586,
      "parent": "a4f526e2-8e43-4258-b56f-83356956a870"
    },
    {
      "position": {
        "x": -229,
        "y": -282
      },
      "size": {
        "height": 115,
        "width": 203
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Date",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  display.first = 24;\r\n  display.second = 12;\r\n  display.third = 2005;\r\n  display.text = \"Date\""
        }
      },
      "id": "da6ad909-67ba-42fb-80b2-4f5d6f1f3641",
      "z": 1587,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "position": {
        "x": -276,
        "y": 210
      },
      "size": {
        "height": 194.765625,
        "width": 388.7217712402344
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Alarm 2",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry [time_set > 0] / alarm_2_time = time_set\r\n\r\nalways / \r\n  display.first = (alarm_2_time / 36000) % 24;\r\n  display.second = (alarm_2_time / 600) % 60;\r\n  display.third = (alarm_2_time / 10) % 60;\r\n  display.text = (alarm_2_enabled) \r\n    ? \"Alarm 2 ON\" : \"Alarm 2 OFF\"\r\n\t\r\nbutton.onoff / alarm_2_enabled = !alarm_2_enabled"
        }
      },
      "id": "238dd18b-d312-493b-a6a8-06489bb7b599",
      "z": 1588,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "position": {
        "x": -283,
        "y": -64
      },
      "size": {
        "height": 194.765625,
        "width": 395.9375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Alarm 1",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry [time_set > 0] / alarm_1_time = time_set\r\n\r\nalways / \r\n  display.first = (alarm_1_time / 36000) % 24;\r\n  display.second = (alarm_1_time / 600) % 60;\r\n  display.third = (alarm_1_time / 10) % 60;\r\n  display.text = (alarm_1_enabled) \r\n    ? \"Alarm 1 ON\" : \"Alarm 1 OFF\"\r\n\t\r\nbutton.onoff / alarm_1_enabled = ! alarm_1_enabled"
        }
      },
      "id": "a5c5e4f3-9fc5-4785-849c-b20732d71b12",
      "z": 1589,
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "position": {
        "x": 73,
        "y": -245
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "DeepHistory",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "67339877-2190-4020-9216-bad8568208cc",
      "z": 1590,
      "embeds": [
        "65f8ed9e-d00d-4807-bca7-8a91dc47a21e"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 73,
        "y": -230
      },
      "attrs": {
        "label": {
          "text": "deep_entry",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "65f8ed9e-d00d-4807-bca7-8a91dc47a21e",
      "z": 1591,
      "parent": "67339877-2190-4020-9216-bad8568208cc"
    },
    {
      "position": {
        "x": 149,
        "y": 235
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "ShallowHistory",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "ec3c6734-181a-4d41-8c50-37eee3319833",
      "z": 1592,
      "embeds": [
        "53cf4dc9-099f-45c7-83e6-18ee5915095b"
      ],
      "parent": "1176d783-1626-47a6-ac98-04f6684fcec5"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 149,
        "y": 215
      },
      "attrs": {
        "label": {
          "text": "time_set",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": 15,
          "textVerticalAnchor": "bottom"
        }
      },
      "id": "53cf4dc9-099f-45c7-83e6-18ee5915095b",
      "z": 1593,
      "parent": "ec3c6734-181a-4d41-8c50-37eee3319833"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "c7a5b367-ef2b-4f21-b11c-bf62595c74c7",
      "z": 1617,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": 436,
        "y": -316
      },
      "size": {
        "height": 240,
        "width": 156
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Alarm",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "a814574e-ffcb-4bb2-bda7-1d37bc6d7861",
      "z": 1934,
      "embeds": [
        "a0704655-9bb4-4cfa-86ac-0591c84103a9"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": 437,
        "y": -277.40625
      },
      "size": {
        "width": 154,
        "height": 200.40625
      },
      "type": "Region",
      "attrs": {},
      "id": "a0704655-9bb4-4cfa-86ac-0591c84103a9",
      "z": 1935,
      "parent": "a814574e-ffcb-4bb2-bda7-1d37bc6d7861",
      "embeds": [
        "2fa7d171-eaed-4d51-bc67-b570f13c200e",
        "202ee3b4-e693-4772-ba6a-7b9d7087fe51"
      ]
    },
    {
      "position": {
        "x": 461.5385217666626,
        "y": -163
      },
      "size": {
        "height": 60,
        "width": 104.9229564666748
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "alarm 2 beeps",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "2fa7d171-eaed-4d51-bc67-b570f13c200e",
      "z": 1936,
      "parent": "a0704655-9bb4-4cfa-86ac-0591c84103a9"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "af27453f-9b2d-427e-9d6e-091c4dae8c99",
      "z": 1938,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "a814574e-ffcb-4bb2-bda7-1d37bc6d7861"
      },
      "target": {
        "id": "67339877-2190-4020-9216-bad8568208cc"
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
            "distance": 0.4016259730547324,
            "offset": 57,
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "33405960-b811-42ae-8395-820b268d6417",
      "z": 1938,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": 466,
        "y": -243
      },
      "size": {
        "height": 60,
        "width": 104.9229564666748
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "alarm 1 beeps",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "202ee3b4-e693-4772-ba6a-7b9d7087fe51",
      "z": 1946,
      "parent": "a0704655-9bb4-4cfa-86ac-0591c84103a9"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "x": 165,
        "y": -203,
        "id": "e9694e7e-5fa5-4bca-804f-ae956f422f25",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "97.111%",
            "dy": "21.927%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "202ee3b4-e693-4772-ba6a-7b9d7087fe51",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.953%",
            "dy": "63.333%",
            "rotate": true
          }
        },
        "priority": true
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
            "distance": 0.32504180693073204,
            "offset": -24.016370080995124,
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "129d9dfc-7929-49c2-92d6-d0550ecd8515",
      "z": 1947,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "vertices": [
        {
          "x": 396,
          "y": -193.88
        }
      ]
    },
    {
      "position": {
        "x": 292,
        "y": -6
      },
      "size": {
        "height": 93.984375,
        "width": 397
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "SetTime",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "subdiagram": {
          "active": true
        },
        "specification": {
          "text": "entry / \r\n  display.first = (time_set / 36000) % 24;\r\n  display.second = (time_set / 600) % 60;\r\n  display.third = (time_set / 10) % 60"
        },
        "active": true
      },
      "id": "3c5140b1-f12f-4a7e-85ef-89fa10be4387",
      "z": 1948,
      "embeds": [
        "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": 295,
        "y": 82.984375
      },
      "size": {
        "width": 574,
        "height": 539
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9",
      "z": 1949,
      "parent": "3c5140b1-f12f-4a7e-85ef-89fa10be4387",
      "embeds": [
        "dcf420bc-01be-445a-998f-7ba3dd00d8b6",
        "1f80ce41-24e3-40c6-918b-7f71117e4e5e",
        "62e5378d-9e7b-4456-a8d6-90a96810be25",
        "14837309-91a2-46ec-a008-08a8c3c34f73",
        "db0c3088-351c-4059-bb65-cc4c88cd468f",
        "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9",
        "db0ab275-833c-4d93-9635-710de5496ef5",
        "3714ada9-6a7a-4253-9e8a-f68124a12565",
        "a21eab02-e18d-449c-b2f7-5356da5e9cea"
      ]
    },
    {
      "position": {
        "x": 332.26454162597656,
        "y": 150.08594131469727
      },
      "size": {
        "height": 60,
        "width": 446.46917724609375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "hr",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "button.onoff / display.first =( (display.first + 1) % 24)"
        }
      },
      "id": "db0c3088-351c-4059-bb65-cc4c88cd468f",
      "z": 1950,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "position": {
        "x": 339.4639892578125,
        "y": 373.109375
      },
      "size": {
        "height": 60,
        "width": 432.0268859863281
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "sec",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "button.onoff / display.third = (display.third + 1) % 60"
        }
      },
      "id": "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9",
      "z": 1951,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "position": {
        "x": 547.5,
        "y": 105.32031631469727
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "db0ab275-833c-4d93-9635-710de5496ef5",
      "z": 1952,
      "embeds": [
        "93f14c6f-f62e-491c-a3e7-863385cc9387"
      ],
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "position": {
        "x": 325.0651092529297,
        "y": 266.41406440734863
      },
      "size": {
        "height": 60,
        "width": 460.9006042480469
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "min",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "button.onoff / display.second =( (display.second + 1) % 60)"
        }
      },
      "id": "3714ada9-6a7a-4253-9e8a-f68124a12565",
      "z": 1953,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "position": {
        "x": 550,
        "y": 543
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Exit",
      "attrs": {},
      "id": "a21eab02-e18d-449c-b2f7-5356da5e9cea",
      "z": 1954,
      "embeds": [
        "9481dcdd-d129-4e10-865b-67cd4f62611c"
      ],
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 547.5,
        "y": 120.32031631469727
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "93f14c6f-f62e-491c-a3e7-863385cc9387",
      "z": 1959,
      "parent": "db0ab275-833c-4d93-9635-710de5496ef5"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 550,
        "y": 558
      },
      "attrs": {
        "label": {
          "text": "exit_sec0",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "9481dcdd-d129-4e10-865b-67cd4f62611c",
      "z": 1960,
      "parent": "a21eab02-e18d-449c-b2f7-5356da5e9cea"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "62e5378d-9e7b-4456-a8d6-90a96810be25",
      "z": 1961,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "7fffa8c0-0e09-4642-96d5-fdb2e18c67d9"
      },
      "target": {
        "id": "a21eab02-e18d-449c-b2f7-5356da5e9cea"
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "button.set / time_set = \n    (3600 * display.first  \n    + 60 * display.second \n    + display.third) * 10"
            }
          },
          "position": {
            "distance": 0.52729996064957,
            "offset": -109,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "dcf420bc-01be-445a-998f-7ba3dd00d8b6",
      "z": 1961,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "14837309-91a2-46ec-a008-08a8c3c34f73",
      "z": 1961,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "1f80ce41-24e3-40c6-918b-7f71117e4e5e",
      "z": 1961,
      "parent": "eac5c2ca-ae37-477e-b579-4a5d6e9c05a9"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "ab4554b6-0491-4b4c-a30c-5d523b215e38",
      "z": 1961,
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "3c5140b1-f12f-4a7e-85ef-89fa10be4387",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.201%",
            "dy": "99.753%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "ec3c6734-181a-4d41-8c50-37eee3319833"
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": " # exit_sec0 >"
            }
          },
          "position": {
            "distance": 0.7300774505731303,
            "offset": 21.301932934762682,
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "907abe78-fd1e-44df-91f6-cc1aaf2b9f82",
      "z": 1961,
      "vertices": [
        {
          "x": 356.32,
          "y": 231.5
        }
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "3c5140b1-f12f-4a7e-85ef-89fa10be4387"
      },
      "target": {
        "id": "ec3c6734-181a-4d41-8c50-37eee3319833"
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
              "text": "2",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "0335f3fc-4a44-4009-b060-71e585033ce9",
      "z": 1961,
      "vertices": [
        {
          "x": 498,
          "y": 351
        }
      ],
      "parent": "0656b12a-4af6-46a4-b8ff-72c5fdb2c090"
    },
    {
      "position": {
        "x": 786,
        "y": -438
      },
      "size": {
        "width": 327,
        "height": 402
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 2
        },
        "name": {
          "text": "chime"
        }
      },
      "id": "94289f69-8b68-4067-8ae6-fd36f3212213",
      "z": 1962,
      "embeds": [
        "6c971143-ce26-4b14-b671-799cab972178",
        "c75cd9ab-118e-47fd-a7bc-81517b0583b4",
        "3eccadd4-7e3c-4e18-902d-b12a04efb15d",
        "dde24052-0187-4d15-9d92-3e7fe6d39211",
        "ade348f7-33cc-4b6b-9187-bda7fd7e05d1",
        "81f46214-30b6-4a9f-b63b-0cdab90daae8"
      ]
    },
    {
      "position": {
        "x": 839,
        "y": -183.5
      },
      "size": {
        "height": 73,
        "width": 148
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "beep",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "dde24052-0187-4d15-9d92-3e7fe6d39211",
      "z": 1963,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213"
    },
    {
      "position": {
        "x": 840.9865455627441,
        "y": -326
      },
      "size": {
        "height": 70.37499237060547,
        "width": 146.01345443725586
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "quiet",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "ade348f7-33cc-4b6b-9187-bda7fd7e05d1",
      "z": 1964,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213"
    },
    {
      "position": {
        "x": 905.5,
        "y": -412
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "81f46214-30b6-4a9f-b63b-0cdab90daae8",
      "z": 1965,
      "embeds": [
        "9a75090e-f518-4da7-a96d-7b1e5a72e6f8"
      ],
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 905.5,
        "y": -397
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "9a75090e-f518-4da7-a96d-7b1e5a72e6f8",
      "z": 1969,
      "parent": "81f46214-30b6-4a9f-b63b-0cdab90daae8"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "3eccadd4-7e3c-4e18-902d-b12a04efb15d",
      "z": 1970,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "6c971143-ce26-4b14-b671-799cab972178",
      "z": 1970,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "c75cd9ab-118e-47fd-a7bc-81517b0583b4",
      "z": 1970,
      "parent": "94289f69-8b68-4067-8ae6-fd36f3212213"
    },
    {
      "position": {
        "x": 784,
        "y": -5
      },
      "size": {
        "width": 327,
        "height": 383
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 3
        },
        "name": {
          "text": "lght"
        }
      },
      "id": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c",
      "z": 1980,
      "embeds": [
        "cdcca161-2c52-418d-98f7-9eae6361674c",
        "425ac799-805b-4db3-b0e8-cfc2bc513deb",
        "b65fea35-338d-47ab-854a-223345f91b8e",
        "89fcaac9-f4eb-4597-9b4e-1ae42bc94adb",
        "451d07e1-69e6-4eaf-ae57-322711183e7b",
        "59fb0217-b90c-4557-b31a-6888585688b2"
      ]
    },
    {
      "position": {
        "x": 879,
        "y": 240.7890567779541
      },
      "size": {
        "height": 72,
        "width": 152
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "on",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "89fcaac9-f4eb-4597-9b4e-1ae42bc94adb",
      "z": 1981,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c"
    },
    {
      "position": {
        "x": 879,
        "y": 109.49218368530273
      },
      "size": {
        "height": 68,
        "width": 152
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "off",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "451d07e1-69e6-4eaf-ae57-322711183e7b",
      "z": 1982,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c"
    },
    {
      "position": {
        "x": 947.5,
        "y": 43.35936737060547
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "59fb0217-b90c-4557-b31a-6888585688b2",
      "z": 1983,
      "embeds": [
        "3f3b4301-0da8-4e79-8df3-c0b754b55568"
      ],
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 947.5,
        "y": 58.35936737060547
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "3f3b4301-0da8-4e79-8df3-c0b754b55568",
      "z": 1987,
      "parent": "59fb0217-b90c-4557-b31a-6888585688b2"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "b65fea35-338d-47ab-854a-223345f91b8e",
      "z": 1988,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "cdcca161-2c52-418d-98f7-9eae6361674c",
      "z": 1988,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "425ac799-805b-4db3-b0e8-cfc2bc513deb",
      "z": 1988,
      "parent": "2b5d3906-bdd6-41d3-be4d-5abe4cb1929c"
    },
    {
      "position": {
        "x": -955,
        "y": 181.59375
      },
      "size": {
        "width": 765,
        "height": 443.21094131469727
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "z": 1989,
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
      "parent": "133e1a67-8861-4a9f-959d-ba77a71117a6"
    },
    {
      "position": {
        "x": -924,
        "y": 336.80469131469727
      },
      "size": {
        "height": 281,
        "width": 727
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Operation",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "33050b49-531f-45e2-af94-a8b452f0ab20",
      "z": 1995,
      "embeds": [
        "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
        "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729"
      ],
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
    },
    {
      "position": {
        "x": -866.4136276245117,
        "y": 204.92188453674316
      },
      "size": {
        "height": 77.18749618530273,
        "width": 172.1636199951172
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Zero",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  stop_time = 0; \r\n  stop_lap_time = 0"
        }
      },
      "id": "ac6a577d-aff9-48ed-b487-57f48da1a2f5",
      "z": 1996,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
    },
    {
      "position": {
        "x": -785,
        "y": 289.51563262939453
      },
      "size": {
        "width": 8,
        "height": 41
      },
      "type": "Synchronization",
      "fillOpacity": 1,
      "attrs": {},
      "id": "94ca488d-7a88-423a-8023-f5722e680eb9",
      "z": 1997,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
    },
    {
      "position": {
        "x": -919,
        "y": 236.01563262939453
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "DeepHistory",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "3cbc07e1-1cd4-4f60-b67b-1495d62d8c0b",
      "z": 1998,
      "embeds": [
        "8c87f26c-077a-4a8a-8627-02161371b1bb"
      ],
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
    },
    {
      "position": {
        "x": -923,
        "y": 375.39844131469727
      },
      "size": {
        "width": 395.5455801104972,
        "height": 241.40625
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "display"
        }
      },
      "id": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "z": 1999,
      "parent": "33050b49-531f-45e2-af94-a8b452f0ab20",
      "embeds": [
        "60ebb2d4-b94a-4d6e-bb73-b6dc4f289935",
        "43ed297b-bd1b-4564-8533-7e4922587c81",
        "ac886ed5-1d38-4391-984f-95393b692baf",
        "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e",
        "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9",
        "27452d29-aa3b-4c76-bd4e-7acd70a73a7f"
      ]
    },
    {
      "position": {
        "x": -527.4544198895028,
        "y": 375.39844131469727
      },
      "size": {
        "width": 329.45441988950273,
        "height": 241.40625
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "run"
        }
      },
      "id": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "z": 2000,
      "parent": "33050b49-531f-45e2-af94-a8b452f0ab20",
      "embeds": [
        "b1260d1a-2b9b-4392-ad8f-b1140c18b2f7",
        "c39ae932-a617-4c9c-a327-45a536f1ae41",
        "95f318df-d502-43da-8134-9e0556c7f62c",
        "4b133d77-47b2-4a75-ae6c-a5ea95dcd324",
        "d5de9484-5319-4394-a583-1690eb08e613",
        "655f488c-967f-493b-9eac-83d1cff60724"
      ]
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -919,
        "y": 251.01563262939453
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "8c87f26c-077a-4a8a-8627-02161371b1bb",
      "z": 2001,
      "parent": "3cbc07e1-1cd4-4f60-b67b-1495d62d8c0b"
    },
    {
      "position": {
        "x": -851,
        "y": 419.3203239440918
      },
      "size": {
        "height": 60.390625,
        "width": 258.7847137451172
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "regular",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "always / \r\n  stop_display_time = stop_time"
        }
      },
      "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e",
      "z": 2005,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1"
    },
    {
      "position": {
        "x": -896,
        "y": 445.80469131469727
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9",
      "z": 2006,
      "embeds": [
        "3beb7d85-e103-47fe-a5d3-0f08920ee6ec"
      ],
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1"
    },
    {
      "position": {
        "x": -896,
        "y": 520.8046913146973
      },
      "size": {
        "height": 77.18749618530273,
        "width": 352.62152099609375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "lap",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  stop_lap_time = stop_time - stop_lap_time;\r\n  stop_display_time = stop_lap_time"
        }
      },
      "id": "27452d29-aa3b-4c76-bd4e-7acd70a73a7f",
      "z": 2007,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1"
    },
    {
      "position": {
        "x": -463.8693445110848,
        "y": 524.3984394073486
      },
      "size": {
        "height": 68.59374809265137,
        "width": 231.41492462158203
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "count",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "oncycle / stop_time += 1"
        }
      },
      "id": "4b133d77-47b2-4a75-ae6c-a5ea95dcd324",
      "z": 2011,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729"
    },
    {
      "position": {
        "x": -463.8693445110848,
        "y": 433.30469131469727
      },
      "size": {
        "height": 60,
        "width": 150
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "pause",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "d5de9484-5319-4394-a583-1690eb08e613",
      "z": 2012,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729"
    },
    {
      "position": {
        "x": -256.4939151574235,
        "y": 469.80469131469727
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "655f488c-967f-493b-9eac-83d1cff60724",
      "z": 2013,
      "embeds": [
        "656b03c4-83b9-4a31-92c3-8bbedc203491"
      ],
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -896,
        "y": 460.80469131469727
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "3beb7d85-e103-47fe-a5d3-0f08920ee6ec",
      "z": 2014,
      "parent": "d3b6d7d1-0ea6-4fba-8902-c6bd823b96b9"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -256.4939151574235,
        "y": 484.80469131469727
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "656b03c4-83b9-4a31-92c3-8bbedc203491",
      "z": 2015,
      "parent": "655f488c-967f-493b-9eac-83d1cff60724"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "81a326c1-62c5-43fb-a8e9-f381ca693cf0",
      "z": 2016,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "32362f83-873e-4da9-bcea-ae2cd3fdfeb6",
      "z": 2016,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "d5de9484-5319-4394-a583-1690eb08e613"
      },
      "target": {
        "id": "94ca488d-7a88-423a-8023-f5722e680eb9"
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "6dd6085d-eec1-4a84-a716-0d6d7f8c3052",
      "z": 2016,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "vertices": [
        {
          "x": -570.5,
          "y": 397.01563262939453
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "b1260d1a-2b9b-4392-ad8f-b1140c18b2f7",
      "z": 2016,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "95f318df-d502-43da-8134-9e0556c7f62c",
      "z": 2016,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "c39ae932-a617-4c9c-a327-45a536f1ae41",
      "z": 2016,
      "parent": "f0e18ab6-1f9f-4f29-b3bf-77fa94cd1729",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "43ed297b-bd1b-4564-8533-7e4922587c81",
      "z": 2016,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "ac886ed5-1d38-4391-984f-95393b692baf",
      "z": 2016,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1"
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "60ebb2d4-b94a-4d6e-bb73-b6dc4f289935",
      "z": 2016,
      "parent": "fa10efe6-595b-48bb-96a7-92f2bbaac1f1",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "8d94d7c5-718f-4952-9dad-6cb6ff7c9f5e"
      },
      "target": {
        "id": "94ca488d-7a88-423a-8023-f5722e680eb9"
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "9a03fc74-d92e-4cbc-b006-8be4a58ed1eb",
      "z": 2016,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
        },
        {
          "attrs": {}
        },
        {
          "attrs": {}
        }
      ],
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "991a771b-8918-4ceb-bd2b-603c523912ad",
      "z": 2016,
      "parent": "3fc3353b-e7e4-49f1-a7d4-7dcc709c0fc6",
      "vertices": [
        {
          "x": -603,
          "y": 242.01563262939453
        }
      ]
    }
  ]
}