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
        "x": 421,
        "y": 172
      },
      "size": {
        "height": 675,
        "width": 1527
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_2l1qwOkOEemeGdc82b-fAg",
        "_yUYHgOkMEemeGdc82b-fAg",
        "_dY0WwOkQEemeGdc82b-fAg",
        "_7HK2AOkQEemeGdc82b-fAg",
        "_7yRogOkQEemeGdc82b-fAg",
        "_HslsYDekEeaQIqD3TyMHVw"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 28,
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
        "x": 426,
        "y": 227
      },
      "size": {
        "height": 314,
        "width": 1481
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_dY1k4ukQEemeGdc82b-fAg"
      ],
      "id": "_dY0WwOkQEemeGdc82b-fAg",
      "z": 30,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "AutomaticMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 558,
        "y": 178
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "_7HK2AOkQEemeGdc82b-fAg",
      "z": 31,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "_7HK2AOkQEemeGdc82b-fAg"
      },
      "target": {
        "id": "_dY0WwOkQEemeGdc82b-fAg"
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
      "id": "_7yRogOkQEemeGdc82b-fAg",
      "z": 47,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 427,
        "y": 265.59375
      },
      "size": {
        "height": 274.40625,
        "width": 1479
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_6pL5gOkQEemeGdc82b-fAg",
        "_cD4PAOkOEemeGdc82b-fAg",
        "_jCPvUOkOEemeGdc82b-fAg",
        "_3gF3EOkPEemeGdc82b-fAg",
        "_jgptIOkPEemeGdc82b-fAg",
        "_6MCDcOkQEemeGdc82b-fAg"
      ],
      "id": "_dY1k4ukQEemeGdc82b-fAg",
      "z": 76,
      "parent": "_dY0WwOkQEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "r1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1223,
        "y": 322.890625
      },
      "size": {
        "height": 192,
        "width": 642
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_3gHsQOkPEemeGdc82b-fAg"
      ],
      "id": "_3gF3EOkPEemeGdc82b-fAg",
      "z": 123,
      "parent": "_dY1k4ukQEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "MotionDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 1224,
        "y": 361.484375
      },
      "size": {
        "height": 152.40625,
        "width": 640
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
      "z": 124,
      "parent": "_3gF3EOkPEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "r1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1255,
        "y": 382.484375
      },
      "size": {
        "height": 64.40625,
        "width": 189
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_Rr-5AOkMEemeGdc82b-fAg",
      "z": 125,
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
        "x": 1233,
        "y": 395.484375
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
      "z": 126,
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
        "x": 1567,
        "y": 384.59375
      },
      "size": {
        "height": 64.40625,
        "width": 183
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_EabG4OkNEemeGdc82b-fAg"
      ],
      "id": "_QYhGAOkMEemeGdc82b-fAg",
      "z": 127,
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
      "type": "Transition",
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 187,
            "dy": 53.8125,
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
      "z": 128,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
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
      "z": 129,
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
            "dx": 3,
            "dy": 13.703125,
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
      "z": 130,
      "parent": "_3gHsQOkPEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg"
      },
      "target": {
        "id": "_QYhGAOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 107,
            "dy": 56.703125,
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
              "text": 2
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 1767,
          "y": 418.296875
        },
        {
          "x": 1767,
          "y": 463.296875
        }
      ],
      "id": "_EabG4OkNEemeGdc82b-fAg",
      "z": 131,
      "parent": "_QYhGAOkMEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 441,
        "y": 324.390625
      },
      "size": {
        "height": 189,
        "width": 622
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_jgriUOkPEemeGdc82b-fAg"
      ],
      "id": "_jgptIOkPEemeGdc82b-fAg",
      "z": 132,
      "parent": "_dY1k4ukQEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 442,
        "y": 362.984375
      },
      "size": {
        "height": 149.40625,
        "width": 620
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
      "z": 133,
      "parent": "_jgptIOkPEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "text": "r1"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 445,
        "y": 396.984375
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
      "z": 134,
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
        "x": 483,
        "y": 383.984375
      },
      "size": {
        "height": 61.40625,
        "width": 196
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "__1CasOkNEemeGdc82b-fAg",
      "z": 135,
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
        "x": 831,
        "y": 385.390625
      },
      "size": {
        "height": 60,
        "width": 194
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_CrZj0OkOEemeGdc82b-fAg",
      "z": 136,
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
      "z": 137,
      "parent": "_dY1k4ukQEemeGdc82b-fAg",
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
            "dx": 191,
            "dy": 47.40625,
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
              "text": "1"
            }
          }
        }
      ],
      "vertices": [],
      "id": "_P0LX8OkOEemeGdc82b-fAg",
      "z": 137,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
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
            "dx": 4,
            "dy": 14.833343505859375,
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
      "z": 138,
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
      "z": 139,
      "parent": "_jgriUOkPEemeGdc82b-fAg",
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
            "dx": 5,
            "dy": 27.109375,
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
      "z": 140,
      "parent": "_dY1k4ukQEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 1444,
        "y": 280.59375
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "_6MCDcOkQEemeGdc82b-fAg",
      "z": 141,
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "parent": "_dY1k4ukQEemeGdc82b-fAg",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "_6MCDcOkQEemeGdc82b-fAg"
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
      "id": "_6pL5gOkQEemeGdc82b-fAg",
      "z": 142,
      "parent": "_dY1k4ukQEemeGdc82b-fAg",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 1083,
        "y": 659
      },
      "size": {
        "height": 82.99999618530273,
        "width": 341
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [
        "_33fKwOkMEemeGdc82b-fAg"
      ],
      "id": "_HslsYDekEeaQIqD3TyMHVw",
      "z": 152,
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
      "type": "Transition",
      "source": {
        "id": "_dY0WwOkQEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 260,
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
      "id": "_2l1qwOkOEemeGdc82b-fAg",
      "z": 155,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
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
            "dx": 90,
            "dy": 46,
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
          "x": 1343,
          "y": 773
        }
      ],
      "id": "_33fKwOkMEemeGdc82b-fAg",
      "z": 155,
      "parent": "_HslsYDekEeaQIqD3TyMHVw",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "id": "_dY0WwOkQEemeGdc82b-fAg"
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
            "distance": 0.4745762711864407,
            "offset": -75,
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
      "z": 155,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    }
  ]
}