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
            "text": "@EventDriven\n// Runs a run-to-completion step\n// each time an event is raised.\n\ninterface:\n\n  in event input"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 139,
          "y": 153
        },
        "size": {
          "height": 435,
          "width": 454
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "z": 91,
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
          "2ca3462c-2c84-4378-ada3-e5b1b31c40fb"
        ],
        "attrs": {
          "name": {
            "text": "main region"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 160.35720443725586,
          "y": 223
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 92,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "name": {
            "text": "StateA",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 349.43163871765137,
          "y": 382
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "39872f6a-0676-4364-b0bb-30a307edc59b",
        "z": 93,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "name": {
            "text": "StateC",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 349.43163871765137,
          "y": 223
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "db372094-acc6-467b-b44d-495606208445",
        "z": 94,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "name": {
            "text": "StateB",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 277.7888431549072,
          "y": 480
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "4064ebbe-5dad-4272-9c67-6601360e8479",
        "z": 95,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "name": {
            "text": "StateD",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 421.0744342803955,
          "y": 480
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "3d115638-c1d1-4bf8-9c57-f037b66d703c",
        "z": 96,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "name": {
            "text": "StateE",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 188.67860221862793,
          "y": 178
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
        "z": 97,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": 160.35720443725586,
          "y": 307
        },
        "size": {
          "width": 183.25303649902344,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "2ca3462c-2c84-4378-ada3-e5b1b31c40fb",
        "z": 103,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {
          "label": {
            "text": "In event driven mode, \nevents directly trigger \nstatechart processing.",
            "annotations": [
              {
                "start": 0,
                "end": 70,
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
          "x": 188.67860221862793,
          "y": 193
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 104,
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
        "id": "bb99b7a7-c3d4-4631-b4b0-93d6eb7e35a9",
        "z": 105,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {}
      },
      {
        "type": "Transition",
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
        "id": "74ea675d-0170-450e-a8ad-bdf5cc9107a2",
        "z": 105,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {}
      },
      {
        "type": "Transition",
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
        "id": "131ffbc1-e415-4ddb-aff1-b42c17fd2877",
        "z": 105,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
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
              "dx": 37.28558349609375,
              "dy": 3,
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
        "id": "ad0307d5-75e1-485d-97fa-cbae48bf73c1",
        "z": 105,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
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
        "id": "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
        "z": 105,
        "parent": "5b9a71fa-41d7-4eba-ba2f-8058733fa23e",
        "attrs": {}
      }
    ]
  }
}