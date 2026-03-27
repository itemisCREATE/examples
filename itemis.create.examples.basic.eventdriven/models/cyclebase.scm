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
          "text": "@CycleBased(2000)\n// Runs a run-to-completion step\n// every 2 seconds. Change\n// the period time and observe the \n// effect when running the simulation.\n\ninterface:\n\n  in event input"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": -29,
        "y": 127
      },
      "size": {
        "width": 770,
        "height": 496
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "main region"
        }
      },
      "id": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
      "z": 220,
      "embeds": [
        "ad0307d5-75e1-485d-97fa-cbae48bf73c1",
        "74ea675d-0170-450e-a8ad-bdf5cc9107a2",
        "131ffbc1-e415-4ddb-aff1-b42c17fd2877",
        "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
        "bb99b7a7-c3d4-4631-b4b0-93d6eb7e35a9",
        "36b8548a-74b1-4925-ae23-291c03231ee6",
        "39872f6a-0676-4364-b0bb-30a307edc59b",
        "db372094-acc6-467b-b44d-495606208445",
        "4064ebbe-5dad-4272-9c67-6601360e8479",
        "3d115638-c1d1-4bf8-9c57-f037b66d703c",
        "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "2ca3462c-2c84-4378-ada3-e5b1b31c40fb",
        "2aafda74-29f1-497d-b878-515024c84571"
      ]
    },
    {
      "position": {
        "x": -7.642795562744141,
        "y": 197
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StateA",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 221,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "position": {
        "x": 181.43163871765137,
        "y": 356
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StateC",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "39872f6a-0676-4364-b0bb-30a307edc59b",
      "z": 222,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "position": {
        "x": 181.43163871765137,
        "y": 197
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StateB",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "db372094-acc6-467b-b44d-495606208445",
      "z": 223,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "position": {
        "x": 109.78884315490723,
        "y": 454
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StateD",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "4064ebbe-5dad-4272-9c67-6601360e8479",
      "z": 224,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "position": {
        "x": 253.0744342803955,
        "y": 454
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "StateE",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "3d115638-c1d1-4bf8-9c57-f037b66d703c",
      "z": 225,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "position": {
        "x": 20.67860221862793,
        "y": 152
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
      "z": 226,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "type": "Note",
      "attrs": {
        "root": {
          "display": ""
        },
        "body": {
          "filter": {
            "args": {}
          }
        },
        "label": {
          "text": "In cycle based mode, \nevents are only processed \nwhen a cycle is triggered, \nhere every 2 seconds.",
          "annotations": [
            {
              "start": 0,
              "end": 98,
              "attrs": {
                "fill": "#333333",
                "font-size": 12,
                "font-weight": "normal",
                "text-decoration": "none",
                "font-style": "normal",
                "font-family": "'Roboto Mono', monospace"
              }
            }
          ]
        }
      },
      "position": {
        "x": -7.642795562744141,
        "y": 268
      },
      "size": {
        "width": 201,
        "height": 75
      },
      "angle": 0,
      "linkable": false,
      "id": "2ca3462c-2c84-4378-ada3-e5b1b31c40fb",
      "z": 227,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "type": "Note",
      "attrs": {
        "root": {
          "display": ""
        },
        "body": {
          "filter": {
            "args": {}
          }
        },
        "label": {
          "text": "Since after 2 seconds, both time events\nare raised, the transition with the higher\npriority is taken, here StateC -> StateE.\nYou can fix this by changing the cycle\nperiod from 2000 to 200 in the definition\nsection.",
          "annotations": [
            {
              "start": 0,
              "end": 214,
              "attrs": {
                "fill": "#333333",
                "font-size": 12,
                "font-weight": "normal",
                "text-decoration": "none",
                "font-style": "normal",
                "font-family": "'Roboto Mono', monospace"
              }
            }
          ]
        }
      },
      "position": {
        "x": 362.71722984313965,
        "y": 454
      },
      "size": {
        "width": 313,
        "height": 99
      },
      "angle": 0,
      "linkable": false,
      "id": "2aafda74-29f1-497d-b878-515024c84571",
      "z": 228,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 20.67860221862793,
        "y": 167
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
      "z": 234,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "db372094-acc6-467b-b44d-495606208445"
      },
      "target": {
        "id": "39872f6a-0676-4364-b0bb-30a307edc59b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 38.642822265625,
            "dy": 9,
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
      "id": "bb99b7a7-c3d4-4631-b4b0-93d6eb7e35a9",
      "z": 235,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "39872f6a-0676-4364-b0bb-30a307edc59b"
      },
      "target": {
        "id": "3d115638-c1d1-4bf8-9c57-f037b66d703c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 37,
            "dy": 14,
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
            "distance": 0.5847434689012164,
            "offset": -57.394165039062386,
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
      "id": "74ea675d-0170-450e-a8ad-bdf5cc9107a2",
      "z": 235,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "39872f6a-0676-4364-b0bb-30a307edc59b"
      },
      "target": {
        "id": "4064ebbe-5dad-4272-9c67-6601360e8479",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 29,
            "dy": 1,
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
              "text": "after 200 ms"
            }
          },
          "position": {
            "distance": 0.5528050010525549,
            "offset": 59.801241268601395,
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
      "id": "131ffbc1-e415-4ddb-aff1-b42c17fd2877",
      "z": 235,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
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
            "dx": 37.28558349609375,
            "dy": 3,
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
      "id": "ad0307d5-75e1-485d-97fa-cbae48bf73c1",
      "z": 235,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "db372094-acc6-467b-b44d-495606208445"
      },
      "connector": {
        "name": "rounded"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "input"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
      "z": 235,
      "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e"
    }
  ]
}