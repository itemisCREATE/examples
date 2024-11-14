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
        "x": 310,
        "y": 254
      },
      "size": {
        "width": 1538,
        "height": 632
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_Y9ILYOkMEemeGdc82b-fAg",
        "_yUYHgOkMEemeGdc82b-fAg",
        "_o8a5oOkMEemeGdc82b-fAg",
        "_cD4PAOkOEemeGdc82b-fAg",
        "_2l1qwOkOEemeGdc82b-fAg",
        "_jCPvUOkOEemeGdc82b-fAg",
        "_3gF3EOkPEemeGdc82b-fAg",
        "_jgptIOkPEemeGdc82b-fAg",
        "_HslsYDekEeaQIqD3TyMHVw",
        "_3ASJk5OAEeWuO-fDDpYHyA",
        "542ac681-10df-4490-b6b7-475e3c5c56ce"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 167,
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
      "type": "State",
      "position": {
        "x": 1115,
        "y": 353
      },
      "size": {
        "width": 699,
        "height": 201
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_3gHsQOkPEemeGdc82b-fAg"
      ],
      "id": "_3gF3EOkPEemeGdc82b-fAg",
      "z": 168,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "MotionDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 323,
        "y": 353
      },
      "size": {
        "width": 599,
        "height": 201
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_jgriUOkPEemeGdc82b-fAg"
      ],
      "id": "_jgptIOkPEemeGdc82b-fAg",
      "z": 169,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1194,
        "y": 688
      },
      "size": {
        "width": 312,
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
      "z": 170,
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
      "type": "Entry",
      "position": {
        "x": 1368,
        "y": 282
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
      "z": 171,
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 1116,
        "y": 391.59375
      },
      "size": {
        "width": 697,
        "height": 161.40625
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_bbJtAOkMEemeGdc82b-fAg",
        "_fEekIOkMEemeGdc82b-fAg",
        "_Rr-5AOkMEemeGdc82b-fAg",
        "_--jMsOkPEemeGdc82b-fAg",
        "__ZZ8sOkPEemeGdc82b-fAg",
        "_QYhGAOkMEemeGdc82b-fAg"
      ],
      "id": "_3gHsQOkPEemeGdc82b-fAg",
      "z": 179,
      "parent": "_3gF3EOkPEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "r1"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 324,
        "y": 391.59375
      },
      "size": {
        "width": 597,
        "height": 161.40625
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_P0LX8OkOEemeGdc82b-fAg",
        "_IpmAkOkOEemeGdc82b-fAg",
        "_p_A3sOkPEemeGdc82b-fAg",
        "_plI_IOkPEemeGdc82b-fAg",
        "__1CasOkNEemeGdc82b-fAg",
        "_CrZj0OkOEemeGdc82b-fAg"
      ],
      "id": "_jgriUOkPEemeGdc82b-fAg",
      "z": 180,
      "parent": "_jgptIOkPEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "r1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1164,
        "y": 412.59375
      },
      "size": {
        "width": 185,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_Rr-5AOkMEemeGdc82b-fAg",
      "z": 182,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "Idle",
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
        "x": 1125,
        "y": 425.59375
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "_--jMsOkPEemeGdc82b-fAg",
      "z": 183,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1476,
        "y": 412.59375
      },
      "size": {
        "width": 223,
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
      "z": 184,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
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
      "type": "Entry",
      "position": {
        "x": 324,
        "y": 431.59375
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "_plI_IOkPEemeGdc82b-fAg",
      "z": 188,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 379,
        "y": 416.09375
      },
      "size": {
        "width": 183,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "__1CasOkNEemeGdc82b-fAg",
      "z": 189,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "Idle",
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
        "x": 706,
        "y": 423.5
      },
      "size": {
        "width": 190,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_CrZj0OkOEemeGdc82b-fAg",
      "z": 190,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
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
      "type": "Transition",
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 76,
            "dy": 51,
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
          "x": 1439,
          "y": 795
        },
        {
          "x": 1370,
          "y": 795
        }
      ],
      "id": "_33fKwOkMEemeGdc82b-fAg",
      "z": 191,
      "parent": "_HslsYDekEeaQIqD3TyMHVw",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_jgptIOkPEemeGdc82b-fAg"
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
              "text": 2
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 867,
          "y": 653
        }
      ],
      "id": "_2l1qwOkOEemeGdc82b-fAg",
      "z": 191,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_--jMsOkPEemeGdc82b-fAg"
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
      "id": "__ZZ8sOkPEemeGdc82b-fAg",
      "z": 191,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
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
            "dx": 179,
            "dy": 51.40625,
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
      "z": 191,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_QYhGAOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 6,
            "dy": 16.40625,
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
      "z": 191,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "id": "_3gF3EOkPEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 321,
            "dy": 200,
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
              "text": "user.off_button"
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
      "id": "_yUYHgOkMEemeGdc82b-fAg",
      "z": 191,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_jgptIOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "_3gF3EOkPEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 11,
            "dy": 22,
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
      "id": "_cD4PAOkOEemeGdc82b-fAg",
      "z": 191,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_3ASJk5OAEeWuO-fDDpYHyA"
      },
      "target": {
        "id": "_3gF3EOkPEemeGdc82b-fAg"
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
      "z": 191,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_3gF3EOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 74,
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
              "text": 2
            }
          }
        }
      ],
      "vertices": [],
      "id": "_o8a5oOkMEemeGdc82b-fAg",
      "z": 191,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_3gF3EOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "_jgptIOkPEemeGdc82b-fAg"
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
              "text": 1
            }
          }
        }
      ],
      "vertices": [],
      "id": "_jCPvUOkOEemeGdc82b-fAg",
      "z": 191,
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
            "dx": 10,
            "dy": 9.5,
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
      "z": 191,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_plI_IOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "__1CasOkNEemeGdc82b-fAg"
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
      "id": "_p_A3sOkPEemeGdc82b-fAg",
      "z": 192,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
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
            "dx": 174,
            "dy": 49.90625,
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
      "z": 193,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
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
            "distance": 0.5731345536639924,
            "offset": -17,
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
          "x": 1729,
          "y": 454
        },
        {
          "x": 1653,
          "y": 495
        }
      ],
      "id": "_EabG4OkNEemeGdc82b-fAg",
      "z": 194,
      "parent": "_QYhGAOkMEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Note",
      "position": {
        "x": 423,
        "y": 612
      },
      "size": {
        "width": 255.4817657470703,
        "height": 59.999996185302734
      },
      "angle": 0,
      "linkable": false,
      "id": "542ac681-10df-4490-b6b7-475e3c5c56ce",
      "z": 195,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "label": {
          "text": "An outgoing transition from a \ncomposite state is taken \nregardless of the active substate.",
          "annotations": [
            {
              "start": 0,
              "end": 91,
              "attrs": {
                "fill": "#333333",
                "font-size": 12,
                "font-weight": "normal",
                "text-decoration": "none",
                "font-style": "normal",
                "font-family": "'Roboto Mono', monospace"
              }
            }
          ]
        }
      }
    }
  ]
}