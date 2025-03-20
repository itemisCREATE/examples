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
        "id": "_3AQUYJOAEeWuO-fDDpYHyA",
        "linkable": true,
        "fixedRatio": false,
        "embedable": true,
        "z": 0,
        "attrs": {
          "name": {
            "text": "_01_LightSwitch"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\n\tin event switch"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 154,
          "y": 268
        },
        "size": {
          "height": 200,
          "width": 241
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "5fcd9884-4765-4b87-bb28-8bcd97546e56",
          "_QwgAQJQ6EeWuO-fDDpYHyA",
          "_3AT-w5OAEeWuO-fDDpYHyA",
          "_3ASwp5OAEeWuO-fDDpYHyA",
          "_Muq1cJQtEeWuO-fDDpYHyA",
          "_3ASJk5OAEeWuO-fDDpYHyA"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 29,
        "attrs": {
          "name": {
            "text": "main"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 246,
          "y": 276
        },
        "size": {
          "height": 53,
          "width": 40
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_3ASwp5OAEeWuO-fDDpYHyA",
        "z": 30,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "Off",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 251.5,
          "y": 399
        },
        "size": {
          "height": 53,
          "width": 40
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_Muq1cJQtEeWuO-fDDpYHyA",
        "z": 31,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "On",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 204,
          "y": 278
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
        "id": "_3ASJk5OAEeWuO-fDDpYHyA",
        "z": 32,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_3ASJk5OAEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_3ASwp5OAEeWuO-fDDpYHyA"
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
            "position": {
              "x": 0,
              "y": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": 1
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
        "vertices": [],
        "id": "_3AT-w5OAEeWuO-fDDpYHyA",
        "z": 33,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_Muq1cJQtEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_3ASwp5OAEeWuO-fDDpYHyA",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 29,
              "dy": 30,
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
                "text": "switch"
              }
            },
            "position": {
              "distance": 0.5059468032751314,
              "offset": 33,
              "x": 0,
              "y": 0,
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
        "vertices": [
          {
            "x": 322,
            "y": 439
          },
          {
            "x": 322,
            "y": 306
          }
        ],
        "id": "_QwgAQJQ6EeWuO-fDDpYHyA",
        "z": 34,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_3ASwp5OAEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_Muq1cJQtEeWuO-fDDpYHyA",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4.5,
              "dy": 36.111114501953125,
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
                "text": "switch"
              }
            },
            "position": {
              "distance": 0.4377999267925989,
              "offset": 27,
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
        "id": "5fcd9884-4765-4b87-bb28-8bcd97546e56",
        "z": 35,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "vertices": [
          {
            "x": 216,
            "y": 309
          },
          {
            "x": 216,
            "y": 435.11
          }
        ],
        "attrs": {}
      }
    ]
  }
}