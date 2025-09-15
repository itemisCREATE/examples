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
        "type": "Statechart",
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "attrs": {
          "name": {
            "text": "LightSwitch"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface user:\n\tin event on_button\n\tin event off_button\n\t\ninterface light:\n\tvar brightness: integer\n\tout event on\n\tout event off"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 132,
          "y": 234
        },
        "size": {
          "height": 72,
          "width": 331
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Off",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry / \nlight.brightness = 0;\nraise light.off"
          }
        },
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 4
      },
      {
        "position": {
          "x": 264.5,
          "y": 167
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
        "z": 10,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
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
          "x": 264.5,
          "y": 182
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
        "z": 11,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
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
        "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "z": 12
      },
      {
        "position": {
          "x": 125,
          "y": 427
        },
        "size": {
          "height": 105,
          "width": 331
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "On",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry / \nraise light.on\n\nuser.on_button [light.brightness < 10] / \nlight.brightness += 1"
          }
        },
        "id": "db372094-acc6-467b-b44d-495606208445",
        "z": 22
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 125,
              "dy": 8.111114501953125,
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
                "text": "user.on_button / \nlight.brightness = 1"
              }
            },
            "position": {
              "distance": 0.46,
              "offset": 83.00000000000003,
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
        "id": "e9bb0bd8-bf23-43bd-b9c6-533343c47258",
        "z": 23
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 214,
              "dy": 68,
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
                "text": "user.off_button,\nafter 30 s"
              }
            },
            "position": {
              "distance": 0.516,
              "offset": 69,
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
        "id": "6a32811d-b2a7-461d-9c9f-2f3f9bbbc74f",
        "z": 23,
        "vertices": []
      }
    ]
  }
}