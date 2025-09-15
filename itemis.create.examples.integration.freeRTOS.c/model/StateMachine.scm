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
            "text": "StateMachine"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\nin event inEvent1\nin event inEvent2\n\nout event outEvent1\nout event outEvent2\n"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 108,
          "y": 303
        },
        "size": {
          "height": 258,
          "width": 505
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
        "id": "de3daeaa-361b-42fb-95e9-b5eede80ef1d",
        "z": 55,
        "embeds": [
          "7197094a-c890-4098-9170-1701f27ac3cb",
          "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
          "f141a0ef-2107-43c9-afb7-33c792eaf165",
          "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
          "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
          "36b8548a-74b1-4925-ae23-291c03231ee6",
          "db372094-acc6-467b-b44d-495606208445",
          "ee49942f-ccc9-4d2c-9e3b-67d7d2d2f11f"
        ]
      },
      {
        "position": {
          "x": 177,
          "y": 348
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Entry",
        "entryKind": "Entry",
        "attrs": {},
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 56,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      },
      {
        "position": {
          "x": 150,
          "y": 398
        },
        "size": {
          "height": 60.390625,
          "width": 143.2790756225586
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "StateA",
            "fontSize": 12
          },
          "specification": {
            "text": "entry /\nraise outEvent1"
          }
        },
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 57,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      },
      {
        "position": {
          "x": 430,
          "y": 398
        },
        "size": {
          "height": 60.390625,
          "width": 143.2790756225586
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "StateB",
            "fontSize": 12
          },
          "specification": {
            "text": "entry /\nraise outEvent2"
          }
        },
        "id": "db372094-acc6-467b-b44d-495606208445",
        "z": 58,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      },
      {
        "position": {
          "x": 215,
          "y": 503
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Final",
        "attrs": {},
        "id": "ee49942f-ccc9-4d2c-9e3b-67d7d2d2f11f",
        "z": 59,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": 177,
          "y": 363
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
        "z": 64,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 49,
              "rotate": true
            }
          },
          "priority": true
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
            "attrs": {
              "text": {
                "text": "after 2 s"
              }
            },
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
        "id": "7197094a-c890-4098-9170-1701f27ac3cb",
        "z": 65,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "ee49942f-ccc9-4d2c-9e3b-67d7d2d2f11f"
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
                "text": "inEvent2"
              }
            },
            "position": {
              "distance": 0.4551671670974839,
              "offset": 48,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "f141a0ef-2107-43c9-afb7-33c792eaf165",
        "z": 65,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 139,
              "dy": 11,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445"
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
                "text": "inEvent1"
              }
            },
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
        "id": "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
        "z": 65,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d",
        "vertices": []
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
        "z": 65,
        "parent": "de3daeaa-361b-42fb-95e9-b5eede80ef1d"
      }
    ]
  }
}