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
      "angle": 0,
      "type": "Statechart",
      "id": "_3AQUYJOAEeWuO-fDDpYHyA",
      "linkable": true,
      "fixedRatio": false,
      "embedable": true,
      "z": 0,
      "attrs": {
        "name": {
          "text": "LightSwitch Export"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninternal:\n\tvar brightness: integer\n\t\ninterface user:\n\tin event on_button\n\tin event off_button\n\tin event mode_button\n\t\ninterface sensor:\n\tin event motion\n\t\ninterface lum_sensor:\n \tin event bright\n \tin event dark"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 251,
        "y": 59
      },
      "size": {
        "width": 1629,
        "height": 576
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_P0LX8OkOEemeGdc82b-fAg",
        "_IpmAkOkOEemeGdc82b-fAg",
        "_dhWSkOkOEemeGdc82b-fAg",
        "_Y9ILYOkMEemeGdc82b-fAg",
        "_fEekIOkMEemeGdc82b-fAg",
        "_cD4PAOkOEemeGdc82b-fAg",
        "_yUYHgOkMEemeGdc82b-fAg",
        "_o8a5oOkMEemeGdc82b-fAg",
        "_bbJtAOkMEemeGdc82b-fAg",
        "_jCPvUOkOEemeGdc82b-fAg",
        "_oTWckOkOEemeGdc82b-fAg",
        "_2l1qwOkOEemeGdc82b-fAg",
        "_qRLtIOkMEemeGdc82b-fAg",
        "_37JQ0OkOEemeGdc82b-fAg",
        "__1CasOkNEemeGdc82b-fAg",
        "_CrZj0OkOEemeGdc82b-fAg",
        "_QYhGAOkMEemeGdc82b-fAg",
        "_HslsYDekEeaQIqD3TyMHVw",
        "_Rr-5AOkMEemeGdc82b-fAg",
        "_3ASJk5OAEeWuO-fDDpYHyA"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 41,
      "attrs": {
        "name": {
          "text": "main region"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 288,
        "y": 214
      },
      "size": {
        "width": 219,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "__1CasOkNEemeGdc82b-fAg",
      "z": 42,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 663,
        "y": 214
      },
      "size": {
        "width": 196,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_CrZj0OkOEemeGdc82b-fAg",
      "z": 43,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "TwilightDetected",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1359,
        "y": 214
      },
      "size": {
        "width": 205,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_EabG4OkNEemeGdc82b-fAg"
      ],
      "id": "_QYhGAOkMEemeGdc82b-fAg",
      "z": 44,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "MotionDetected",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 990,
        "y": 455
      },
      "size": {
        "width": 235,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_33fKwOkMEemeGdc82b-fAg"
      ],
      "id": "_HslsYDekEeaQIqD3TyMHVw",
      "z": 45,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "ManualMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness += 1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1012,
        "y": 214
      },
      "size": {
        "width": 191,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_Rr-5AOkMEemeGdc82b-fAg",
      "z": 50,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "MotionDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 1150,
        "y": 170
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
      "z": 57,
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
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
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 172,
            "dy": 8,
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
              "text": "user.on_button"
            }
          },
          "position": {
            "offset": -65,
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
      "vertices": [],
      "id": "_o8a5oOkMEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
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
              "text": "user.off_button"
            }
          },
          "position": {
            "distance": 0.4889502762430939,
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
      "id": "_yUYHgOkMEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
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
              "text": "sensor.motion"
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
      "id": "_bbJtAOkMEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
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
              "text": "user.on_button"
            }
          },
          "position": {
            "distance": 0.5203659955769125,
            "offset": -25,
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
          "x": 1332,
          "y": 498
        }
      ],
      "id": "_qRLtIOkMEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 184,
            "dy": 50,
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
      "id": "_fEekIOkMEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_CrZj0OkOEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 7,
            "dy": 10,
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
              "text": "user.on_button"
            }
          },
          "position": {
            "distance": 0.7567627463591691,
            "offset": -21.38470458984375,
            "x": 0,
            "y": 0,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": 3
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 836,
          "y": 398
        }
      ],
      "id": "_2l1qwOkOEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_CrZj0OkOEemeGdc82b-fAg"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
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
              "text": "user.mode_button"
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
      "id": "_cD4PAOkOEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "__1CasOkNEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 156,
            "dy": 11,
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
              "text": "user.mode_button"
            }
          },
          "position": {
            "distance": 0.5504743397847336,
            "offset": 14,
            "x": 0,
            "y": 0,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": 3
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 619,
          "y": 169
        }
      ],
      "id": "_jCPvUOkOEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "__1CasOkNEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 48,
            "dy": 11,
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
              "text": "user.mode_button"
            }
          },
          "position": {
            "distance": 0.6190856722415512,
            "offset": 15,
            "x": 0,
            "y": 0,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": 4
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 1128,
          "y": 101
        }
      ],
      "id": "_oTWckOkOEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "__1CasOkNEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
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
              "text": "user.on_button"
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
              "text": 3
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 389,
          "y": 501
        }
      ],
      "id": "_37JQ0OkOEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_3ASJk5OAEeWuO-fDDpYHyA"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
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
      "id": "_Y9ILYOkMEemeGdc82b-fAg",
      "z": 58,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "__1CasOkNEemeGdc82b-fAg"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 129,
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
              "text": "user.mode_button"
            }
          },
          "position": {
            "distance": 0.4634046672481803,
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
          "x": 763,
          "y": 131
        }
      ],
      "id": "_dhWSkOkOEemeGdc82b-fAg",
      "z": 59,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "__1CasOkNEemeGdc82b-fAg"
      },
      "target": {
        "id": "_CrZj0OkOEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 9,
            "dy": 14,
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
              "text": "lum_sensor.dark"
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
      "id": "_IpmAkOkOEemeGdc82b-fAg",
      "z": 60,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_CrZj0OkOEemeGdc82b-fAg"
      },
      "target": {
        "id": "__1CasOkNEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 213,
            "dy": 45,
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
              "text": "lum_sensor.bright"
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
      "id": "_P0LX8OkOEemeGdc82b-fAg",
      "z": 61,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
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
              "text": "sensor.motion"
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
              "text": 3
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 1586,
          "y": 228
        },
        {
          "x": 1498,
          "y": 328
        }
      ],
      "id": "_EabG4OkNEemeGdc82b-fAg",
      "z": 62,
      "parent": "_QYhGAOkMEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
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
              "text": "user.on_button [brightness < 10]"
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
      "vertices": [
        {
          "x": 1188,
          "y": 558
        },
        {
          "x": 1039,
          "y": 558
        }
      ],
      "id": "_33fKwOkMEemeGdc82b-fAg",
      "z": 63,
      "parent": "_HslsYDekEeaQIqD3TyMHVw",
      "attrs": {}
    }
  ]
}