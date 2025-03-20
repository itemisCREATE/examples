{
  "graph": {
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
        "type": "Region",
        "position": {
          "x": -470,
          "y": 39
        },
        "size": {
          "height": 754,
          "width": 1729
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
        "z": 502,
        "embeds": [
          "587ace39-2f09-4f1d-86ab-df0979fb13d0",
          "874721e0-5e49-496f-9ddd-5dd28d7757b0",
          "47b23e91-9a3f-4654-b9a3-b80f3a862fbc",
          "36b8548a-74b1-4925-ae23-291c03231ee6",
          "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
          "2ee7ac95-6dd2-430d-b4ca-6259e9d22212"
        ],
        "attrs": {
          "name": {
            "text": "main"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -426,
          "y": 73
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
        "z": 503,
        "embeds": [
          "1bce5f82-4059-4683-8776-ee3519d2978f"
        ],
        "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
        "attrs": {
          "name": {
            "text": "Manual",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 351,
          "y": 156.046875
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 504,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -425,
          "y": 111.59375
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
        "z": 509,
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
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 351,
          "y": 171.046875
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 510,
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
        "type": "Entry",
        "position": {
          "x": -362,
          "y": 271
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "ShallowHistory",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "ce8e276b-6e7d-4018-9a76-2c9bb9613030",
        "z": 512,
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
          "x": -378.5,
          "y": 178
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
        "z": 513,
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
        "type": "State",
        "position": {
          "x": -70,
          "y": 171.046875
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
        "z": 514,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "2b4db1d9-72ec-4f3c-a271-7f9462620377",
        "z": 546,
        "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
        "attrs": {}
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "dc6814da-5926-4f79-b04f-c3eb1a985dae",
        "z": 546,
        "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
        "attrs": {}
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "974f396c-79d7-4fab-bdb6-524fb5e289c9",
        "z": 546,
        "parent": "1bce5f82-4059-4683-8776-ee3519d2978f",
        "attrs": {}
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "47b23e91-9a3f-4654-b9a3-b80f3a862fbc",
        "z": 546,
        "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": -432,
          "y": 387
        },
        "size": {
          "height": 379,
          "width": 1655
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212",
        "z": 563,
        "embeds": [
          "d0058ac7-c3e6-432b-941c-f07d2da10c45"
        ],
        "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
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
          "x": -431,
          "y": 425.59375
        },
        "size": {
          "height": 339.40625,
          "width": 1653
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
        "z": 564,
        "parent": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212",
        "embeds": [
          "6a613327-4ae8-45cb-8a9e-be0dbd98ddb5",
          "06efc9ad-cbf2-4b5d-93bf-5451a7a3b017",
          "7b6ca5a1-fdb0-4ee1-b1ad-38c7bcd97f04",
          "1d68ae5b-03e0-446c-a7ff-83c055530e4d",
          "2940e906-c116-4133-b056-0e0d42055e41",
          "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef"
        ],
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 641,
          "y": 493.984375
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "ShallowHistory",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "1d68ae5b-03e0-446c-a7ff-83c055530e4d",
        "z": 565,
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
          "x": 691,
          "y": 470.390625
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
        "z": 566,
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
        "type": "State",
        "position": {
          "x": -387,
          "y": 467
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
        "z": 568,
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
        "type": "Region",
        "position": {
          "x": 692,
          "y": 508.984375
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
        "z": 571,
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
        "type": "Region",
        "position": {
          "x": -386,
          "y": 505.59375
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
        "z": 572,
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
        "type": "State",
        "position": {
          "x": 737,
          "y": 544.390625
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
        "z": 573,
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
          "x": 737,
          "y": 641.1875
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "ShallowHistory",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b",
        "z": 574,
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
          "x": 942.6786022186279,
          "y": 544.390625
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
        "z": 575,
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
        "type": "Entry",
        "position": {
          "x": -308,
          "y": 568
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "DeepHistory",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "646a5265-1550-4be2-a539-c4048618ba85",
        "z": 579,
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
          "x": -323,
          "y": 631
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
        "z": 580,
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
          "x": -82,
          "y": 523
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
        "z": 581,
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
          "x": 33,
          "y": 631
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
        "z": 582,
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
          "x": 282,
          "y": 523
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
        "z": 583,
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
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 737,
          "y": 656.1875
        },
        "id": "cc7401a9-7ef1-448f-8e96-1e0a685ebfd2",
        "z": 591,
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
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -308,
          "y": 583
        },
        "id": "0586bf86-ec44-425f-94d8-f0fcb8d52d4c",
        "z": 593,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "02e93a25-901b-4eeb-a4c3-9544b8b5cd57",
        "z": 594,
        "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
        "vertices": [
          {
            "x": 352,
            "y": 661
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "65e95d8d-8907-4042-9f02-e36aab630996",
        "z": 594,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "e80c87a0-b0cd-4913-be24-fd053ea7e8f0",
        "z": 594,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a8fd8564-45a4-4e37-a557-8d45a3439909",
        "z": 594,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a2463d66-6041-40ac-b113-09d3cacbd7bc",
        "z": 594,
        "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
        "vertices": [
          {
            "x": -206,
            "y": 581.9962499999999
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "01cc6d9f-e619-4d14-98c0-3ab4c468175e",
        "z": 594,
        "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
        "vertices": [
          {
            "x": -261,
            "y": 581.609375
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "c70e5079-173d-4053-9ce5-6347b178a52d",
        "z": 594,
        "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "872f3e9b-338e-4294-8f4a-c17b1cb183b3",
        "z": 594,
        "parent": "9c7b669a-335a-4f45-bdc1-c133245203e6",
        "vertices": [
          {
            "x": 1078,
            "y": 574.390625
          },
          {
            "x": 1034,
            "y": 631.390625
          }
        ],
        "attrs": {}
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5c9670ca-e261-460a-ab72-de03e0870ef6",
        "z": 594,
        "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
        "vertices": [
          {
            "x": 822,
            "y": 629.390625
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "3213eb2e-c0ed-42dd-b007-4b2b2912e4e6",
        "z": 594,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "0f69c7ff-a6a1-47ad-83ed-8fec667eb6cc",
        "z": 594,
        "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "06efc9ad-cbf2-4b5d-93bf-5451a7a3b017",
        "z": 594,
        "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "6a613327-4ae8-45cb-8a9e-be0dbd98ddb5",
        "z": 594,
        "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "7b6ca5a1-fdb0-4ee1-b1ad-38c7bcd97f04",
        "z": 594,
        "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "587ace39-2f09-4f1d-86ab-df0979fb13d0",
        "z": 594,
        "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "874721e0-5e49-496f-9ddd-5dd28d7757b0",
        "z": 594,
        "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
        "attrs": {}
      }
    ]
  }
}