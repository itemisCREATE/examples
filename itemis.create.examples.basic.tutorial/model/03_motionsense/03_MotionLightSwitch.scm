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
        "id": "_3AQUYJOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "_03_MotionLightSwitch"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tin event toggleMode\n\tin event motionDetected\n\t\n\tvar brightness: integer"
          }
        },
        "z": 0
      },
      {
        "position": {
          "x": -154,
          "y": 151
        },
        "size": {
          "height": 412,
          "width": 1210
        },
        "type": "Region",
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "main"
          }
        },
        "embeds": [
          "_ZolX4DekEeaQIqD3TyMHVw",
          "_XkcV4DekEeaQIqD3TyMHVw",
          "_3ASJk5OAEeWuO-fDDpYHyA",
          "_btDkAOLQEeqIEJujGIwh5g",
          "_DKe-sDeaEeaQIqD3TyMHVw",
          "_HslsYDekEeaQIqD3TyMHVw"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 195
      },
      {
        "position": {
          "x": 60,
          "y": 199
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
        "id": "_3ASJk5OAEeWuO-fDDpYHyA",
        "z": 196,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": -141,
          "y": 248
        },
        "size": {
          "height": 285,
          "width": 511
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "MotionSensing",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "embeds": [
          "_DKgz4DeaEeaQIqD3TyMHVw"
        ],
        "id": "_DKe-sDeaEeaQIqD3TyMHVw",
        "z": 197,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": -140,
          "y": 286.6000061035156
        },
        "size": {
          "height": 245.39999389648438,
          "width": 509
        },
        "type": "Region",
        "attrs": {
          "name": {
            "text": "r1"
          }
        },
        "embeds": [
          "_gISx0DeaEeaQIqD3TyMHVw",
          "_gm-R4DeaEeaQIqD3TyMHVw",
          "_YfxhQDeaEeaQIqD3TyMHVw",
          "_YJ4w0DeaEeaQIqD3TyMHVw",
          "_Oh-bYDeaEeaQIqD3TyMHVw",
          "_eMfMcDeaEeaQIqD3TyMHVw"
        ],
        "id": "_DKgz4DeaEeaQIqD3TyMHVw",
        "z": 202,
        "parent": "_DKe-sDeaEeaQIqD3TyMHVw"
      },
      {
        "position": {
          "x": -74,
          "y": 422.20001220703125
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
        "id": "_YJ4w0DeaEeaQIqD3TyMHVw",
        "z": 204,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
      },
      {
        "position": {
          "x": -111,
          "y": 343.20001220703125
        },
        "size": {
          "height": 62,
          "width": 135.8000030517578
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Off",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry / \r\nbrightness = 0"
          }
        },
        "embeds": [],
        "id": "_Oh-bYDeaEeaQIqD3TyMHVw",
        "z": 205,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
      },
      {
        "position": {
          "x": 171,
          "y": 346.20001220703125
        },
        "size": {
          "height": 62,
          "width": 135.8000030517578
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "On",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry /\nbrightness = 1"
          }
        },
        "embeds": [
          "_FFds0EgxEeaqQLPHnkgH_g"
        ],
        "id": "_eMfMcDeaEeaQIqD3TyMHVw",
        "z": 206,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_Oh-bYDeaEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 133,
              "dy": 52,
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
                "text": "after 30s"
              }
            },
            "position": {
              "distance": 0.5439883592890854,
              "offset": -23,
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
        "id": "_gm-R4DeaEeaQIqD3TyMHVw",
        "z": 213,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_Oh-bYDeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7,
              "dy": 16.60504150390625,
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
                "text": "motionDetected"
              }
            },
            "position": {
              "distance": 0.5420223710964218,
              "offset": -18.000014648437514,
              "x": 0,
              "y": 0,
              "angle": 0
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
        "id": "_gISx0DeaEeaQIqD3TyMHVw",
        "z": 213,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_YJ4w0DeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_Oh-bYDeaEeaQIqD3TyMHVw"
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
        "id": "_YfxhQDeaEeaQIqD3TyMHVw",
        "z": 213,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_3ASJk5OAEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_DKe-sDeaEeaQIqD3TyMHVw"
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
        "id": "_btDkAOLQEeqIEJujGIwh5g",
        "z": 213,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw"
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
                "text": "motionDetected"
              }
            },
            "position": {
              "distance": 0.32345676849729105,
              "offset": -18,
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
            "x": 256,
            "y": 329
          },
          {
            "x": 339,
            "y": 370
          }
        ],
        "id": "_FFds0EgxEeaqQLPHnkgH_g",
        "z": 216,
        "parent": "_eMfMcDeaEeaQIqD3TyMHVw"
      },
      {
        "position": {
          "x": 445,
          "y": 250
        },
        "size": {
          "height": 285,
          "width": 593
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Manual",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        },
        "embeds": [
          "_dAsT8JxNEeuu4YMPqKybnQ"
        ],
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "z": 217,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": 446,
          "y": 287.59375
        },
        "size": {
          "height": 245.40625,
          "width": 591
        },
        "type": "Region",
        "attrs": {
          "name": {
            "text": "r1"
          }
        },
        "embeds": [
          "_dAsT_ZxNEeuu4YMPqKybnQ",
          "_dAs7AZxNEeuu4YMPqKybnQ",
          "_dAsT8pxNEeuu4YMPqKybnQ",
          "_dAsT8ZxNEeuu4YMPqKybnQ",
          "_dAsT85xNEeuu4YMPqKybnQ",
          "_dAsUBpxNEeuu4YMPqKybnQ"
        ],
        "id": "_dAsT8JxNEeuu4YMPqKybnQ",
        "z": 218,
        "parent": "_HslsYDekEeaQIqD3TyMHVw"
      },
      {
        "position": {
          "x": 520,
          "y": 322.9937438964844
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
        "id": "_dAsT8ZxNEeuu4YMPqKybnQ",
        "z": 219,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
      },
      {
        "position": {
          "x": 464,
          "y": 382.9937438964844
        },
        "size": {
          "height": 68,
          "width": 171.8000030517578
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "Off",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "entry \n  / brightness = 0"
          }
        },
        "embeds": [],
        "id": "_dAsT85xNEeuu4YMPqKybnQ",
        "z": 220,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
      },
      {
        "position": {
          "x": 726.6000061035156,
          "y": 343.7937469482422
        },
        "size": {
          "height": 135,
          "width": 301.3999938964844
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "On",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "specification": {
            "text": "changeBrightness \n  [brightness > 1] / brightness -= 1\nchangeBrightness \n  [brightness <= 1] / brightness = 10"
          }
        },
        "embeds": [],
        "id": "_dAsUBpxNEeuu4YMPqKybnQ",
        "z": 221,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_DKe-sDeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_HslsYDekEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 0,
              "dy": 242.60504150390625,
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
                "text": "toggleMode"
              }
            },
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
        "id": "_ZolX4DekEeaQIqD3TyMHVw",
        "z": 222,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_HslsYDekEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_DKe-sDeaEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 513,
              "dy": 121,
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
                "text": "toggleMode"
              }
            },
            "position": {
              "offset": 19,
              "x": 0,
              "y": 0,
              "angle": 0
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
        "id": "_XkcV4DekEeaQIqD3TyMHVw",
        "z": 222,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_dAsT85xNEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_dAsUBpxNEeuu4YMPqKybnQ"
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
                "text": "switch /\n brightness = 10"
              }
            },
            "position": {
              "distance": 0.23623881208787312,
              "offset": -45,
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
        "id": "_dAsT_ZxNEeuu4YMPqKybnQ",
        "z": 222,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_dAsT8ZxNEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_dAsT85xNEeuu4YMPqKybnQ"
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
        "id": "_dAsT8pxNEeuu4YMPqKybnQ",
        "z": 223,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_dAsUBpxNEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_dAsT85xNEeuu4YMPqKybnQ",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 166,
              "dy": 53.66107177734375,
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
              "x": 0,
              "y": 0
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
        "id": "_dAs7AZxNEeuu4YMPqKybnQ",
        "z": 224,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
      }
    ]
  }
}