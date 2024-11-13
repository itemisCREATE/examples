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
            "text": "_04_LightAndMotionSensingLightSwitch Export"
          },
          "specification": {
            "text": "@EventDriven\n\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\t\t\ninterface motion:\n\tconst timeout: integer = 30\n\tin event detected\n\t\ninterface luminosity:\n\tconst delay: integer = 10\n \tin event bright\n \tin event dark"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -262,
          "y": -155
        },
        "size": {
          "width": 1739,
          "height": 777
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_9ck4UDenEeaQIqD3TyMHVw",
          "_-6uRUDenEeaQIqD3TyMHVw",
          "_BfNnUDeoEeaQIqD3TyMHVw",
          "_sHfb0DenEeaQIqD3TyMHVw",
          "_cu2N1pxbEeuu4YMPqKybnQ",
          "_3ASJk5OAEeWuO-fDDpYHyA"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 1,
        "marker": [
          "Region must have a 'default' entry."
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "modes"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 6,
          "y": 236
        },
        "size": {
          "width": 1430,
          "height": 362
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_sHgC4TenEeaQIqD3TyMHVw"
        ],
        "id": "_sHfb0DenEeaQIqD3TyMHVw",
        "z": 2,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "Automatic"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 7,
          "y": 274.6000061035156
        },
        "size": {
          "width": 1428,
          "height": 322.3999938964844
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_7-9DwDenEeaQIqD3TyMHVw",
          "_1TjGQDeoEeaQIqD3TyMHVw",
          "_v-OAUDeoEeaQIqD3TyMHVw",
          "_0kFNoDenEeaQIqD3TyMHVw",
          "_DKe-sDeaEeaQIqD3TyMHVw",
          "_6qDGUDenEeaQIqD3TyMHVw"
        ],
        "id": "_sHgC4TenEeaQIqD3TyMHVw",
        "z": 3,
        "parent": "_sHfb0DenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "modes"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 26,
          "y": 313
        },
        "size": {
          "width": 740,
          "height": 268
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_0kF0sDenEeaQIqD3TyMHVw"
        ],
        "id": "_0kFNoDenEeaQIqD3TyMHVw",
        "z": 93,
        "marker": [
          "Node is not reachable."
        ],
        "parent": "_sHgC4TenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Light Sensing"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 27,
          "y": 351.6000061035156
        },
        "size": {
          "width": 738,
          "height": 228.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_mspuUDeoEeaQIqD3TyMHVw",
          "_kA2PYDeoEeaQIqD3TyMHVw",
          "_q59cQDeoEeaQIqD3TyMHVw",
          "_hjNvUDeoEeaQIqD3TyMHVw",
          "_YFepkDeoEeaQIqD3TyMHVw",
          "_Yc3O0DeoEeaQIqD3TyMHVw",
          "_XbQA0DeoEeaQIqD3TyMHVw",
          "_KQvHUDeoEeaQIqD3TyMHVw",
          "_UXU80DeoEeaQIqD3TyMHVw",
          "_XCh-0DeoEeaQIqD3TyMHVw",
          "_Rt9G0DeoEeaQIqD3TyMHVw",
          "_UpRBYDeoEeaQIqD3TyMHVw"
        ],
        "id": "_0kF0sDenEeaQIqD3TyMHVw",
        "z": 94,
        "parent": "_0kFNoDenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "r1"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 36,
          "y": 474
        },
        "size": {
          "width": 135.8000030517578,
          "height": 60.40000915527344
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_KQvHUDeoEeaQIqD3TyMHVw",
        "z": 95,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Bright"
          },
          "specification": {
            "text": "entry /\r\nbrightness = 0"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 225,
          "y": 362
        },
        "size": {
          "width": 86.39999389648438,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_UXU80DeoEeaQIqD3TyMHVw",
        "z": 96,
        "marker": [
          "Node is not reachable."
        ],
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Getting Dark"
          }
        }
      },
      {
        "type": "ShallowHistory",
        "position": {
          "x": 47,
          "y": 424
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_XCh-0DeoEeaQIqD3TyMHVw",
        "z": 97,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 518,
          "y": 358.3999938964844
        },
        "size": {
          "width": 143,
          "height": 60.40000915527344
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_Rt9G0DeoEeaQIqD3TyMHVw",
        "z": 103,
        "marker": [
          "Node is not reachable."
        ],
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Dark"
          },
          "specification": {
            "text": "entry / \r\nbrightness = 10"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_UXU80DeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_KQvHUDeoEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 41,
              "dy": 4,
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
                "text": "luminosity.bright"
              }
            },
            "position": {
              "distance": 0.3600635387155724,
              "offset": 13.883864010171536,
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
        "id": "_Yc3O0DeoEeaQIqD3TyMHVw",
        "z": 104,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_XCh-0DeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_KQvHUDeoEeaQIqD3TyMHVw"
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
        "id": "_XbQA0DeoEeaQIqD3TyMHVw",
        "z": 104,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_KQvHUDeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_UXU80DeoEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 4,
              "dy": 38,
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
                "text": "luminosity.dark"
              }
            },
            "position": {
              "distance": 0.747592364016219,
              "offset": 26,
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
        "vertices": [
          {
            "x": 117,
            "y": 400
          }
        ],
        "id": "_YFepkDeoEeaQIqD3TyMHVw",
        "z": 104,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_UXU80DeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_Rt9G0DeoEeaQIqD3TyMHVw"
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
                "text": "after luminosity.delay s"
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
                "text": 2
              }
            }
          }
        ],
        "vertices": [],
        "id": "_hjNvUDeoEeaQIqD3TyMHVw",
        "z": 105,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 885,
          "y": 331
        },
        "size": {
          "width": 461,
          "height": 250
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_DKgz4DeaEeaQIqD3TyMHVw"
        ],
        "id": "_DKe-sDeaEeaQIqD3TyMHVw",
        "z": 107,
        "parent": "_sHgC4TenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Motion Sensing"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 886,
          "y": 369.6000061035156
        },
        "size": {
          "width": 459,
          "height": 210.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_gm-R4DeaEeaQIqD3TyMHVw",
          "_YfxhQDeaEeaQIqD3TyMHVw",
          "_gISx0DeaEeaQIqD3TyMHVw",
          "_YJ4w0DeaEeaQIqD3TyMHVw",
          "_eMfMcDeaEeaQIqD3TyMHVw",
          "_Oh-bYDeaEeaQIqD3TyMHVw"
        ],
        "id": "_DKgz4DeaEeaQIqD3TyMHVw",
        "z": 108,
        "parent": "_DKe-sDeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "r1"
          }
        }
      },
      {
        "type": "ShallowHistory",
        "position": {
          "x": 919,
          "y": 459.6000061035156
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
        "z": 109,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1147,
          "y": 461.6000061035156
        },
        "size": {
          "width": 143,
          "height": 60.40000915527344
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_im-CIJxcEeuu4YMPqKybnQ"
        ],
        "id": "_eMfMcDeaEeaQIqD3TyMHVw",
        "z": 110,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Motion"
          },
          "specification": {
            "text": "entry /\nbrightness = 10"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 916,
          "y": 381.6000061035156
        },
        "size": {
          "width": 135.8000030517578,
          "height": 60.40000915527344
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_Oh-bYDeaEeaQIqD3TyMHVw",
        "z": 111,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Still"
          },
          "specification": {
            "text": "entry / \r\nbrightness = 0"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_0kFNoDenEeaQIqD3TyMHVw"
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
            "attrs": {
              "text": {
                "text": "hmi.toggleMode"
              }
            },
            "position": {
              "distance": 0.4308177174388112,
              "offset": 15,
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
        "id": "_1TjGQDeoEeaQIqD3TyMHVw",
        "z": 112,
        "parent": "_sHgC4TenEeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_DKe-sDeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_0kFNoDenEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 681,
              "dy": 95.92108154296875,
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
                "text": "hmi.toggleMode"
              }
            },
            "position": {
              "distance": 0.5405068564248252,
              "offset": 19.99998657226564,
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
        "id": "_v-OAUDeoEeaQIqD3TyMHVw",
        "z": 112,
        "parent": "_sHgC4TenEeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw"
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
            "attrs": {
              "text": {
                "text": "after motion.timeout s"
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
        "id": "_gm-R4DeaEeaQIqD3TyMHVw",
        "z": 112,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
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
        "z": 113,
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_Oh-bYDeaEeaQIqD3TyMHVw"
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
                "text": "motion.detected"
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
        "id": "_gISx0DeaEeaQIqD3TyMHVw",
        "z": 114,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_DKgz4DeaEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_eMfMcDeaEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 59,
              "dy": 54.399993896484375,
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
                "text": "motion.detected"
              }
            },
            "position": {
              "distance": 0.7158632021535052,
              "offset": -14,
              "x": 0,
              "y": 0,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": 2
              }
            }
          }
        ],
        "vertices": [
          {
            "x": 1321,
            "y": 475
          },
          {
            "x": 1294,
            "y": 547
          }
        ],
        "id": "_im-CIJxcEeuu4YMPqKybnQ",
        "z": 115,
        "parent": "_eMfMcDeaEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "ShallowHistory",
        "position": {
          "x": 1039,
          "y": 292
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_6qDGUDenEeaQIqD3TyMHVw",
        "z": 116,
        "parent": "_sHgC4TenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_6qDGUDenEeaQIqD3TyMHVw"
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
        "id": "_7-9DwDenEeaQIqD3TyMHVw",
        "z": 117,
        "parent": "_sHgC4TenEeaQIqD3TyMHVw",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 12,
          "y": -71
        },
        "size": {
          "width": 737,
          "height": 214
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_cu20tpxbEeuu4YMPqKybnQ"
        ],
        "id": "_cu2N1pxbEeuu4YMPqKybnQ",
        "z": 144,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "text": "Manual"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 13,
          "y": -32.399993896484375
        },
        "size": {
          "width": 735,
          "height": 174.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_cu20uJxbEeuu4YMPqKybnQ",
          "_cu20w5xbEeuu4YMPqKybnQ",
          "_cu3bz5xbEeuu4YMPqKybnQ",
          "_cu20zJxbEeuu4YMPqKybnQ",
          "_cu20uZxbEeuu4YMPqKybnQ",
          "_cu20t5xbEeuu4YMPqKybnQ"
        ],
        "id": "_cu20tpxbEeuu4YMPqKybnQ",
        "z": 145,
        "parent": "_cu2N1pxbEeuu4YMPqKybnQ",
        "attrs": {
          "name": {
            "text": "r1"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 381,
          "y": -15
        },
        "size": {
          "width": 301.3999938964844,
          "height": 94
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_cu20zJxbEeuu4YMPqKybnQ",
        "z": 150,
        "parent": "_cu20tpxbEeuu4YMPqKybnQ",
        "attrs": {
          "name": {
            "text": "On"
          },
          "specification": {
            "text": "hmi.changeBrightness \n [brightness > 1] / brightness -= 1\nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 53,
          "y": 6
        },
        "size": {
          "width": 164.60000610351562,
          "height": 60.40000915527344
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_cu20uZxbEeuu4YMPqKybnQ",
        "z": 154,
        "parent": "_cu20tpxbEeuu4YMPqKybnQ",
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
          "id": "_cu20zJxbEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_cu20uZxbEeuu4YMPqKybnQ",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 120,
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
                "text": "hmi.switch"
              }
            },
            "position": {
              "distance": 0.5247524752475248,
              "offset": -17,
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
        "id": "_cu3bz5xbEeuu4YMPqKybnQ",
        "z": 159,
        "parent": "_cu20tpxbEeuu4YMPqKybnQ",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_cu20uZxbEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_cu20zJxbEeuu4YMPqKybnQ",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2,
              "dy": 40,
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
                "text": "hmi.switch /\n brightness = 5"
              }
            },
            "position": {
              "distance": 0.5297029702970297,
              "offset": -19,
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
        "id": "_cu20w5xbEeuu4YMPqKybnQ",
        "z": 160,
        "parent": "_cu20tpxbEeuu4YMPqKybnQ",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 811,
          "y": -42
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
        "z": 163,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_3ASJk5OAEeWuO-fDDpYHyA"
        },
        "target": {
          "id": "_cu2N1pxbEeuu4YMPqKybnQ"
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
        "id": "_BfNnUDeoEeaQIqD3TyMHVw",
        "z": 164,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_sHfb0DenEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_cu2N1pxbEeuu4YMPqKybnQ",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 304,
              "dy": 212,
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
                "text": "hmi.switch"
              }
            },
            "position": {
              "distance": 0.521505376344086,
              "offset": -54,
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
        "id": "_-6uRUDenEeaQIqD3TyMHVw",
        "z": 166,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_cu2N1pxbEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_sHfb0DenEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 389,
              "dy": 5,
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
                "text": "hmi.toggleMode"
              }
            },
            "position": {
              "distance": 0.489247311827957,
              "offset": -71,
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
        "id": "_9ck4UDenEeaQIqD3TyMHVw",
        "z": 167,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 537,
          "y": 487
        },
        "size": {
          "width": 100.80000305175781,
          "height": 60
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_UpRBYDeoEeaQIqD3TyMHVw",
        "z": 168,
        "marker": [
          "Node is not reachable."
        ],
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Getting Bright"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_UpRBYDeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_KQvHUDeoEeaQIqD3TyMHVw"
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
                "text": "after luminosity.delay s"
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
                "text": 2
              }
            }
          }
        ],
        "vertices": [],
        "id": "_q59cQDeoEeaQIqD3TyMHVw",
        "z": 169,
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_Rt9G0DeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_UpRBYDeoEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 67,
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
            "attrs": {
              "text": {
                "text": "luminosity.bright"
              }
            },
            "position": {
              "distance": 0.4535279730365613,
              "offset": -72,
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
        "id": "_kA2PYDeoEeaQIqD3TyMHVw",
        "z": 170,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_UpRBYDeoEeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_Rt9G0DeoEeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 52,
              "dy": 52.600006103515625,
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
                "text": "luminosity.dark"
              }
            },
            "position": {
              "distance": 0.584069078904961,
              "offset": -67,
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
        "id": "_mspuUDeoEeaQIqD3TyMHVw",
        "z": 171,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_0kF0sDenEeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "ShallowHistory",
        "position": {
          "x": 128,
          "y": 107
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_cu20t5xbEeuu4YMPqKybnQ",
        "z": 172,
        "parent": "_cu20tpxbEeuu4YMPqKybnQ",
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_cu20t5xbEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_cu20uZxbEeuu4YMPqKybnQ"
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
        "id": "_cu20uJxbEeuu4YMPqKybnQ",
        "z": 173,
        "parent": "_cu20tpxbEeuu4YMPqKybnQ",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
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
        "moduleName": "04LightAndMotionSensingLightSwitch",
        "statemachinePrefix": "04LightAndMotionSensingLightSwitch",
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