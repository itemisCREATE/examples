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
            "text": "MyStatechart"
          },
          "specification": {
            "text": "@CycleBased(200)\n\ninterface:\n\tin event proceed\n\tin event pa\n\tin event pb"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": 54,
          "y": 107.5
        },
        "size": {
          "height": 60,
          "width": 87
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Initialize",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 53
      },
      {
        "position": {
          "x": 182,
          "y": 75.5
        },
        "size": {
          "width": 8,
          "height": 124
        },
        "type": "Synchronization",
        "fillOpacity": 1,
        "attrs": {},
        "id": "6a45d572-fcbf-4647-9728-78514fdeb844",
        "z": 55
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "6a45d572-fcbf-4647-9728-78514fdeb844"
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
        "id": "61cdbabe-d4e6-4dff-8e47-c52a460b7b5f",
        "z": 56
      },
      {
        "position": {
          "x": 227,
          "y": 277
        },
        "size": {
          "height": 314,
          "width": 273
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "State",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "0b629dc2-61a5-4709-a004-65c441e2b6af",
        "z": 68,
        "embeds": [
          "d15158ac-9ebc-4177-a3c8-1c98d466d7c4",
          "a2a57591-00a2-41b7-a006-9390899e7d31"
        ]
      },
      {
        "position": {
          "x": 228,
          "y": 315.59375
        },
        "size": {
          "height": 274.40625,
          "width": 135.5
        },
        "type": "Region",
        "attrs": {
          "name": {
            "text": "r1"
          }
        },
        "id": "d15158ac-9ebc-4177-a3c8-1c98d466d7c4",
        "z": 69,
        "parent": "0b629dc2-61a5-4709-a004-65c441e2b6af",
        "embeds": [
          "a3c7f9c4-8f40-4f6d-86b6-d87bb95113b8",
          "65a69514-d730-49ae-b854-95df62916ddb",
          "e3ff6b7b-9aed-4c9a-9eb8-3427e50089a3"
        ]
      },
      {
        "position": {
          "x": 363.5,
          "y": 315.59375
        },
        "size": {
          "height": 274.40625,
          "width": 135.5
        },
        "type": "Region",
        "attrs": {
          "name": {
            "text": "r2"
          }
        },
        "id": "a2a57591-00a2-41b7-a006-9390899e7d31",
        "z": 70,
        "parent": "0b629dc2-61a5-4709-a004-65c441e2b6af",
        "embeds": [
          "28204fe9-fc6b-4fa0-a585-cd23776de3b7",
          "f6ff5d11-be75-4c35-a874-8d10f3b8f4fe",
          "548f06c0-04a3-4595-b34e-4b79df8b5888"
        ]
      },
      {
        "position": {
          "x": 259.92860221862793,
          "y": 475.5
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Line A 2",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "65a69514-d730-49ae-b854-95df62916ddb",
        "z": 71,
        "parent": "d15158ac-9ebc-4177-a3c8-1c98d466d7c4"
      },
      {
        "position": {
          "x": 259.92860221862793,
          "y": 351.5
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Line A 1",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "e3ff6b7b-9aed-4c9a-9eb8-3427e50089a3",
        "z": 72,
        "parent": "d15158ac-9ebc-4177-a3c8-1c98d466d7c4"
      },
      {
        "position": {
          "x": 395.42860221862793,
          "y": 351.5
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Line B 1",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "f6ff5d11-be75-4c35-a874-8d10f3b8f4fe",
        "z": 73,
        "parent": "a2a57591-00a2-41b7-a006-9390899e7d31"
      },
      {
        "position": {
          "x": 395.42860221862793,
          "y": 475.5
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Line B 2",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "548f06c0-04a3-4595-b34e-4b79df8b5888",
        "z": 74,
        "parent": "a2a57591-00a2-41b7-a006-9390899e7d31"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e3ff6b7b-9aed-4c9a-9eb8-3427e50089a3"
        },
        "target": {
          "id": "65a69514-d730-49ae-b854-95df62916ddb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 36.0714111328125,
              "dy": 15.611083984375,
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
                "text": "pa"
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
        "id": "a3c7f9c4-8f40-4f6d-86b6-d87bb95113b8",
        "z": 76,
        "parent": "d15158ac-9ebc-4177-a3c8-1c98d466d7c4"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6a45d572-fcbf-4647-9728-78514fdeb844"
        },
        "target": {
          "id": "e3ff6b7b-9aed-4c9a-9eb8-3427e50089a3",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 39.0714111328125,
              "dy": 16.611114501953125,
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
        "id": "943ec695-8090-4f3e-a5fd-947d1e354f2f",
        "z": 77,
        "vertices": [
          {
            "x": 299,
            "y": 159
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6a45d572-fcbf-4647-9728-78514fdeb844"
        },
        "target": {
          "id": "f6ff5d11-be75-4c35-a874-8d10f3b8f4fe",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 39.5714111328125,
              "dy": 15.611114501953125,
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
        "id": "de0db758-1c7a-42e8-a11a-fd30be2161f1",
        "z": 78,
        "vertices": [
          {
            "x": 435,
            "y": 117
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f6ff5d11-be75-4c35-a874-8d10f3b8f4fe"
        },
        "target": {
          "id": "548f06c0-04a3-4595-b34e-4b79df8b5888",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 39.5714111328125,
              "dy": 15.611083984375,
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
                "text": "pb"
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
        "id": "28204fe9-fc6b-4fa0-a585-cd23776de3b7",
        "z": 79,
        "parent": "a2a57591-00a2-41b7-a006-9390899e7d31"
      },
      {
        "position": {
          "x": 181,
          "y": 623.5
        },
        "size": {
          "width": 8,
          "height": 124
        },
        "type": "Synchronization",
        "fillOpacity": 1,
        "attrs": {},
        "id": "988c4ff3-248f-498e-9fbe-37edb58a520b",
        "z": 80
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "65a69514-d730-49ae-b854-95df62916ddb"
        },
        "target": {
          "id": "988c4ff3-248f-498e-9fbe-37edb58a520b"
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
                "text": "always"
              }
            },
            "position": {
              "distance": 0.7848714390443944,
              "offset": 21.710205078125,
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
        "id": "8744828e-4f4b-4840-a661-4c664676bc0c",
        "z": 81,
        "vertices": [
          {
            "x": 294.75,
            "y": 646
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "548f06c0-04a3-4595-b34e-4b79df8b5888"
        },
        "target": {
          "id": "988c4ff3-248f-498e-9fbe-37edb58a520b"
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
                "text": "always"
              }
            },
            "position": {
              "distance": 0.7317438666883836,
              "offset": 14.999999999999886,
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
        "id": "7a61288d-1d19-43c5-b21b-7ad9d4a7145c",
        "z": 82,
        "vertices": [
          {
            "x": 374,
            "y": 705
          }
        ]
      },
      {
        "position": {
          "x": 53,
          "y": 655.5
        },
        "size": {
          "height": 61,
          "width": 87
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Cleanup",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "id": "656236f3-69de-44a1-b162-705c6a6fdefe",
        "z": 89
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "988c4ff3-248f-498e-9fbe-37edb58a520b"
        },
        "target": {
          "id": "656236f3-69de-44a1-b162-705c6a6fdefe",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 54.3214111328125,
              "dy": 34.611083984375,
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
        "id": "1c9708c6-6dc1-4f34-8364-500dc2c87875",
        "z": 90
      },
      {
        "position": {
          "x": -28,
          "y": 130
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
        "z": 91,
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
          "x": -28,
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
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 92,
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
              "dx": 6,
              "dy": 29.5,
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
        "id": "e84f8f3c-8941-45b3-b3c5-3c9eb247cbd8",
        "z": 93
      },
      {
        "position": {
          "x": -29,
          "y": 678
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "type": "Final",
        "attrs": {},
        "id": "757ea982-0e26-4c7e-b4c7-57045901f1d9",
        "z": 94
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "656236f3-69de-44a1-b162-705c6a6fdefe"
        },
        "target": {
          "id": "757ea982-0e26-4c7e-b4c7-57045901f1d9"
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
        "id": "59466836-9916-4a51-b202-29e3f0de32d4",
        "z": 95
      }
    ]
  }
}