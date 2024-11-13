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
            "text": "_02_DimmableLightSwitch Export"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tvar brightness: integer"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -40,
          "y": 7
        },
        "size": {
          "width": 589,
          "height": 353
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
        "z": 1,
        "attrs": {
          "name": {
            "text": "main"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 92,
          "y": 36
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
        "z": 2,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 165.5,
          "y": 197
        },
        "size": {
          "width": 181,
          "height": 60
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
        "z": 14,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "marker": [
          "Node is not reachable."
        ],
        "attrs": {
          "name": {
            "text": "On"
          }
        }
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
              "distance": 0.14986442053035573,
              "offset": -80.41602014087402,
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
        "vertices": [
          {
            "x": 370.5,
            "y": 234
          },
          {
            "x": 291,
            "y": 295
          }
        ],
        "id": "_CdIbYDeYEeaQIqD3TyMHVw",
        "z": 15,
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
              "offset": 69.14316864797469,
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
          }
        ],
        "vertices": [
          {
            "x": 140.5,
            "y": 235
          },
          {
            "x": 213,
            "y": 292
          }
        ],
        "id": "_qexnsJxjEeuu4YMPqKybnQ",
        "z": 16,
        "parent": "_Muq1cJQtEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 160,
          "y": 25
        },
        "size": {
          "width": 193.39999389648438,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_3ASwp5OAEeWuO-fDDpYHyA",
        "z": 17,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "Off"
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
          }
        ],
        "vertices": [],
        "id": "_3AT-w5OAEeWuO-fDDpYHyA",
        "z": 18,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
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
              "distance": 0.49107142857142855,
              "offset": 64,
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
        "id": "74f403f7-b611-4010-91b4-a299c2e10f90",
        "z": 19,
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
              "distance": 0.5551181102362205,
              "offset": 47,
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
        "id": "_QwgAQJQ6EeWuO-fDDpYHyA",
        "z": 20,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
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
        "moduleName": "02DimmableLightSwitch",
        "statemachinePrefix": "02DimmableLightSwitch",
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