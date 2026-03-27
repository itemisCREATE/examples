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
      "type": "Statechart",
      "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
      "attrs": {
        "name": {
          "text": "TrafficLightCtrl"
        },
        "specification": {
          "text": "@CycleBased(200)\r\n\r\ninterface TrafficLight:\r\n  var red:boolean\t\r\n  var yellow:boolean\r\n  var green:boolean\r\n\r\ninterface Pedestrian:\r\n  var request:boolean\t\t\r\n  var red:boolean\t\t\t\r\n  var green:boolean\r\n\r\ninterface:\r\n  in event pedestrianRequest\t\t\r\n  in event onOff\r\n  operation synchronize() : void\r\n\t\r\n\t\r\ninternal: \r\n  every 200ms / synchronize\r\n\t\r\n"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": -226,
        "y": -43
      },
      "size": {
        "width": 1226,
        "height": 857
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "main region"
        }
      },
      "id": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "z": 391,
      "embeds": [
        "a8e62702-c971-44a6-ac8f-5956572c3b35",
        "2841bd8e-da87-47b4-a2a2-6f2a22271e00",
        "45e156cb-7780-4f06-a224-824a3bd40016",
        "ad675501-5973-454f-987f-3417f01a7cdf",
        "67f24081-2616-4145-8f0b-53d931d95f95",
        "86d34923-6a4a-45b3-9310-678d7c112747"
      ]
    },
    {
      "position": {
        "x": -204,
        "y": 14
      },
      "size": {
        "width": 764,
        "height": 784.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "on",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "ad675501-5973-454f-987f-3417f01a7cdf",
      "z": 392,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "embeds": [
        "b4628b9f-d3d6-4768-a7cc-e734a985b575"
      ]
    },
    {
      "position": {
        "x": 616,
        "y": 14
      },
      "size": {
        "width": 344,
        "height": 403.1953125
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "off",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = false;\r\n  TrafficLight.green = false;\r\n  TrafficLight.yellow = false;\r\n  Pedestrian.red = false;\r\n  Pedestrian.green = false"
        }
      },
      "id": "67f24081-2616-4145-8f0b-53d931d95f95",
      "z": 393,
      "embeds": [
        "df971682-5471-4130-954c-32bda3774907"
      ],
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7"
    },
    {
      "position": {
        "x": -201,
        "y": 59
      },
      "size": {
        "width": 758,
        "height": 736.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "z": 393,
      "embeds": [
        "c7274043-6125-4ea3-835f-78956a332205",
        "9a84551f-3e02-42e0-b7e7-a43cdb228225",
        "37bdcaa2-b900-4bd1-9e4f-b52aef712da0",
        "d255a90a-09f7-439d-a754-757493f5f20c",
        "9b81e9a5-2209-4307-ab3a-448d39d39598",
        "c8dc836a-c181-4264-9100-2003f54bedea",
        "748566d7-b1e6-4f9a-ad20-f07acb1bf2a5",
        "0493cb98-9aff-434b-ba81-0deffe557187",
        "3d0fe935-3044-4b10-8df7-eb274aa93c55",
        "68ac87d0-41ac-4efe-876e-a9be95b2754c",
        "54bc7b6f-baab-4cfc-8786-07da7853b7d2",
        "56f25d98-210d-417b-be54-eaebb6c40f4b",
        "f9169c54-3ad6-4acc-9eb8-a9d26716bff9",
        "082f49f1-dbf0-4460-b27e-d6a903f2b481",
        "bedb1257-4662-4895-83b0-0a0182a25162",
        "c90de27d-94aa-4d4c-bcd8-1caefe44c015",
        "e35e2d5d-ffc0-425c-a999-50877a7c4fdc",
        "503cabac-0de3-4624-9bae-a0677b69d4e5"
      ],
      "parent": "ad675501-5973-454f-987f-3417f01a7cdf"
    },
    {
      "position": {
        "x": 778.5,
        "y": -23
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
      "id": "86d34923-6a4a-45b3-9310-678d7c112747",
      "z": 394,
      "embeds": [
        "7c857c67-00b8-4fa4-96b2-4c02b6d62f02"
      ],
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "e35e2d5d-ffc0-425c-a999-50877a7c4fdc"
      },
      "target": {
        "id": "503cabac-0de3-4624-9bae-a0677b69d4e5",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 132.4029998779297,
            "dy": 0.1953125,
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
              "text": "after 7 s"
            }
          },
          "position": {
            "distance": 0.5000001843456121,
            "offset": 43.000001220703126,
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
      "id": "c7274043-6125-4ea3-835f-78956a332205",
      "z": 394,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": 619,
        "y": 115
      },
      "size": {
        "width": 338,
        "height": 299.1953125
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "df971682-5471-4130-954c-32bda3774907",
      "z": 394,
      "embeds": [
        "d2520e29-e6a8-4b57-b21d-ac7eaaaf8e00",
        "9ec21c70-61b7-4c1a-87cc-d14f393858ea",
        "8bac0b46-6acd-44e7-9db6-1bd7afe46fb0",
        "18d5f90f-e553-462b-8994-e5cf28988973",
        "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a",
        "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb"
      ],
      "parent": "67f24081-2616-4145-8f0b-53d931d95f95"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "503cabac-0de3-4624-9bae-a0677b69d4e5"
      },
      "target": {
        "id": "082f49f1-dbf0-4460-b27e-d6a903f2b481",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 136.00001525878906,
            "dy": 73.00000762939453,
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
              "text": "after 5 s"
            }
          },
          "position": {
            "distance": 0.49999995610560494,
            "offset": 45,
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
      "id": "9a84551f-3e02-42e0-b7e7-a43cdb228225",
      "z": 395,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a"
      },
      "target": {
        "id": "18d5f90f-e553-462b-8994-e5cf28988973",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 102.5186767578125,
            "dy": 2,
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
              "text": "after 500 ms"
            }
          },
          "position": {
            "distance": 0.5256410256410257,
            "offset": 60,
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
      "id": "d2520e29-e6a8-4b57-b21d-ac7eaaaf8e00",
      "z": 395,
      "parent": "df971682-5471-4130-954c-32bda3774907"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "54bc7b6f-baab-4cfc-8786-07da7853b7d2"
      },
      "target": {
        "id": "c90de27d-94aa-4d4c-bcd8-1caefe44c015",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 134.00000762939453,
            "dy": 2.40625,
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
            "distance": 0.49999980763345603,
            "offset": 41.99999931335449,
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
      "id": "37bdcaa2-b900-4bd1-9e4f-b52aef712da0",
      "z": 396,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "18d5f90f-e553-462b-8994-e5cf28988973"
      },
      "target": {
        "id": "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 148.921630859375,
            "dy": 73.1875,
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
              "text": "after 500 ms"
            }
          },
          "position": {
            "distance": 0.47435897435897434,
            "offset": 52,
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
      "id": "9ec21c70-61b7-4c1a-87cc-d14f393858ea",
      "z": 396,
      "parent": "df971682-5471-4130-954c-32bda3774907"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "c90de27d-94aa-4d4c-bcd8-1caefe44c015"
      },
      "target": {
        "id": "e35e2d5d-ffc0-425c-a999-50877a7c4fdc",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 133.00000762939453,
            "dy": 52.70692443847656,
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
            "distance": 0.4999997455353817,
            "offset": 42,
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
      "id": "d255a90a-09f7-439d-a754-757493f5f20c",
      "z": 397,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb"
      },
      "target": {
        "id": "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 121.921630859375,
            "dy": 1.1875,
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
      "id": "8bac0b46-6acd-44e7-9db6-1bd7afe46fb0",
      "z": 397,
      "parent": "df971682-5471-4130-954c-32bda3774907"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "082f49f1-dbf0-4460-b27e-d6a903f2b481"
      },
      "target": {
        "id": "bedb1257-4662-4895-83b0-0a0182a25162",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 25.28192138671875,
            "dy": 71.9022445678711,
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
            "distance": 0.4334830524142943,
            "offset": -12.999999961853028,
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
      "id": "9b81e9a5-2209-4307-ab3a-448d39d39598",
      "z": 398,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "vertices": []
    },
    {
      "position": {
        "x": 662.4813385009766,
        "y": 303.21875
      },
      "size": {
        "height": 77.18749618530273,
        "width": 251.03732299804688
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "YellowOff",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\r\n  TrafficLight.yellow = false;\r\n  Pedestrian.request = false"
        }
      },
      "id": "18d5f90f-e553-462b-8994-e5cf28988973",
      "z": 398,
      "parent": "df971682-5471-4130-954c-32bda3774907"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "bedb1257-4662-4895-83b0-0a0182a25162"
      },
      "target": {
        "id": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9"
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pedestrianRequest"
            }
          },
          "position": {
            "distance": 0.48532757112980063,
            "offset": -72.00001464843751,
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
      "id": "c8dc836a-c181-4264-9100-2003f54bedea",
      "z": 399,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": 666.0783462524414,
        "y": 184.03125381469727
      },
      "size": {
        "height": 77.18749618530273,
        "width": 243.8433074951172
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "YellowOn",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  TrafficLight.yellow = true;\r\n  Pedestrian.request = true"
        }
      },
      "id": "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a",
      "z": 399,
      "parent": "df971682-5471-4130-954c-32bda3774907"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 778.5,
        "y": -8
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "7c857c67-00b8-4fa4-96b2-4c02b6d62f02",
      "z": 400,
      "parent": "86d34923-6a4a-45b3-9310-678d7c112747"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "68ac87d0-41ac-4efe-876e-a9be95b2754c"
      },
      "target": {
        "id": "082f49f1-dbf0-4460-b27e-d6a903f2b481",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 136.00001525878906,
            "dy": 4.000007629394531,
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
              "text": "after 10 s"
            }
          },
          "position": {
            "distance": 0.470077825120507,
            "offset": -41,
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
      "id": "748566d7-b1e6-4f9a-ad20-f07acb1bf2a5",
      "z": 400,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": 780.5,
        "y": 130
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
      "id": "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb",
      "z": 400,
      "embeds": [
        "6285844d-e094-4ef9-87fe-76c5dd61d6b1"
      ],
      "parent": "df971682-5471-4130-954c-32bda3774907"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9"
      },
      "target": {
        "id": "54bc7b6f-baab-4cfc-8786-07da7853b7d2"
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after 7 s"
            }
          },
          "position": {
            "distance": 0.5000000067816839,
            "offset": 14,
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
      "id": "0493cb98-9aff-434b-ba81-0deffe557187",
      "z": 401,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 780.5,
        "y": 145
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "6285844d-e094-4ef9-87fe-76c5dd61d6b1",
      "z": 401,
      "parent": "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "56f25d98-210d-417b-be54-eaebb6c40f4b"
      },
      "target": {
        "id": "68ac87d0-41ac-4efe-876e-a9be95b2754c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 259.00000762939453,
            "dy": 53.111114501953125,
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
      "id": "3d0fe935-3044-4b10-8df7-eb274aa93c55",
      "z": 402,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "vertices": []
    },
    {
      "position": {
        "x": -182.00000762939453,
        "y": 80.40625
      },
      "size": {
        "height": 127.57811737060547,
        "width": 272.64105224609375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Safe",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = true; \r\n  TrafficLight.yellow = false;\r\n  TrafficLight.green = false;\r\n  Pedestrian.red = true;\r\n  Pedestrian.green = false;\r\n  Pedestrian.request = false"
        }
      },
      "id": "68ac87d0-41ac-4efe-876e-a9be95b2754c",
      "z": 403,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": -181.00000762939453,
        "y": 691.40625
      },
      "size": {
        "height": 77.18749618530273,
        "width": 272.64105224609375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StreetAttention",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = false;\r\n  TrafficLight.yellow = true;\r\n  TrafficLight.green = false"
        }
      },
      "id": "54bc7b6f-baab-4cfc-8786-07da7853b7d2",
      "z": 404,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": 155.5,
        "y": 126.1875
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
      "id": "56f25d98-210d-417b-be54-eaebb6c40f4b",
      "z": 405,
      "embeds": [
        "7e605e31-cfe2-4731-b59b-0383c50477fb"
      ],
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 155.5,
        "y": 141.1875
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "7e605e31-cfe2-4731-b59b-0383c50477fb",
      "z": 406,
      "parent": "56f25d98-210d-417b-be54-eaebb6c40f4b"
    },
    {
      "position": {
        "x": 170.64104461669922,
        "y": 474.40625
      },
      "size": {
        "width": 346,
        "height": 306.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "PedWaiting",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "exit / Pedestrian.request = false"
        }
      },
      "id": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9",
      "z": 407,
      "embeds": [
        "9b6c23a8-decf-4b7b-ac68-616c8859037f"
      ],
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": 173.64104461669922,
        "y": 519.40625
      },
      "size": {
        "width": 340,
        "height": 258.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "z": 408,
      "embeds": [
        "5c7b7624-205a-42bd-b150-e6955a2b2656",
        "d63d86f5-602d-4845-a638-4456296b3f29",
        "54375982-c287-42ed-8979-9481d713ea26",
        "72bb3638-8c37-4d48-8ca8-c44e299ca3f6",
        "ea3870a3-6887-4147-9040-ed979e7892cd",
        "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f"
      ],
      "parent": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f"
      },
      "target": {
        "id": "ea3870a3-6887-4147-9040-ed979e7892cd",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 112.478759765625,
            "dy": 10.0078125,
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
      "id": "5c7b7624-205a-42bd-b150-e6955a2b2656",
      "z": 409,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "72bb3638-8c37-4d48-8ca8-c44e299ca3f6"
      },
      "target": {
        "id": "ea3870a3-6887-4147-9040-ed979e7892cd",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 138.87631225585938,
            "dy": 31.605316162109375,
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
              "text": "after 500 ms"
            }
          },
          "position": {
            "distance": 0.4729068728198657,
            "offset": 53,
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
      "id": "d63d86f5-602d-4845-a638-4456296b3f29",
      "z": 410,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "ea3870a3-6887-4147-9040-ed979e7892cd"
      },
      "target": {
        "id": "72bb3638-8c37-4d48-8ca8-c44e299ca3f6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 86.478759765625,
            "dy": 39.3084716796875,
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
              "text": "after 500 ms"
            }
          },
          "position": {
            "distance": 0.5509947641111044,
            "offset": 54,
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
      "id": "54375982-c287-42ed-8979-9481d713ea26",
      "z": 411,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f"
    },
    {
      "position": {
        "x": 232.52125549316406,
        "y": 696.8125
      },
      "size": {
        "height": 60.390625,
        "width": 222.2395782470703
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "waitOff",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\nPedestrian.request = false"
        }
      },
      "id": "72bb3638-8c37-4d48-8ca8-c44e299ca3f6",
      "z": 412,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f"
    },
    {
      "position": {
        "x": 232.52125549316406,
        "y": 587.8046855926514
      },
      "size": {
        "height": 69.78906059265137,
        "width": 222.2395782470703
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "waitOn",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\nPedestrian.request = true"
        }
      },
      "id": "ea3870a3-6887-4147-9040-ed979e7892cd",
      "z": 413,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f"
    },
    {
      "position": {
        "x": 336.1410140991211,
        "y": 540.203125
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
      "id": "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f",
      "z": 414,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "embeds": [
        "7b459b7a-a3da-49d0-9398-bc45c3f68f6c"
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
        "x": 336.1410140991211,
        "y": 555.203125
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "7b459b7a-a3da-49d0-9398-bc45c3f68f6c",
      "z": 415,
      "parent": "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f"
    },
    {
      "position": {
        "x": -182.00000762939453,
        "y": 252.40624237060547
      },
      "size": {
        "height": 75,
        "width": 272.64105224609375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StreetPrepare",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = true;\r\n  TrafficLight.yellow = true;\r\n  TrafficLight.green = false"
        }
      },
      "id": "082f49f1-dbf0-4460-b27e-d6a903f2b481",
      "z": 416,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": 203.71808624267578,
        "y": 218.82813262939453
      },
      "size": {
        "height": 127.57811737060547,
        "width": 279.8459167480469
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StreetGreen",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = false; \r\n  TrafficLight.yellow = false;\r\n  TrafficLight.green = true;\r\n  Pedestrian.red = true;\r\n  Pedestrian.green = false;\r\n  Pedestrian.request = false"
        }
      },
      "id": "bedb1257-4662-4895-83b0-0a0182a25162",
      "z": 417,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": -182.00000762939453,
        "y": 574
      },
      "size": {
        "height": 77.18749618530273,
        "width": 272.64105224609375
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StreetRed",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = true;\r\n  TrafficLight.yellow = false;\r\n  TrafficLight.green = false"
        }
      },
      "id": "c90de27d-94aa-4d4c-bcd8-1caefe44c015",
      "z": 418,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": -180.20150184631348,
        "y": 474.40625
      },
      "size": {
        "height": 60.390625,
        "width": 269.04404067993164
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "PedestrianGreen",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / Pedestrian.red = false;\r\n  Pedestrian.green = true"
        }
      },
      "id": "e35e2d5d-ffc0-425c-a999-50877a7c4fdc",
      "z": 419,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "position": {
        "x": -180.20150184631348,
        "y": 378.2109375
      },
      "size": {
        "height": 60.390625,
        "width": 269.04404067993164
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "PedestrianRed",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / Pedestrian.red = true;\r\n  Pedestrian.green = false"
        }
      },
      "id": "503cabac-0de3-4624-9bae-a0677b69d4e5",
      "z": 420,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "86d34923-6a4a-45b3-9310-678d7c112747"
      },
      "target": {
        "id": "67f24081-2616-4145-8f0b-53d931d95f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 170,
            "dy": 21,
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
      "id": "a8e62702-c971-44a6-ac8f-5956572c3b35",
      "z": 435,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "67f24081-2616-4145-8f0b-53d931d95f95"
      },
      "target": {
        "id": "ad675501-5973-454f-987f-3417f01a7cdf",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 601,
            "dy": 210.11111450195312,
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
              "text": "onOff"
            }
          },
          "position": {
            "offset": 8.999999389648437,
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
      "id": "45e156cb-7780-4f06-a224-824a3bd40016",
      "z": 435,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "ad675501-5973-454f-987f-3417f01a7cdf"
      },
      "target": {
        "id": "67f24081-2616-4145-8f0b-53d931d95f95",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 31,
            "dy": 123.11111450195312,
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
              "text": "onOff"
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
      "id": "2841bd8e-da87-47b4-a2a2-6f2a22271e00",
      "z": 435,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "vertices": []
    }
  ]
}