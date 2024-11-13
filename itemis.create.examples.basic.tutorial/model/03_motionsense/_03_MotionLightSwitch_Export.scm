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
            "text": "_03_MotionLightSwitch Export"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tin event toggleMode\n\tin event motionDetected\n\t\n\tvar brightness: integer"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 244,
          "y": 85
        },
        "size": {
          "width": 1210,
          "height": 412
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_ZolX4DekEeaQIqD3TyMHVw",
          "_XkcV4DekEeaQIqD3TyMHVw",
          "_3ASJk5OAEeWuO-fDDpYHyA",
          "_btDkAOLQEeqIEJujGIwh5g",
          "_DKe-sDeaEeaQIqD3TyMHVw",
          "_HslsYDekEeaQIqD3TyMHVw"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 143,
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "main"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 458,
          "y": 133
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_3ASJk5OAEeWuO-fDDpYHyA",
        "z": 144,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "marker": [
          "Duplicate unnamed Entry in Region 'main'"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 257,
          "y": 182
        },
        "size": {
          "width": 511,
          "height": 285
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_DKgz4DeaEeaQIqD3TyMHVw"
        ],
        "id": "_DKe-sDeaEeaQIqD3TyMHVw",
        "z": 145,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "MotionSensing"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 848,
          "y": 181
        },
        "size": {
          "width": 583,
          "height": 286
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_dAsT8JxNEeuu4YMPqKybnQ"
        ],
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "z": 146,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "marker": [
          "Node is not reachable."
        ],
        "attrs": {
          "name": {
            "text": "Manual"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 258,
          "y": 220.60000610351562
        },
        "size": {
          "width": 509,
          "height": 245.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_gISx0DeaEeaQIqD3TyMHVw",
          "_gm-R4DeaEeaQIqD3TyMHVw",
          "_YfxhQDeaEeaQIqD3TyMHVw",
          "_YJ4w0DeaEeaQIqD3TyMHVw",
          "_Oh-bYDeaEeaQIqD3TyMHVw",
          "_eMfMcDeaEeaQIqD3TyMHVw"
        ],
        "id": "_DKgz4DeaEeaQIqD3TyMHVw",
        "z": 150,
        "parent": "_DKe-sDeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "r1"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 849,
          "y": 219.60000610351562
        },
        "size": {
          "width": 581,
          "height": 246.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_dAs7AZxNEeuu4YMPqKybnQ",
          "_dAsT_ZxNEeuu4YMPqKybnQ",
          "_dAsT8pxNEeuu4YMPqKybnQ",
          "_dAsT8ZxNEeuu4YMPqKybnQ",
          "_dAsT85xNEeuu4YMPqKybnQ",
          "_dAsUBpxNEeuu4YMPqKybnQ"
        ],
        "id": "_dAsT8JxNEeuu4YMPqKybnQ",
        "z": 151,
        "parent": "_HslsYDekEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "r1"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 324,
          "y": 356.20001220703125
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_YJ4w0DeaEeaQIqD3TyMHVw",
        "z": 152,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 287,
          "y": 277.20001220703125
        },
        "size": {
          "width": 135.8000030517578,
          "height": 62
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_Oh-bYDeaEeaQIqD3TyMHVw",
        "z": 153,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Off"
          },
          "specification": {
            "text": "entry / \r\nbrightness = 0"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 569,
          "y": 280.20001220703125
        },
        "size": {
          "width": 135.8000030517578,
          "height": 62
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_FFds0EgxEeaqQLPHnkgH_g"
        ],
        "id": "_eMfMcDeaEeaQIqD3TyMHVw",
        "z": 154,
        "marker": [
          "Node is not reachable."
        ],
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "On"
          },
          "specification": {
            "text": "entry /\nbrightness = 1"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 923,
          "y": 255
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_dAsT8ZxNEeuu4YMPqKybnQ",
        "z": 158,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 867,
          "y": 315
        },
        "size": {
          "width": 171.8000030517578,
          "height": 68
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_dAsT85xNEeuu4YMPqKybnQ",
        "z": 159,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ",
        "marker": [
          "Could not find declaration of d<br>mismatched input '<EOF>' expecting '/'<br>Trigger 'd' is no event."
        ],
        "attrs": {
          "name": {
            "text": "Off"
          },
          "specification": {
            "text": "entry \n  / brightness = 0"
          }
        }
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_gm-R4DeaEeaQIqD3TyMHVw",
        "z": 161,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_gISx0DeaEeaQIqD3TyMHVw",
        "z": 161,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_YfxhQDeaEeaQIqD3TyMHVw",
        "z": 161,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_XkcV4DekEeaQIqD3TyMHVw",
        "z": 161,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_ZolX4DekEeaQIqD3TyMHVw",
        "z": 161,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_btDkAOLQEeqIEJujGIwh5g",
        "z": 161,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_dAsT8pxNEeuu4YMPqKybnQ",
        "z": 162,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ",
        "attrs": {}
      },
      {
        "type": "Transition",
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
              "distance": 0.44669378914149355,
              "offset": -19,
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
          }
        ],
        "vertices": [],
        "id": "_FFds0EgxEeaqQLPHnkgH_g",
        "z": 164,
        "parent": "_eMfMcDeaEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 1126,
          "y": 260
        },
        "size": {
          "height": 135,
          "width": 301.3999938964844
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_dAsUBpxNEeuu4YMPqKybnQ",
        "z": 169,
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ",
        "attrs": {
          "name": {
            "text": "On"
          },
          "specification": {
            "text": "changeBrightness \n  [brightness > 1] / brightness -= 1\nchangeBrightness \n  [brightness <= 1] / brightness = 10"
          }
        }
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_dAsT_ZxNEeuu4YMPqKybnQ",
        "z": 170,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ",
        "attrs": {}
      },
      {
        "type": "Transition",
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
          }
        ],
        "vertices": [],
        "id": "_dAs7AZxNEeuu4YMPqKybnQ",
        "z": 170,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_dAsT8JxNEeuu4YMPqKybnQ",
        "attrs": {}
      }
    ]
  },
  "genModel": {
    "generator": {
      "schemaKey": "yakindu::c",
      "LicenseHeader": {
        "licenseText": ""
      },
      "FunctionInlining": {
        "inlineReactions": false,
        "inlineEntryActions": false,
        "inlineExitActions": false,
        "inlineEnterSequences": false,
        "inlineExitSequences": false,
        "inlineChoices": false,
        "inlineEnterRegion": false,
        "inlineExitRegion": false,
        "inlineEntries": false
      },
      "OutEventAPI": {
        "observables": false,
        "getters": false
      },
      "IdentifierSettings": {
        "moduleName": "03MotionLightSwitch",
        "statemachinePrefix": "03MotionLightSwitch",
        "separator": "_",
        "headerFilenameExtension": "h",
        "sourceFilenameExtension": "c"
      },
      "Tracing": {
        "enterState": false,
        "exitState": false,
        "generic": false
      },
      "Includes": {
        "useRelativePaths": false
      },
      "GeneratorOptions": {
        "userAllocatedQueue": false,
        "metaSource": false
      },
      "GeneralFeatures": {
        "timerService": false
      }
    }
  }
}