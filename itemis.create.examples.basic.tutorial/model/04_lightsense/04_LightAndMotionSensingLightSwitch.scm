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
          "text": "MyStatechart"
        },
        "specification": {
          "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\t\t\ninterface motion:\n\tconst timeout: integer = 30\n\tin event detected\n\t\ninterface luminosity:\n\tconst delay: integer = 10\n \tin event bright\n \tin event dark"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": -470,
        "y": 39
      },
      "size": {
        "width": 1729,
        "height": 754
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "main"
        }
      },
      "id": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4",
      "z": 502,
      "embeds": [
        "587ace39-2f09-4f1d-86ab-df0979fb13d0",
        "874721e0-5e49-496f-9ddd-5dd28d7757b0",
        "47b23e91-9a3f-4654-b9a3-b80f3a862fbc",
        "36b8548a-74b1-4925-ae23-291c03231ee6",
        "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "2ee7ac95-6dd2-430d-b4ca-6259e9d22212"
      ]
    },
    {
      "position": {
        "x": -426,
        "y": 73
      },
      "size": {
        "width": 703,
        "height": 252.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Manual",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 503,
      "embeds": [
        "1bce5f82-4059-4683-8776-ee3519d2978f"
      ],
      "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4"
    },
    {
      "position": {
        "x": 351,
        "y": 156.046875
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Initial",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "z": 504,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4"
    },
    {
      "position": {
        "x": -423,
        "y": 118
      },
      "size": {
        "width": 697,
        "height": 204.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "1bce5f82-4059-4683-8776-ee3519d2978f",
      "z": 504,
      "embeds": [
        "dc6814da-5926-4f79-b04f-c3eb1a985dae",
        "2b4db1d9-72ec-4f3c-a271-7f9462620377",
        "974f396c-79d7-4fab-bdb6-524fb5e289c9",
        "ce8e276b-6e7d-4018-9a76-2c9bb9613030",
        "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b",
        "c75075a0-6707-4e4d-8aaa-60109ff1ccda"
      ],
      "parent": "36b8548a-74b1-4925-ae23-291c03231ee6"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "dc6814da-5926-4f79-b04f-c3eb1a985dae",
      "z": 505,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "2b4db1d9-72ec-4f3c-a271-7f9462620377",
      "z": 506,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "974f396c-79d7-4fab-bdb6-524fb5e289c9",
      "z": 507,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f"
    },
    {
      "position": {
        "x": -360,
        "y": 277.40625
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
      "id": "ce8e276b-6e7d-4018-9a76-2c9bb9613030",
      "z": 508,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f"
    },
    {
      "position": {
        "x": -376.5,
        "y": 184.40625
      },
      "size": {
        "height": 60.390625,
        "width": 140
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Off",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\nbrightness = 0"
        }
      },
      "id": "b326bafa-b1e8-4c76-ab8f-311ae1a1b79b",
      "z": 509,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f"
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
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
      "z": 510,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
    },
    {
      "position": {
        "x": -68,
        "y": 177.453125
      },
      "size": {
        "height": 111.5,
        "width": 299
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "On",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "hmi.changeBrightness \n [brightness > 1] / brightness -= 1\nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10"
        }
      },
      "id": "c75075a0-6707-4e4d-8aaa-60109ff1ccda",
      "z": 510,
      "parent": "1bce5f82-4059-4683-8776-ee3519d2978f"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "47b23e91-9a3f-4654-b9a3-b80f3a862fbc",
      "z": 546,
      "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4"
    },
    {
      "position": {
        "x": -432,
        "y": 387
      },
      "size": {
        "width": 1659,
        "height": 387.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Automatic",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212",
      "z": 563,
      "embeds": [
        "d0058ac7-c3e6-432b-941c-f07d2da10c45"
      ],
      "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4"
    },
    {
      "position": {
        "x": -429,
        "y": 432
      },
      "size": {
        "width": 1653,
        "height": 339.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "d0058ac7-c3e6-432b-941c-f07d2da10c45",
      "z": 564,
      "embeds": [
        "6a613327-4ae8-45cb-8a9e-be0dbd98ddb5",
        "06efc9ad-cbf2-4b5d-93bf-5451a7a3b017",
        "7b6ca5a1-fdb0-4ee1-b1ad-38c7bcd97f04",
        "1d68ae5b-03e0-446c-a7ff-83c055530e4d",
        "2940e906-c116-4133-b056-0e0d42055e41",
        "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef"
      ],
      "parent": "2ee7ac95-6dd2-430d-b4ca-6259e9d22212"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "6a613327-4ae8-45cb-8a9e-be0dbd98ddb5",
      "z": 565,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "06efc9ad-cbf2-4b5d-93bf-5451a7a3b017",
      "z": 566,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "7b6ca5a1-fdb0-4ee1-b1ad-38c7bcd97f04",
      "z": 567,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45"
    },
    {
      "position": {
        "x": 643,
        "y": 500.390625
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
      "id": "1d68ae5b-03e0-446c-a7ff-83c055530e4d",
      "z": 568,
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45"
    },
    {
      "position": {
        "x": 693,
        "y": 476.796875
      },
      "size": {
        "width": 471,
        "height": 237.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Motion Sensing",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "2940e906-c116-4133-b056-0e0d42055e41",
      "z": 569,
      "embeds": [
        "8e72dbaf-cb00-49c4-b598-abddd33002df"
      ],
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45"
    },
    {
      "position": {
        "x": 696,
        "y": 521.796875
      },
      "size": {
        "width": 465,
        "height": 189.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "z": 570,
      "embeds": [
        "0f69c7ff-a6a1-47ad-83ed-8fec667eb6cc",
        "5c9670ca-e261-460a-ab72-de03e0870ef6",
        "3213eb2e-c0ed-42dd-b007-4b2b2912e4e6",
        "87f5c41d-8920-4b76-a70a-164c9c65a0a1",
        "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b",
        "9c7b669a-335a-4f45-bdc1-c133245203e6"
      ],
      "parent": "2940e906-c116-4133-b056-0e0d42055e41"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "0f69c7ff-a6a1-47ad-83ed-8fec667eb6cc",
      "z": 571,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "5c9670ca-e261-460a-ab72-de03e0870ef6",
      "z": 572,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df",
      "vertices": [
        {
          "x": 826,
          "y": 642.203125
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "3213eb2e-c0ed-42dd-b007-4b2b2912e4e6",
      "z": 573,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df"
    },
    {
      "position": {
        "x": 741,
        "y": 557.203125
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Still",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "87f5c41d-8920-4b76-a70a-164c9c65a0a1",
      "z": 574,
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df"
    },
    {
      "position": {
        "x": 741,
        "y": 654
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
      "id": "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b",
      "z": 575,
      "embeds": [
        "cc7401a9-7ef1-448f-8e96-1e0a685ebfd2"
      ],
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 741,
        "y": 669
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "cc7401a9-7ef1-448f-8e96-1e0a685ebfd2",
      "z": 576,
      "parent": "e1ed7bca-4def-4dc1-a8a2-424c028a6b4b"
    },
    {
      "position": {
        "x": 946.6786022186279,
        "y": 557.203125
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Motion",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "9c7b669a-335a-4f45-bdc1-c133245203e6",
      "z": 577,
      "embeds": [
        "872f3e9b-338e-4294-8f4a-c17b1cb183b3"
      ],
      "parent": "8e72dbaf-cb00-49c4-b598-abddd33002df"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "872f3e9b-338e-4294-8f4a-c17b1cb183b3",
      "z": 578,
      "parent": "9c7b669a-335a-4f45-bdc1-c133245203e6",
      "vertices": [
        {
          "x": 1082,
          "y": 587.203125
        },
        {
          "x": 1038,
          "y": 644.203125
        }
      ]
    },
    {
      "position": {
        "x": -385,
        "y": 473.40625
      },
      "size": {
        "width": 911,
        "height": 273.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Light Sensing",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef",
      "z": 579,
      "embeds": [
        "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
      ],
      "parent": "d0058ac7-c3e6-432b-941c-f07d2da10c45"
    },
    {
      "position": {
        "x": -382,
        "y": 518.40625
      },
      "size": {
        "width": 905,
        "height": 225.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        }
      },
      "id": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "z": 580,
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
      "parent": "7f38e4d4-b44a-4a0e-82d0-d70da73e43ef"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "02e93a25-901b-4eeb-a4c3-9544b8b5cd57",
      "z": 581,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [
        {
          "x": 356,
          "y": 673.8125
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "65e95d8d-8907-4042-9f02-e36aab630996",
      "z": 582,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "e80c87a0-b0cd-4913-be24-fd053ea7e8f0",
      "z": 583,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "a8fd8564-45a4-4e37-a557-8d45a3439909",
      "z": 584,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "a2463d66-6041-40ac-b113-09d3cacbd7bc",
      "z": 585,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [
        {
          "x": -202,
          "y": 594.8087499999999
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "01cc6d9f-e619-4d14-98c0-3ab4c468175e",
      "z": 586,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe",
      "vertices": [
        {
          "x": -257,
          "y": 594.421875
        }
      ]
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "c70e5079-173d-4053-9ce5-6347b178a52d",
      "z": 587,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "position": {
        "x": -304,
        "y": 580.8125
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
      "id": "646a5265-1550-4be2-a539-c4048618ba85",
      "z": 588,
      "embeds": [
        "0586bf86-ec44-425f-94d8-f0fcb8d52d4c"
      ],
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -304,
        "y": 595.8125
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "0586bf86-ec44-425f-94d8-f0fcb8d52d4c",
      "z": 589,
      "parent": "646a5265-1550-4be2-a539-c4048618ba85"
    },
    {
      "position": {
        "x": -319,
        "y": 643.8125
      },
      "size": {
        "height": 60.390625,
        "width": 156
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Bright",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \nbrightness = 0"
        }
      },
      "id": "d716dbdd-08dc-43ee-9a08-e7048362c6a6",
      "z": 590,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "position": {
        "x": -78,
        "y": 535.8125
      },
      "size": {
        "height": 60,
        "width": 179
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Getting Dark",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "01c50d64-80b3-428d-8262-b5e3b243ac83",
      "z": 591,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "position": {
        "x": 37,
        "y": 643.8125
      },
      "size": {
        "height": 60.390625,
        "width": 128
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Getting Bright",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "c3581770-96cf-4eb3-a900-e105415a6c85",
      "z": 592,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "position": {
        "x": 286,
        "y": 535.8125
      },
      "size": {
        "height": 60.390625,
        "width": 162
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Dark",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / \nbrightness = 0"
        }
      },
      "id": "bbf91a39-272d-4ea3-99c6-403d6016b99a",
      "z": 593,
      "parent": "e26b0b39-dc4a-498e-be5a-b25af1dd4ffe"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "587ace39-2f09-4f1d-86ab-df0979fb13d0",
      "z": 594,
      "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "874721e0-5e49-496f-9ddd-5dd28d7757b0",
      "z": 594,
      "parent": "0f5751af-0a2b-4f28-b8ff-28fea55a00d4"
    }
  ]
}