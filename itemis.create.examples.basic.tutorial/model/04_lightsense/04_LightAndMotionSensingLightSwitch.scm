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
          "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\t\t\ninterface motion:\n\tconst timeout: integer = 30\n\tin event detected\n\t\ninterface luminosity:\n\tconst delay: integer = 10\n \tin event bright\n \tin event dark"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 113,
        "y": 247
      },
      "size": {
        "height": 244,
        "width": 699
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 10,
      "embeds": [
        "1bce5f82-4059-4683-8776-ee3519d2978f"
      ],
      "attrs": {
        "name": {
          "text": "Manual",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 114,
        "y": 285.59375
      },
      "size": {
        "height": 204.40625,
        "width": 697
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "z": 15,
      "parent": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "embeds": [
        "dc6814da-5926-4f79-b04f-c3eb1a985dae",
        "2b4db1d9-72ec-4f3c-a271-7f9462620377",
        "974f396c-79d7-4fab-bdb6-524fb5e289c9",
        "ce8e276b-6e7d-4018-9a76-2c9bb9613030",
        "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b",
        "c75075a0-6707-4e4d-8aaa-60109ff1ccda"
      ],
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 177,
        "y": 445
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
      "id": "ce8e276b-6e7d-4018-9a76-2c9bb9613030",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 28,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 160.5,
        "y": 352
      },
      "size": {
        "height": 60.390625,
        "width": 140
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b",
      "z": 30,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "attrs": {
        "name": {
          "text": "Off",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\nbrightness = 0"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "ce8e276b-6e7d-4018-9a76-2c9bb9613030"
      },
      "target": {
        "id": "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 24.5,
            "dy": 49,
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
      "id": "974f396c-79d7-4fab-bdb6-524fb5e289c9",
      "z": 31,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 469,
        "y": 345.046875
      },
      "size": {
        "height": 111.5,
        "width": 299
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "c75075a0-6707-4e4d-8aaa-60109ff1ccda",
      "z": 36,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "attrs": {
        "name": {
          "text": "On",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "hmi.changeBrightness \n [brightness > 1] / brightness -= 1\nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b"
      },
      "target": {
        "id": "c75075a0-6707-4e4d-8aaa-60109ff1ccda",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 12,
            "dy": 21.111114501953125,
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
              "text": "hmi.switch /\nbrightness = 5"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "dc6814da-5926-4f79-b04f-c3eb1a985dae",
      "z": 37,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "c75075a0-6707-4e4d-8aaa-60109ff1ccda"
      },
      "target": {
        "id": "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 133.5,
            "dy": 46,
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
              "text": "hmi.switch"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "2b4db1d9-72ec-4f3c-a271-7f9462620377",
      "z": 37,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 870,
        "y": 330.046875
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "z": 41,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
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
        "x": 870,
        "y": 345.046875
      },
      "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
      "z": 42,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
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
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      },
      "target": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 653,
            "dy": 88,
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
      "id": "47b23e91-9a3f-4654-b9a3-b80f3a862fbc",
      "z": 43,
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 113,
        "y": 568
      },
      "size": {
        "width": 1655,
        "height": 379
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212",
      "z": 291,
      "embeds": [
        "d0058ac7-c3e6-432b-941c-f07d2da10c45"
      ],
      "attrs": {
        "name": {
          "text": "Automatic",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 114,
        "y": 606.59375
      },
      "size": {
        "width": 1653,
        "height": 339.40625
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "z": 292,
      "parent": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212",
      "embeds": [
        "06efc9ad-cbf2-4b5d-93bf-5451a7a3b017",
        "7b6ca5a1-fdb0-4ee1-b1ad-38c7bcd97f04",
        "6a613327-4ae8-45cb-8a9e-be0dbd98ddb5",
        "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef",
        "1d68ae5b-03e0-446c-a7ff-83c055530e4d",
        "2940e906-c116-4133-b056-0e0d42055e41"
      ],
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 153,
        "y": 651.390625
      },
      "size": {
        "height": 265,
        "width": 907
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef",
      "z": 293,
      "embeds": [
        "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
      ],
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "attrs": {
        "name": {
          "text": "Light Sensing",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 1186,
        "y": 674.984375
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
      "id": "1d68ae5b-03e0-446c-a7ff-83c055530e4d",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 294,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1236,
        "y": 651.390625
      },
      "size": {
        "height": 229,
        "width": 467
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2940e906-c116-4133-b056-0e0d42055e41",
      "z": 295,
      "embeds": [
        "8e72dbaf-cb00-49c4-b598-abddd33002df"
      ],
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "attrs": {
        "name": {
          "text": "Motion Sensing",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 154,
        "y": 689.984375
      },
      "size": {
        "height": 225.40625,
        "width": 905
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "z": 299,
      "embeds": [
        "02e93a25-901b-4eeb-a4c3-9544b8b5cd57",
        "65e95d8d-8907-4042-9f02-e36aab630996",
        "e80c87a0-b0cd-4913-be24-fd053ea7e8f0",
        "a8fd8564-45a4-4e37-a557-8d45a3439909",
        "a2463d66-6041-40ac-b113-09d3cacbd7bc",
        "01cc6d9f-e619-4d14-98c0-3ab4c468175e",
        "c70e5079-173d-4053-9ce5-6347b178a52d",
        "646a5265-1550-4be2-a539-c4048618ba85",
        "d716dbdd-08dc-43ee-9a08-e7048362c6a6",
        "01c50d64-80b3-428d-8262-b5e3b243ac83",
        "c3581770-96cf-4eb3-a900-e105415a6c85",
        "bbf91a39-272d-4ea3-99c6-403d6016b99a"
      ],
      "parent": "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef",
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 1237,
        "y": 689.984375
      },
      "size": {
        "height": 189.40625,
        "width": 465
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "z": 300,
      "embeds": [
        "0f69c7ff-a6a1-47ad-83ed-8fec667eb6cc",
        "5c9670ca-e261-460a-ab72-de03e0870ef6",
        "3213eb2e-c0ed-42dd-b007-4b2b2912e4e6",
        "87f5c41d-8920-4b76-a70a-164c9c65a0a1",
        "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b",
        "9c7b669a-335a-4f45-bdc1-c133245203e6"
      ],
      "parent": "2940e906-c116-4133-b056-0e0d42055e41",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 232,
        "y": 752.390625
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
      "id": "646a5265-1550-4be2-a539-c4048618ba85",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <rect width=\"3\" height =\"10\" x=\"80\" y=\"23\" rx=\"5\" />\n      <rect width=\"3\" height =\"10\" x=\"81\" y=\"22\" rx=\"5\" transform=\"rotate(60, 81, 22)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"22\" rx=\"5\" transform=\"rotate(120, 82, 22)\" />\n      <rect width=\"3\" height =\"10\" x=\"83\" y=\"23\" rx=\"5\" transform=\"rotate(180, 83, 23)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"25\" rx=\"5\" transform=\"rotate(240, 82, 25)\" />\n      <rect width=\"3\" height =\"10\" x=\"82\" y=\"25\" rx=\"5\" transform=\"rotate(300, 82, 25)\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 301,
      "embeds": [
        "0586bf86-ec44-425f-94d8-f0fcb8d52d4c"
      ],
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 217,
        "y": 815.390625
      },
      "size": {
        "height": 60.390625,
        "width": 156
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d716dbdd-08dc-43ee-9a08-e7048362c6a6",
      "z": 302,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {
        "name": {
          "text": "Bright",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \nbrightness = 0"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 458,
        "y": 707.390625
      },
      "size": {
        "height": 60,
        "width": 179
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "01c50d64-80b3-428d-8262-b5e3b243ac83",
      "z": 303,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {
        "name": {
          "text": "Getting Dark",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 573,
        "y": 815.390625
      },
      "size": {
        "height": 60.390625,
        "width": 128
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "c3581770-96cf-4eb3-a900-e105415a6c85",
      "z": 304,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {
        "name": {
          "text": "Getting Bright",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 822,
        "y": 707.390625
      },
      "size": {
        "height": 60.390625,
        "width": 162
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bbf91a39-272d-4ea3-99c6-403d6016b99a",
      "z": 305,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {
        "name": {
          "text": "Dark",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \nbrightness = 0"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1282,
        "y": 725.390625
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "87f5c41d-8920-4b76-a70a-164c9c65a0a1",
      "z": 313,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "attrs": {
        "name": {
          "text": "Still",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 1282,
        "y": 822.1875
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
      "id": "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 314,
      "embeds": [
        "cc7401a9-7ef1-448f-8e96-1e0a685ebfd2"
      ],
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1487.678602218628,
        "y": 725.390625
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "9c7b669a-335a-4f45-bdc1-c133245203e6",
      "z": 315,
      "embeds": [
        "872f3e9b-338e-4294-8f4a-c17b1cb183b3"
      ],
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "attrs": {
        "name": {
          "text": "Motion",
          "fill": "#CFD8DC",
          "fontSize": 12
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
        "x": 232,
        "y": 767.390625
      },
      "id": "0586bf86-ec44-425f-94d8-f0fcb8d52d4c",
      "z": 319,
      "parent": "646a5265-1550-4be2-a539-c4048618ba85",
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
        "x": 1282,
        "y": 837.1875
      },
      "id": "cc7401a9-7ef1-448f-8e96-1e0a685ebfd2",
      "z": 320,
      "parent": "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b",
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
        "id": "9c7b669a-335a-4f45-bdc1-c133245203e6"
      },
      "target": {
        "id": "87f5c41d-8920-4b76-a70a-164c9c65a0a1",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 55,
            "dy": 57,
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
              "text": "after motion.timeout s"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "5c9670ca-e261-460a-ab72-de03e0870ef6",
      "z": 321,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "vertices": [
        {
          "x": 1367,
          "y": 810.390625
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b"
      },
      "target": {
        "id": "87f5c41d-8920-4b76-a70a-164c9c65a0a1",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 9,
            "dy": 47,
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
      "id": "3213eb2e-c0ed-42dd-b007-4b2b2912e4e6",
      "z": 321,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "87f5c41d-8920-4b76-a70a-164c9c65a0a1"
      },
      "target": {
        "id": "9c7b669a-335a-4f45-bdc1-c133245203e6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 11.3214111328125,
            "dy": 27.111083984375,
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
              "text": "motion.detected"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "0f69c7ff-a6a1-47ad-83ed-8fec667eb6cc",
      "z": 321,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "1d68ae5b-03e0-446c-a7ff-83c055530e4d"
      },
      "target": {
        "id": "2940e906-c116-4133-b056-0e0d42055e41",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 6,
            "dy": 25.609375,
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
      "id": "7b6ca5a1-fdb0-4ee1-b1ad-38c7bcd97f04",
      "z": 321,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "bbf91a39-272d-4ea3-99c6-403d6016b99a"
      },
      "target": {
        "id": "c3581770-96cf-4eb3-a900-e105415a6c85",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 109,
            "dy": 50.111083984375,
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
              "text": "luminosity.bright"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "02e93a25-901b-4eeb-a4c3-9544b8b5cd57",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [
        {
          "x": 892,
          "y": 845.390625
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "c3581770-96cf-4eb3-a900-e105415a6c85"
      },
      "target": {
        "id": "bbf91a39-272d-4ea3-99c6-403d6016b99a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 18,
            "dy": 50,
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
              "text": "luminosity.dark"
            }
          },
          "position": {
            "distance": 0.40167181339633545,
            "offset": -21,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "65e95d8d-8907-4042-9f02-e36aab630996",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "01c50d64-80b3-428d-8262-b5e3b243ac83"
      },
      "target": {
        "id": "bbf91a39-272d-4ea3-99c6-403d6016b99a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 0,
            "dy": 38.111083984375,
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
              "text": "after luminosity.delay s"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "e80c87a0-b0cd-4913-be24-fd053ea7e8f0",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "c3581770-96cf-4eb3-a900-e105415a6c85"
      },
      "target": {
        "id": "d716dbdd-08dc-43ee-9a08-e7048362c6a6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 129,
            "dy": 31,
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
              "text": "after luminosity.delay s"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "a8fd8564-45a4-4e37-a557-8d45a3439909",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "01c50d64-80b3-428d-8262-b5e3b243ac83"
      },
      "target": {
        "id": "d716dbdd-08dc-43ee-9a08-e7048362c6a6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 91,
            "dy": 16,
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
              "text": "luminosity.bright"
            }
          },
          "position": {
            "distance": 0.4231678614581255,
            "offset": -16,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "a2463d66-6041-40ac-b113-09d3cacbd7bc",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [
        {
          "x": 334,
          "y": 766.3868749999999
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "d716dbdd-08dc-43ee-9a08-e7048362c6a6"
      },
      "target": {
        "id": "01c50d64-80b3-428d-8262-b5e3b243ac83",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 14,
            "dy": 32.111083984375,
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
              "text": "luminosity.dark"
            }
          },
          "position": {}
        },
        {
          "attrs": {
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
      "id": "01cc6d9f-e619-4d14-98c0-3ab4c468175e",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [
        {
          "x": 279,
          "y": 766
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "646a5265-1550-4be2-a539-c4048618ba85"
      },
      "target": {
        "id": "d716dbdd-08dc-43ee-9a08-e7048362c6a6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 25,
            "dy": 24.111083984375,
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
      "id": "c70e5079-173d-4053-9ce5-6347b178a52d",
      "z": 321,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "2940e906-c116-4133-b056-0e0d42055e41"
      },
      "target": {
        "x": 1056,
        "y": 1295,
        "id": "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 878,
            "dy": 82.015625,
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
              "text": "hmi.toggleMode"
            }
          },
          "position": {
            "distance": 0.49557522123893805,
            "offset": 15.999965820312582,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "6a613327-4ae8-45cb-8a9e-be0dbd98ddb5",
      "z": 321,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef"
      },
      "target": {
        "x": 1318,
        "y": 1373,
        "id": "2940e906-c116-4133-b056-0e0d42055e41",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 7,
            "dy": 160.015625,
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
              "text": "hmi.toggleMode"
            }
          },
          "position": {
            "distance": 0.48672566371681414,
            "offset": 23.00003417968742,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "06efc9ad-cbf2-4b5d-93bf-5451a7a3b017",
      "z": 321,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "9c7b669a-335a-4f45-bdc1-c133245203e6"
      },
      "target": {
        "id": "9c7b669a-335a-4f45-bdc1-c133245203e6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 50.3214111328125,
            "dy": 57.111083984375,
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
              "text": "motion.detected"
            }
          },
          "position": {
            "distance": 0.6557487091703337,
            "offset": -18.8387451171875,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "872f3e9b-338e-4294-8f4a-c17b1cb183b3",
      "z": 321,
      "parent": "9c7b669a-335a-4f45-bdc1-c133245203e6",
      "vertices": [
        {
          "x": 1623,
          "y": 755.390625
        },
        {
          "x": 1579,
          "y": 812.390625
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 347,
            "dy": 16.13214111328125,
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
              "text": "hmi.toggleMode"
            }
          },
          "position": {
            "distance": 0.487012987012987,
            "offset": 62,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "587ace39-2f09-4f1d-86ab-df0979fb13d0",
      "z": 322,
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212"
      },
      "target": {
        "x": 568,
        "y": 485,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 454,
            "dy": 199.40625,
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
              "text": "hmi.switch"
            }
          },
          "position": {
            "distance": 0.512987012987013,
            "offset": 43,
            "angle": 0
          }
        },
        {
          "attrs": {
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
      "id": "874721e0-5e49-496f-9ddd-5dd28d7757b0",
      "z": 323,
      "attrs": {}
    }
  ]
}