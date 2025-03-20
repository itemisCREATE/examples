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
            "text": "_02_DimmableLightSwitch"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tvar brightness: integer"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 40,
          "y": 204
        },
        "size": {
          "height": 353,
          "width": 589
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_QwgAQJQ6EeWuO-fDDpYHyA",
          "74f403f7-b611-4010-91b4-a299c2e10f90",
          "_3AT-w5OAEeWuO-fDDpYHyA",
          "_3ASJk5OAEeWuO-fDDpYHyA",
          "_Muq1cJQtEeWuO-fDDpYHyA",
          "_3ASwp5OAEeWuO-fDDpYHyA"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 21,
        "attrs": {
          "name": {
            "text": "main"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 172,
          "y": 233
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
        "z": 22,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 245.5,
          "y": 394
        },
        "size": {
          "height": 60,
          "width": 181
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_qexnsJxjEeuu4YMPqKybnQ",
          "_CdIbYDeYEeaQIqD3TyMHVw"
        ],
        "id": "_Muq1cJQtEeWuO-fDDpYHyA",
        "z": 23,
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
        "type": "State",
        "position": {
          "x": 240,
          "y": 222
        },
        "size": {
          "height": 60,
          "width": 193.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_3ASwp5OAEeWuO-fDDpYHyA",
        "z": 24,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "Off",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry / brightness = 0"
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
        "z": 25,
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
              "dx": 49.5,
              "dy": 7,
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
                "text": "switch / \n  brightness = 10"
              }
            },
            "position": {
              "distance": 0.39285714285714285,
              "offset": 71,
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
        "id": "74f403f7-b611-4010-91b4-a299c2e10f90",
        "z": 26,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "vertices": [],
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
              "dx": 145,
              "dy": 53,
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
                "text": "switch "
              }
            },
            "position": {
              "distance": 0.5640467235020229,
              "offset": 36,
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
        "vertices": [],
        "id": "_QwgAQJQ6EeWuO-fDDpYHyA",
        "z": 27,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_Muq1cJQtEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_Muq1cJQtEeWuO-fDDpYHyA"
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
                "text": "changeBrightness \n    [brightness > 1] / \n    brightness -= 1\n    "
              }
            },
            "position": {
              "distance": 0.15603099586435595,
              "offset": -77.68298823517064,
              "x": 0,
              "y": 0,
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
        "vertices": [
          {
            "x": 450.5,
            "y": 431
          },
          {
            "x": 371,
            "y": 492
          }
        ],
        "id": "_CdIbYDeYEeaQIqD3TyMHVw",
        "z": 28,
        "parent": "_Muq1cJQtEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_Muq1cJQtEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_Muq1cJQtEeWuO-fDDpYHyA",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 47.5,
              "dy": 53,
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
                "text": "changeBrightness \n    [brightness <= 1] / \n    brightness = 10\n    "
              }
            },
            "position": {
              "distance": 0.15786520641500373,
              "offset": 74.09180833468665,
              "x": 0,
              "y": 0,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
            "x": 220.5,
            "y": 432
          },
          {
            "x": 293,
            "y": 489
          }
        ],
        "id": "_qexnsJxjEeuu4YMPqKybnQ",
        "z": 29,
        "parent": "_Muq1cJQtEeWuO-fDDpYHyA",
        "attrs": {}
      }
    ]
  }
}