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
          "text": "@ChildFirstExecution\n@CycleBased(200)\n\ninterface:\n  in event e\n  var m : integer = 0\n  var n : integer = 0\n  var o : integer = 0"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": 318,
        "y": 139
      },
      "size": {
        "width": 460,
        "height": 431
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
      "id": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
      "z": 258,
      "embeds": [
        "ea25afb3-7678-4b64-a82c-302030fe768d",
        "744b39a1-5d65-44d3-9649-cd7f09c40a39",
        "7f0f1b2b-a8ea-4ce9-8784-9424bce95af2",
        "36b8548a-74b1-4925-ae23-291c03231ee6",
        "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      ]
    },
    {
      "position": {
        "x": 675,
        "y": 226
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "D",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "7f0f1b2b-a8ea-4ce9-8784-9424bce95af2",
      "z": 273,
      "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f"
    },
    {
      "position": {
        "x": 357,
        "y": 223
      },
      "size": {
        "width": 270,
        "height": 320.81250381469727
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StateA",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / m = 1\ne / n = 1\nexit / o = 1"
        }
      },
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 275,
      "embeds": [
        "2859c90b-a5f0-43af-90e1-18a999424c89"
      ],
      "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f"
    },
    {
      "position": {
        "x": 360,
        "y": 296
      },
      "size": {
        "width": 264,
        "height": 244.81250381469727
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "r1"
        }
      },
      "id": "2859c90b-a5f0-43af-90e1-18a999424c89",
      "z": 276,
      "embeds": [
        "fee0d5f7-4991-4920-aa2b-3f209cb41b13",
        "bdf38cea-4296-4f2e-b40b-4002aab408cc",
        "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13",
        "b6ffc8ba-4767-4bc0-a495-b0ff612ceb20",
        "0d203e6e-9fe9-41d9-a258-bca25f1027ae"
      ],
      "parent": "36b8548a-74b1-4925-ae23-291c03231ee6"
    },
    {
      "position": {
        "x": 373,
        "y": 359
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
      "id": "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13",
      "z": 279,
      "embeds": [
        "5d0afb3c-4575-483b-a697-4ee226a8e76d"
      ],
      "parent": "2859c90b-a5f0-43af-90e1-18a999424c89"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 373,
        "y": 374
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "5d0afb3c-4575-483b-a697-4ee226a8e76d",
      "z": 282,
      "parent": "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "7f0f1b2b-a8ea-4ce9-8784-9424bce95af2",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 5,
            "dy": 33.611083984375,
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
              "text": "e"
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
      "id": "744b39a1-5d65-44d3-9649-cd7f09c40a39",
      "z": 283,
      "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f"
    },
    {
      "position": {
        "x": 380,
        "y": 183
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
      "z": 284,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 380,
        "y": 198
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
      "z": 285,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
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
            "dx": 30,
            "dy": 7.111114501953125,
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
      "id": "ea25afb3-7678-4b64-a82c-302030fe768d",
      "z": 286,
      "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f"
    },
    {
      "position": {
        "x": 422,
        "y": 332
      },
      "size": {
        "height": 80,
        "width": 133
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "B",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / m = 2\ne / n = 2\nexit / o = 2"
        }
      },
      "id": "b6ffc8ba-4767-4bc0-a495-b0ff612ceb20",
      "z": 287,
      "parent": "2859c90b-a5f0-43af-90e1-18a999424c89"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13"
      },
      "target": {
        "id": "b6ffc8ba-4767-4bc0-a495-b0ff612ceb20",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 5,
            "dy": 36.611083984375,
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
      "id": "bdf38cea-4296-4f2e-b40b-4002aab408cc",
      "z": 288,
      "parent": "2859c90b-a5f0-43af-90e1-18a999424c89"
    },
    {
      "position": {
        "x": 421,
        "y": 456
      },
      "size": {
        "height": 60,
        "width": 133
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "C",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "0d203e6e-9fe9-41d9-a258-bca25f1027ae",
      "z": 289,
      "parent": "2859c90b-a5f0-43af-90e1-18a999424c89"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "b6ffc8ba-4767-4bc0-a495-b0ff612ceb20"
      },
      "target": {
        "id": "0d203e6e-9fe9-41d9-a258-bca25f1027ae",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 69,
            "dy": 13.111083984375,
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
              "text": "e"
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
      "id": "fee0d5f7-4991-4920-aa2b-3f209cb41b13",
      "z": 290,
      "parent": "2859c90b-a5f0-43af-90e1-18a999424c89"
    }
  ]
}