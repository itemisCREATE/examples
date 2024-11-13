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
        "id": "_aRewoDe0EeaQIqD3TyMHVw",
        "linkable": true,
        "fixedRatio": false,
        "embedable": true,
        "z": 0,
        "attrs": {
          "name": {
            "text": "_05_PresenceSimulationLightSwitch Export"
          },
          "specification": {
            "text": "@EventDriven\n\t\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\ninterface simulation:\n\tvar WAIT_MIN: integer = 5\n\tvar WAIT_MAX: integer = 1200\n\tvar UPDATE_PERIOD : integer = 2\n\n\ninternal:\n\tvar wait_time: integer\n\tvar hour: integer\n\t\n\tevent changePresence\n\tevent startSimulation\n\tevent stopSimulation\n\t\n\toperation get_rand(): real\n\toperation get_hour(): integer\n\t\t\n\t\n\t"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -46,
          "y": -127
        },
        "size": {
          "width": 1673,
          "height": 1118
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_tHiT0De4EeaQIqD3TyMHVw",
          "_ZqZMYDe9EeaQIqD3TyMHVw",
          "_Xr0m4De9EeaQIqD3TyMHVw",
          "_G3B54JxoEeuu4YMPqKybnQ",
          "_BFudYDe1EeaQIqD3TyMHVw",
          "_aRhz9je0EeaQIqD3TyMHVw"
        ],
        "id": "_aRgl0ze0EeaQIqD3TyMHVw",
        "z": 1,
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
        "type": "State",
        "position": {
          "x": 0,
          "y": -55
        },
        "size": {
          "width": 788,
          "height": 245
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_G3B555xoEeuu4YMPqKybnQ"
        ],
        "id": "_G3B54JxoEeuu4YMPqKybnQ",
        "z": 118,
        "parent": "_aRgl0ze0EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Manual"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 1,
          "y": -16.399993896484375
        },
        "size": {
          "width": 786,
          "height": 205.39999389648438
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_G3B59JxoEeuu4YMPqKybnQ",
          "_G3B6G5xoEeuu4YMPqKybnQ",
          "_G3B56ZxoEeuu4YMPqKybnQ",
          "_G3B56JxoEeuu4YMPqKybnQ",
          "_G3B56pxoEeuu4YMPqKybnQ",
          "_G3B5_ZxoEeuu4YMPqKybnQ"
        ],
        "id": "_G3B555xoEeuu4YMPqKybnQ",
        "z": 119,
        "parent": "_G3B54JxoEeuu4YMPqKybnQ",
        "marker": [
          "Region must have a 'default' entry."
        ],
        "attrs": {
          "name": {
            "text": "mode"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 106,
          "y": 155.60000610351562
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_G3B56JxoEeuu4YMPqKybnQ",
        "z": 150,
        "parent": "_G3B555xoEeuu4YMPqKybnQ",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 34,
          "y": 33.5
        },
        "size": {
          "width": 179,
          "height": 60.40000915527344
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_G3B56pxoEeuu4YMPqKybnQ",
        "z": 152,
        "parent": "_G3B555xoEeuu4YMPqKybnQ",
        "attrs": {
          "name": {
            "text": "Off"
          },
          "specification": {
            "text": "entry \n    / brightness = 0"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_G3B56JxoEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_G3B56pxoEeuu4YMPqKybnQ"
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
        "id": "_G3B56ZxoEeuu4YMPqKybnQ",
        "z": 153,
        "parent": "_G3B555xoEeuu4YMPqKybnQ",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 383.5,
          "y": 20.5
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
        "id": "_G3B5_ZxoEeuu4YMPqKybnQ",
        "z": 155,
        "parent": "_G3B555xoEeuu4YMPqKybnQ",
        "attrs": {
          "name": {
            "text": "On"
          },
          "specification": {
            "text": "hmi.changeBrightness \n  [brightness > 1] / brightness -= 1 \nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_G3B56pxoEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_G3B5_ZxoEeuu4YMPqKybnQ",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 15.5,
              "dy": 19.699996948242188,
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
                "text": "hmi.switch /\n brightness = 10"
              }
            },
            "position": {
              "distance": 0.5117302052785924,
              "offset": -22.99999923706055,
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
        "id": "_G3B59JxoEeuu4YMPqKybnQ",
        "z": 156,
        "parent": "_G3B555xoEeuu4YMPqKybnQ",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_G3B5_ZxoEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_G3B56pxoEeuu4YMPqKybnQ",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 172,
              "dy": 47.5,
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
                "text": "hmi.switch "
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
        "id": "_G3B6G5xoEeuu4YMPqKybnQ",
        "z": 156,
        "parent": "_G3B555xoEeuu4YMPqKybnQ",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 0,
          "y": 247
        },
        "size": {
          "width": 1320,
          "height": 626
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_BFvrgDe1EeaQIqD3TyMHVw"
        ],
        "id": "_BFudYDe1EeaQIqD3TyMHVw",
        "z": 177,
        "parent": "_aRgl0ze0EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Presence Simulation"
          },
          "specification": {
            "text": "\tevery simulation.UPDATE_PERIOD s /  hour = get_hour "
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 1,
          "y": 285.6000061035156
        },
        "size": {
          "width": 1318,
          "height": 586.3999938964844
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_b7heUDe5EeaQIqD3TyMHVw",
          "_mqTYYDe9EeaQIqD3TyMHVw",
          "_pbAlcDe9EeaQIqD3TyMHVw",
          "__uMF4De4EeaQIqD3TyMHVw",
          "_jRBvcDe9EeaQIqD3TyMHVw",
          "_4c8s4De4EeaQIqD3TyMHVw"
        ],
        "id": "_BFvrgDe1EeaQIqD3TyMHVw",
        "z": 178,
        "parent": "_BFudYDe1EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "mode"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 74,
          "y": 309.6000061035156
        },
        "size": {
          "width": 243.8000030517578,
          "height": 110.80000305175781
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "__uMF4De4EeaQIqD3TyMHVw",
        "z": 179,
        "parent": "_BFvrgDe1EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Idle"
          },
          "specification": {
            "text": "entry / brightness = 0\n\n[ hour > 17 \n  || (hour > 7 && hour < 10) \n] / raise startSimulation"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 296,
          "y": 439
        },
        "size": {
          "width": 950,
          "height": 403
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_jRBvcze9EeaQIqD3TyMHVw",
          "_8tb4YDe9EeaQIqD3TyMHVw"
        ],
        "id": "_jRBvcDe9EeaQIqD3TyMHVw",
        "z": 180,
        "parent": "_BFvrgDe1EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Active"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 106,
          "y": 488.6000061035156
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_4c8s4De4EeaQIqD3TyMHVw",
        "z": 181,
        "parent": "_BFvrgDe1EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Region",
        "position": {
          "x": 297,
          "y": 478
        },
        "size": {
          "width": 592,
          "height": 363
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_CZk70De-EeaQIqD3TyMHVw",
          "_CEdAYDe-EeaQIqD3TyMHVw",
          "_973aYDe9EeaQIqD3TyMHVw"
        ],
        "id": "_jRBvcze9EeaQIqD3TyMHVw",
        "z": 185,
        "parent": "_jRBvcDe9EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "schedule"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 890,
          "y": 477.6000061035156
        },
        "size": {
          "width": 355,
          "height": 363
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_6ZuJUDe9EeaQIqD3TyMHVw",
          "_666K0De9EeaQIqD3TyMHVw",
          "_7Sar4De9EeaQIqD3TyMHVw",
          "_zI3K0De9EeaQIqD3TyMHVw",
          "_y1fi4De9EeaQIqD3TyMHVw",
          "_4-L_cDe9EeaQIqD3TyMHVw"
        ],
        "id": "_8tb4YDe9EeaQIqD3TyMHVw",
        "z": 186,
        "parent": "_jRBvcDe9EeaQIqD3TyMHVw",
        "marker": [
          "Region must have a 'default' entry."
        ],
        "attrs": {
          "name": {
            "text": "presence"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 337,
          "y": 561.6999969482422
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_CEdAYDe-EeaQIqD3TyMHVw",
        "z": 187,
        "parent": "_jRBvcze9EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 409.6999969482422,
          "y": 514
        },
        "size": {
          "width": 416.6000061035156,
          "height": 211.60000610351562
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_t6b1QJxuEeuu4YMPqKybnQ"
        ],
        "id": "_973aYDe9EeaQIqD3TyMHVw",
        "z": 188,
        "parent": "_jRBvcze9EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Waiting"
          },
          "specification": {
            "text": "entry /\n  wait_time =\n    (simulation.WAIT_MIN \n      + get_rand() \n        * (simulation.WAIT_MAX - simulation.WAIT_MIN)\n    ) as integer\n\nalways [ !(hour > 17 || (hour > 7 && hour < 10)) ]  \n\t/ raise stopSimulation\n\nafter wait_time s / raise changePresence"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 993.6061381074169,
          "y": 680.3999938964844
        },
        "size": {
          "height": 53,
          "width": 176
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_zI3K0De9EeaQIqD3TyMHVw",
        "z": 190,
        "parent": "_8tb4YDe9EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Present"
          },
          "specification": {
            "text": "entry / brightness = 10"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 995.6061381074169,
          "y": 534.3999938964844
        },
        "size": {
          "height": 53,
          "width": 179
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_y1fi4De9EeaQIqD3TyMHVw",
        "z": 191,
        "parent": "_8tb4YDe9EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "text": "Absent"
          },
          "specification": {
            "text": "entry / brightness = 0"
          }
        }
      },
      {
        "type": "ShallowHistory",
        "position": {
          "x": 933.6061381074169,
          "y": 542.8999938964844
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_4-L_cDe9EeaQIqD3TyMHVw",
        "z": 192,
        "parent": "_8tb4YDe9EeaQIqD3TyMHVw",
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "_CEdAYDe-EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_973aYDe9EeaQIqD3TyMHVw"
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
        "id": "_CZk70De-EeaQIqD3TyMHVw",
        "z": 193,
        "parent": "_jRBvcze9EeaQIqD3TyMHVw",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_jRBvcDe9EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "__uMF4De4EeaQIqD3TyMHVw"
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
                "text": "stopSimulation"
              }
            },
            "position": {
              "distance": 0.5315825767273297,
              "offset": -65.99457495057993,
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
        "id": "_pbAlcDe9EeaQIqD3TyMHVw",
        "z": 193,
        "parent": "_BFvrgDe1EeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_4c8s4De4EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "__uMF4De4EeaQIqD3TyMHVw"
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
        "id": "_b7heUDe5EeaQIqD3TyMHVw",
        "z": 193,
        "parent": "_BFvrgDe1EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "__uMF4De4EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_jRBvcDe9EeaQIqD3TyMHVw"
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
                "text": "startSimulation"
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
        "id": "_mqTYYDe9EeaQIqD3TyMHVw",
        "z": 193,
        "parent": "_BFvrgDe1EeaQIqD3TyMHVw",
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_G3B54JxoEeuu4YMPqKybnQ"
        },
        "target": {
          "id": "_BFudYDe1EeaQIqD3TyMHVw"
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
              "distance": 0.4620253164556962,
              "offset": -63,
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
        "id": "_ZqZMYDe9EeaQIqD3TyMHVw",
        "z": 193,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_aRgl0ze0EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_BFudYDe1EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_G3B54JxoEeuu4YMPqKybnQ"
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
              "distance": 0.5306122448979592,
              "offset": -58,
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
        "id": "_Xr0m4De9EeaQIqD3TyMHVw",
        "z": 193,
        "marker": [
          "Target state has regions without 'default' entries."
        ],
        "parent": "_aRgl0ze0EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_4-L_cDe9EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_y1fi4De9EeaQIqD3TyMHVw"
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
        "id": "_6ZuJUDe9EeaQIqD3TyMHVw",
        "z": 193,
        "parent": "_8tb4YDe9EeaQIqD3TyMHVw",
        "marker": [
          "Entry target must be child of the region.\nSource and target of a transition must not be located in orthogonal regions!"
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_zI3K0De9EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_y1fi4De9EeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 63,
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
                "text": "changePresence"
              }
            },
            "position": {
              "distance": 0.543010752688172,
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
        "id": "_666K0De9EeaQIqD3TyMHVw",
        "z": 194,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_8tb4YDe9EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_y1fi4De9EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_zI3K0De9EeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 123,
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
                "text": "changePresence"
              }
            },
            "position": {
              "distance": 0.46774193548387094,
              "offset": -60,
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
        "id": "_7Sar4De9EeaQIqD3TyMHVw",
        "z": 195,
        "marker": [
          "Source and target of a transition must not be located in orthogonal regions!"
        ],
        "parent": "_8tb4YDe9EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_973aYDe9EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_973aYDe9EeaQIqD3TyMHVw",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 96.29998779296875,
              "dy": 187.4000244140625,
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
                "text": "changePresence"
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
        "vertices": [
          {
            "x": 693,
            "y": 768.3999938964844
          }
        ],
        "id": "_t6b1QJxuEeuu4YMPqKybnQ",
        "z": 196,
        "parent": "_973aYDe9EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 874,
          "y": 56.20000457763672
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_aRhz9je0EeaQIqD3TyMHVw",
        "z": 197,
        "parent": "_aRgl0ze0EeaQIqD3TyMHVw",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "_aRhz9je0EeaQIqD3TyMHVw"
        },
        "target": {
          "id": "_G3B54JxoEeuu4YMPqKybnQ"
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
        "id": "_tHiT0De4EeaQIqD3TyMHVw",
        "z": 198,
        "parent": "_aRgl0ze0EeaQIqD3TyMHVw",
        "marker": [
          "Target state has regions without 'default' entries."
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
        "moduleName": "05PresenceSimulationLightSwitch",
        "statemachinePrefix": "05PresenceSimulationLightSwitch",
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