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
        "width": 1210,
        "height": 412
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
        "width": 515,
        "height": 293.3999938964844
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
        "x": -138,
        "y": 293
      },
      "size": {
        "width": 509,
        "height": 245.39999389648438
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
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
      "z": 198,
      "parent": "_DKe-sDeaEeaQIqD3TyMHVw"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_gISx0DeaEeaQIqD3TyMHVw",
      "z": 199,
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_gm-R4DeaEeaQIqD3TyMHVw",
      "z": 200,
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_YfxhQDeaEeaQIqD3TyMHVw",
      "z": 201,
      "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
    },
    {
      "position": {
        "x": -72,
        "y": 428.6000061035156
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
      "z": 202,
      "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
    },
    {
      "position": {
        "x": -109,
        "y": 349.6000061035156
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
      "z": 203,
      "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
    },
    {
      "position": {
        "x": 173,
        "y": 352.6000061035156
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
      "z": 204,
      "parent": "_DKgz4DeaEeaQIqD3TyMHVw"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [
        {
          "x": 258,
          "y": 335.3999938964844
        },
        {
          "x": 341,
          "y": 376.3999938964844
        }
      ],
      "id": "_FFds0EgxEeaqQLPHnkgH_g",
      "z": 205,
      "parent": "_eMfMcDeaEeaQIqD3TyMHVw"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_btDkAOLQEeqIEJujGIwh5g",
      "z": 213,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": 445,
        "y": 250
      },
      "size": {
        "width": 597,
        "height": 293.40625
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
        "x": 448,
        "y": 295
      },
      "size": {
        "width": 591,
        "height": 245.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
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
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_dAsT85xNEeuu4YMPqKybnQ"
      },
      "target": {
        "id": "_dAsUBpxNEeuu4YMPqKybnQ"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_dAsT_ZxNEeuu4YMPqKybnQ",
      "z": 219,
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_dAs7AZxNEeuu4YMPqKybnQ",
      "z": 220,
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_dAsT8pxNEeuu4YMPqKybnQ",
      "z": 221,
      "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
    },
    {
      "position": {
        "x": 522,
        "y": 330.3999938964844
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
      "z": 222,
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "vertices": [],
      "id": "_XkcV4DekEeaQIqD3TyMHVw",
      "z": 222,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": 466,
        "y": 390.3999938964844
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
      "z": 223,
      "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
    },
    {
      "position": {
        "x": 728.6000061035156,
        "y": 351.1999969482422
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
      "z": 224,
      "parent": "_dAsT8JxNEeuu4YMPqKybnQ"
    }
  ]
}