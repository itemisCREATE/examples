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
          "text": "TrafficLightCtrl"
        },
        "specification": {
          "text": "@CycleBased(200)\r\n\r\ninterface TrafficLight:\r\n  var red:boolean\t\r\n  var yellow:boolean\r\n  var green:boolean\r\n\r\ninterface Pedestrian:\r\n  var request:boolean\t\t\r\n  var red:boolean\t\t\t\r\n  var green:boolean\r\n\r\ninterface:\r\n  in event pedestrianRequest\t\t\r\n  in event onOff\r\n  operation synchronize() : void\r\n\t\r\n\t\r\ninternal: \r\n  every 200ms / synchronize\r\n\t\r\n"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -131,
        "y": -296
      },
      "size": {
        "height": 854,
        "width": 1226
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "z": 112,
      "embeds": [
        "a8e62702-c971-44a6-ac8f-5956572c3b35",
        "2841bd8e-da87-47b4-a2a2-6f2a22271e00",
        "45e156cb-7780-4f06-a224-824a3bd40016",
        "ad675501-5973-454f-987f-3417f01a7cdf",
        "67f24081-2616-4145-8f0b-53d931d95f95",
        "86d34923-6a4a-45b3-9310-678d7c112747"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "main region"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -109,
        "y": -242
      },
      "size": {
        "height": 776,
        "width": 760
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ad675501-5973-454f-987f-3417f01a7cdf",
      "z": 113,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "embeds": [
        "b4628b9f-d3d6-4768-a7cc-e734a985b575"
      ],
      "attrs": {
        "name": {
          "text": "on",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -108,
        "y": -203.40625
      },
      "size": {
        "height": 736.40625,
        "width": 758
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "z": 119,
      "parent": "ad675501-5973-454f-987f-3417f01a7cdf",
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
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -89.00000762939453,
        "y": -182
      },
      "size": {
        "height": 127.57811737060547,
        "width": 272.64105224609375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "68ac87d0-41ac-4efe-876e-a9be95b2754c",
      "z": 122,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "Safe",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = true; \r\n  TrafficLight.yellow = false;\r\n  TrafficLight.green = false;\r\n  Pedestrian.red = true;\r\n  Pedestrian.green = false;\r\n  Pedestrian.request = false"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 711,
        "y": -242
      },
      "size": {
        "height": 403.1953125,
        "width": 340
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "67f24081-2616-4145-8f0b-53d931d95f95",
      "z": 136,
      "embeds": [
        "df971682-5471-4130-954c-32bda3774907"
      ],
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "attrs": {
        "name": {
          "text": "off",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = false;\r\n  TrafficLight.green = false;\r\n  TrafficLight.yellow = false;\r\n  Pedestrian.red = false;\r\n  Pedestrian.green = false"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 712,
        "y": -136.21875
      },
      "size": {
        "height": 296.4140625,
        "width": 338
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "df971682-5471-4130-954c-32bda3774907",
      "z": 137,
      "parent": "67f24081-2616-4145-8f0b-53d931d95f95",
      "embeds": [
        "d2520e29-e6a8-4b57-b21d-ac7eaaaf8e00",
        "9ec21c70-61b7-4c1a-87cc-d14f393858ea",
        "8bac0b46-6acd-44e7-9db6-1bd7afe46fb0",
        "18d5f90f-e553-462b-8994-e5cf28988973",
        "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a",
        "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb"
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "2841bd8e-da87-47b4-a2a2-6f2a22271e00",
      "z": 145,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "45e156cb-7780-4f06-a224-824a3bd40016",
      "z": 145,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -88.00000762939453,
        "y": 429
      },
      "size": {
        "height": 77.18749618530273,
        "width": 272.64105224609375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "54bc7b6f-baab-4cfc-8786-07da7853b7d2",
      "z": 160,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "StreetAttention",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = false;\r\n  TrafficLight.yellow = true;\r\n  TrafficLight.green = false"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 248.5,
        "y": -136.21875
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
      "id": "56f25d98-210d-417b-be54-eaebb6c40f4b",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 190,
      "embeds": [
        "7e605e31-cfe2-4731-b59b-0383c50477fb"
      ],
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
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
        "x": 248.5,
        "y": -121.21875
      },
      "id": "7e605e31-cfe2-4731-b59b-0383c50477fb",
      "z": 191,
      "parent": "56f25d98-210d-417b-be54-eaebb6c40f4b",
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
      "id": "3d0fe935-3044-4b10-8df7-eb274aa93c55",
      "z": 192,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 263.6410446166992,
        "y": 212
      },
      "size": {
        "height": 298,
        "width": 342
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9",
      "z": 198,
      "embeds": [
        "9b6c23a8-decf-4b7b-ac68-616c8859037f"
      ],
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "PedWaiting",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "exit / Pedestrian.request = false"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 264.6410446166992,
        "y": 250.59375
      },
      "size": {
        "height": 258.40625,
        "width": 340
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "z": 199,
      "parent": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9",
      "embeds": [
        "5c7b7624-205a-42bd-b150-e6955a2b2656",
        "d63d86f5-602d-4845-a638-4456296b3f29",
        "54375982-c287-42ed-8979-9481d713ea26",
        "72bb3638-8c37-4d48-8ca8-c44e299ca3f6",
        "ea3870a3-6887-4147-9040-ed979e7892cd",
        "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f"
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9"
      },
      "target": {
        "id": "54bc7b6f-baab-4cfc-8786-07da7853b7d2"
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
        }
      ],
      "id": "0493cb98-9aff-434b-ba81-0deffe557187",
      "z": 202,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -89.00000762939453,
        "y": -10.000007629394531
      },
      "size": {
        "height": 75,
        "width": 272.64105224609375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "082f49f1-dbf0-4460-b27e-d6a903f2b481",
      "z": 213,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "StreetPrepare",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = true;\r\n  TrafficLight.yellow = true;\r\n  TrafficLight.green = false"
        }
      }
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "748566d7-b1e6-4f9a-ad20-f07acb1bf2a5",
      "z": 214,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 296.7180862426758,
        "y": -43.57811737060547
      },
      "size": {
        "height": 127.57811737060547,
        "width": 279.8459167480469
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bedb1257-4662-4895-83b0-0a0182a25162",
      "z": 215,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "StreetGreen",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = false; \r\n  TrafficLight.yellow = false;\r\n  TrafficLight.green = true;\r\n  Pedestrian.red = true;\r\n  Pedestrian.green = false;\r\n  Pedestrian.request = false"
        }
      }
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "9b81e9a5-2209-4307-ab3a-448d39d39598",
      "z": 216,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "bedb1257-4662-4895-83b0-0a0182a25162"
      },
      "target": {
        "id": "f9169c54-3ad6-4acc-9eb8-a9d26716bff9"
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
        }
      ],
      "id": "c8dc836a-c181-4264-9100-2003f54bedea",
      "z": 216,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -89.00000762939453,
        "y": 311.59375
      },
      "size": {
        "height": 77.18749618530273,
        "width": 272.64105224609375
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "c90de27d-94aa-4d4c-bcd8-1caefe44c015",
      "z": 217,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "StreetRed",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / TrafficLight.red = true;\r\n  TrafficLight.yellow = false;\r\n  TrafficLight.green = false"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -87.20150184631348,
        "y": 212
      },
      "size": {
        "height": 60.390625,
        "width": 269.04404067993164
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "e35e2d5d-ffc0-425c-a999-50877a7c4fdc",
      "z": 219,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "PedestrianGreen",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / Pedestrian.red = false;\r\n  Pedestrian.green = true"
        }
      }
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "d255a90a-09f7-439d-a754-757493f5f20c",
      "z": 221,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "37bdcaa2-b900-4bd1-9e4f-b52aef712da0",
      "z": 223,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 323.52125549316406,
        "y": 428
      },
      "size": {
        "height": 60.390625,
        "width": 222.2395782470703
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "72bb3638-8c37-4d48-8ca8-c44e299ca3f6",
      "z": 230,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "attrs": {
        "name": {
          "text": "waitOff",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\nPedestrian.request = false"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 323.52125549316406,
        "y": 318.99218559265137
      },
      "size": {
        "height": 69.78906059265137,
        "width": 222.2395782470703
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ea3870a3-6887-4147-9040-ed979e7892cd",
      "z": 232,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "attrs": {
        "name": {
          "text": "waitOn",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\nPedestrian.request = true"
        }
      }
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "d63d86f5-602d-4845-a638-4456296b3f29",
      "z": 233,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "54375982-c287-42ed-8979-9481d713ea26",
      "z": 233,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 427.1410140991211,
        "y": 271.390625
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
      "id": "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 234,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "embeds": [
        "7b459b7a-a3da-49d0-9398-bc45c3f68f6c"
      ],
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
        "x": 427.1410140991211,
        "y": 286.390625
      },
      "id": "7b459b7a-a3da-49d0-9398-bc45c3f68f6c",
      "z": 235,
      "parent": "9f207ad2-6979-4d2a-b2e8-778b1bd30c0f",
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
        "x": 755.4813385009766,
        "y": 52
      },
      "size": {
        "height": 77.18749618530273,
        "width": 251.03732299804688
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "18d5f90f-e553-462b-8994-e5cf28988973",
      "z": 237,
      "parent": "df971682-5471-4130-954c-32bda3774907",
      "attrs": {
        "name": {
          "text": "YellowOff",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\r\n  TrafficLight.yellow = false;\r\n  Pedestrian.request = false"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 759.0783462524414,
        "y": -67.18749618530273
      },
      "size": {
        "height": 77.18749618530273,
        "width": 243.8433074951172
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "318f68bf-c070-43e4-b4bd-fcd08f9d0b4a",
      "z": 239,
      "parent": "df971682-5471-4130-954c-32bda3774907",
      "attrs": {
        "name": {
          "text": "YellowOn",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \r\n  TrafficLight.yellow = true;\r\n  Pedestrian.request = true"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 873.5,
        "y": -121.21875
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
      "id": "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 241,
      "embeds": [
        "6285844d-e094-4ef9-87fe-76c5dd61d6b1"
      ],
      "parent": "df971682-5471-4130-954c-32bda3774907",
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
        "x": 873.5,
        "y": -106.21875
      },
      "id": "6285844d-e094-4ef9-87fe-76c5dd61d6b1",
      "z": 242,
      "parent": "2f9bd32e-20c4-4a4f-9ed2-e2149c40e5cb",
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
      "id": "8bac0b46-6acd-44e7-9db6-1bd7afe46fb0",
      "z": 243,
      "parent": "df971682-5471-4130-954c-32bda3774907",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "9ec21c70-61b7-4c1a-87cc-d14f393858ea",
      "z": 244,
      "parent": "df971682-5471-4130-954c-32bda3774907",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "d2520e29-e6a8-4b57-b21d-ac7eaaaf8e00",
      "z": 245,
      "parent": "df971682-5471-4130-954c-32bda3774907",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 873.5,
        "y": -279
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
      "id": "86d34923-6a4a-45b3-9310-678d7c112747",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 246,
      "embeds": [
        "7c857c67-00b8-4fa4-96b2-4c02b6d62f02"
      ],
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
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
        "x": 873.5,
        "y": -264
      },
      "id": "7c857c67-00b8-4fa4-96b2-4c02b6d62f02",
      "z": 247,
      "parent": "86d34923-6a4a-45b3-9310-678d7c112747",
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
      "id": "a8e62702-c971-44a6-ac8f-5956572c3b35",
      "z": 248,
      "parent": "df9504d9-6318-4b9e-8ac4-99eb9eaeddc7",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -87.20150184631348,
        "y": 115.8046875
      },
      "size": {
        "height": 60.390625,
        "width": 269.04404067993164
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "503cabac-0de3-4624-9bae-a0677b69d4e5",
      "z": 253,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {
        "name": {
          "text": "PedestrianRed",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / Pedestrian.red = true;\r\n  Pedestrian.green = false"
        }
      }
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "c7274043-6125-4ea3-835f-78956a332205",
      "z": 254,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "9a84551f-3e02-42e0-b7e7-a43cdb228225",
      "z": 254,
      "parent": "b4628b9f-d3d6-4768-a7cc-e734a985b575",
      "attrs": {}
    },
    {
      "type": "Transition",
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
      "id": "5c7b7624-205a-42bd-b150-e6955a2b2656",
      "z": 255,
      "parent": "9b6c23a8-decf-4b7b-ac68-616c8859037f",
      "attrs": {}
    }
  ]
}