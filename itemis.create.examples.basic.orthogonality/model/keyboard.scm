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
            "text": "@CycleBased(200)\n\ninterface:\n\tin event pressCapsLock\n\tin event pressNumLock\n"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 25,
          "y": 203
        },
        "size": {
          "height": 326,
          "width": 300
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
        "z": 23,
        "embeds": [
          "7197094a-c890-4098-9170-1701f27ac3cb",
          "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
          "509d725c-36fc-4bc5-b312-2577af79bf96",
          "db372094-acc6-467b-b44d-495606208445",
          "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
          "36b8548a-74b1-4925-ae23-291c03231ee6"
        ],
        "attrs": {
          "name": {
            "text": "CapsLock"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 129,
          "y": 413
        },
        "size": {
          "height": 61,
          "width": 103
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "db372094-acc6-467b-b44d-495606208445",
        "z": 24,
        "parent": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
        "attrs": {
          "name": {
            "text": "CapsLock_ON",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 49.5,
          "y": 272.5
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
        "z": 26,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "parent": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
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
          "x": 49.5,
          "y": 287.5
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 30,
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
        "type": "State",
        "position": {
          "x": 123.5,
          "y": 250
        },
        "size": {
          "height": 60,
          "width": 103
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 36,
        "parent": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
        "attrs": {
          "name": {
            "text": "CapsLock_OFF",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 25,
              "dy": 54,
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
                "text": "pressCapsLock"
              }
            },
            "position": {
              "distance": 0.529126213592233,
              "offset": -65,
              "angle": 0
            }
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
        "z": 37,
        "parent": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
        "attrs": {}
      },
      {
        "type": "Transition",
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
        "z": 37,
        "parent": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 69,
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
                "text": "pressCapsLock"
              }
            },
            "position": {
              "distance": 0.49029126213592233,
              "offset": -60,
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
        "id": "509d725c-36fc-4bc5-b312-2577af79bf96",
        "z": 37,
        "parent": "8a2ff97b-f1f5-4d8a-92f5-4b20681d9035",
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 349,
          "y": 203
        },
        "size": {
          "height": 326,
          "width": 300
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "z": 47,
        "embeds": [
          "00daecbe-dd91-4870-bb6e-40c38cf136e1",
          "dc8cd437-7fff-49f6-8b89-969c0796049f",
          "71893068-ae4c-4842-b8ce-876f6208395d",
          "d6d1ea2b-09b2-41cd-ad59-16e0efbe477a",
          "0e0578ad-ed20-404e-8933-901a5548c9b9",
          "6cc6cca0-3d7f-4d70-b67b-ef5f124fe579"
        ],
        "attrs": {
          "name": {
            "text": "NumLock"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 447.5,
          "y": 413.5
        },
        "size": {
          "height": 60,
          "width": 103
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "d6d1ea2b-09b2-41cd-ad59-16e0efbe477a",
        "z": 48,
        "parent": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "attrs": {
          "name": {
            "text": "NumLock_ON",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 447.5,
          "y": 227.5
        },
        "size": {
          "height": 60,
          "width": 103
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "0e0578ad-ed20-404e-8933-901a5548c9b9",
        "z": 49,
        "parent": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "attrs": {
          "name": {
            "text": "NumLock_OFF",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 385,
          "y": 250
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Entry",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "6cc6cca0-3d7f-4d70-b67b-ef5f124fe579",
        "z": 52,
        "parent": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "0e0578ad-ed20-404e-8933-901a5548c9b9"
        },
        "target": {
          "id": "d6d1ea2b-09b2-41cd-ad59-16e0efbe477a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 79.5,
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
            "attrs": {
              "text": {
                "text": "pressNumLock"
              }
            },
            "position": {
              "distance": 0.5158730158730159,
              "offset": -51,
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
        "id": "dc8cd437-7fff-49f6-8b89-969c0796049f",
        "z": 53,
        "parent": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "d6d1ea2b-09b2-41cd-ad59-16e0efbe477a"
        },
        "target": {
          "id": "0e0578ad-ed20-404e-8933-901a5548c9b9",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 24.5,
              "dy": 56.611114501953125,
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
                "text": "pressNumLock"
              }
            },
            "position": {
              "distance": 0.5079365079365079,
              "offset": -55,
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
        "id": "71893068-ae4c-4842-b8ce-876f6208395d",
        "z": 53,
        "parent": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "6cc6cca0-3d7f-4d70-b67b-ef5f124fe579"
        },
        "target": {
          "id": "0e0578ad-ed20-404e-8933-901a5548c9b9",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 10.5,
              "dy": 28.5,
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
        "id": "00daecbe-dd91-4870-bb6e-40c38cf136e1",
        "z": 53,
        "parent": "9f7956c1-e71d-4b94-a26f-3476ef523b8c",
        "attrs": {}
      }
    ]
  }
}