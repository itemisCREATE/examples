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
            "text": "@ChildFirstExecution\n@CycleBased(200)\n\ninterface:\n  in event e\n  var m : integer = 0\n  var n : integer = 0\n  var o : integer = 0"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 146,
          "y": 204
        },
        "size": {
          "height": 431,
          "width": 460
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
        "z": 117,
        "embeds": [
          "ea25afb3-7678-4b64-a82c-302030fe768d",
          "744b39a1-5d65-44d3-9649-cd7f09c40a39",
          "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
          "7f0f1b2b-a8ea-4ce9-8784-9424bce95af2",
          "36b8548a-74b1-4925-ae23-291c03231ee6"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "main region"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 206,
          "y": 244
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
        "z": 119,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 502,
          "y": 297.5
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "7f0f1b2b-a8ea-4ce9-8784-9424bce95af2",
        "z": 120,
        "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
        "attrs": {
          "name": {
            "text": "D",
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
          "x": 206,
          "y": 259
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 124,
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
          "x": 183,
          "y": 298
        },
        "size": {
          "height": 318,
          "width": 266
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 132,
        "embeds": [
          "2859c90b-a5f0-43af-90e1-18a999424c89"
        ],
        "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
        "attrs": {
          "name": {
            "text": "StateA",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry / m = 1\ne / n = 1\nexit / o = 1"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 184,
          "y": 370.18749618530273
        },
        "size": {
          "height": 244.81250381469727,
          "width": 264
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2859c90b-a5f0-43af-90e1-18a999424c89",
        "z": 133,
        "embeds": [
          "fee0d5f7-4991-4920-aa2b-3f209cb41b13",
          "bdf38cea-4296-4f2e-b40b-4002aab408cc",
          "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13",
          "b6ffc8ba-4767-4bc0-a495-b0ff612ceb20",
          "0d203e6e-9fe9-41d9-a258-bca25f1027ae"
        ],
        "parent": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "attrs": {
          "name": {
            "text": "r1"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 204,
          "y": 432.5
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
        "id": "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13",
        "z": 134,
        "embeds": [
          "5d0afb3c-4575-483b-a697-4ee226a8e76d"
        ],
        "parent": "2859c90b-a5f0-43af-90e1-18a999424c89",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 246,
          "y": 407
        },
        "size": {
          "height": 80,
          "width": 133
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "b6ffc8ba-4767-4bc0-a495-b0ff612ceb20",
        "z": 135,
        "parent": "2859c90b-a5f0-43af-90e1-18a999424c89",
        "attrs": {
          "name": {
            "text": "B",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry / m = 2\ne / n = 2\nexit / o = 2"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 246,
          "y": 529.5
        },
        "size": {
          "height": 60,
          "width": 133
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "0d203e6e-9fe9-41d9-a258-bca25f1027ae",
        "z": 136,
        "parent": "2859c90b-a5f0-43af-90e1-18a999424c89",
        "attrs": {
          "name": {
            "text": "C",
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
          "x": 204,
          "y": 447.5
        },
        "id": "5d0afb3c-4575-483b-a697-4ee226a8e76d",
        "z": 139,
        "parent": "bf0a54e1-3b5f-4ea6-84d1-b67fb87eea13",
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
        "id": "fee0d5f7-4991-4920-aa2b-3f209cb41b13",
        "z": 140,
        "parent": "2859c90b-a5f0-43af-90e1-18a999424c89",
        "attrs": {}
      },
      {
        "type": "Transition",
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
        "id": "bdf38cea-4296-4f2e-b40b-4002aab408cc",
        "z": 140,
        "parent": "2859c90b-a5f0-43af-90e1-18a999424c89",
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
              "dx": 30,
              "dy": 7.111114501953125,
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
        "id": "ea25afb3-7678-4b64-a82c-302030fe768d",
        "z": 140,
        "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
        "attrs": {}
      },
      {
        "type": "Transition",
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
        "id": "744b39a1-5d65-44d3-9649-cd7f09c40a39",
        "z": 140,
        "parent": "c7bde6c5-d73d-4704-b4b1-de5028e8c65f",
        "attrs": {}
      }
    ]
  }
}