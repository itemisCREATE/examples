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
          "text": "LightSwitch Export"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninternal:\n\tvar brightness: integer\n\t\ninterface user:\n\tin event on_button\n\tin event off_button\n\tin event mode_button\n\t\ninterface sensor:\n\tin event motion\n\t\ninterface lum_sensor:\n \tin event bright\n \tin event dark"
        }
      },
      "z": 0
    },
    {
      "position": {
        "x": -335,
        "y": 45
      },
      "size": {
        "width": 1529,
        "height": 689
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "main region"
        }
      },
      "embeds": [
        "be6e2d54-333d-4168-b4d0-044e6bdb469f",
        "_yUYHgOkMEemeGdc82b-fAg",
        "_2l1qwOkOEemeGdc82b-fAg",
        "_7yRogOkQEemeGdc82b-fAg",
        "_7HK2AOkQEemeGdc82b-fAg",
        "_dY0WwOkQEemeGdc82b-fAg",
        "_HslsYDekEeaQIqD3TyMHVw"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 283
    },
    {
      "position": {
        "x": -196,
        "y": 65
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
      "id": "_7HK2AOkQEemeGdc82b-fAg",
      "z": 284,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": -302,
        "y": 128
      },
      "size": {
        "height": 327.40625,
        "width": 1485
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "AutomaticMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "embeds": [
        "_dY1k4ukQEemeGdc82b-fAg"
      ],
      "id": "_dY0WwOkQEemeGdc82b-fAg",
      "z": 313,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": -299,
        "y": 173
      },
      "size": {
        "width": 1479,
        "height": 279.40625
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
        "_jCPvUOkOEemeGdc82b-fAg",
        "_cD4PAOkOEemeGdc82b-fAg",
        "_6pL5gOkQEemeGdc82b-fAg",
        "_3gF3EOkPEemeGdc82b-fAg",
        "_6MCDcOkQEemeGdc82b-fAg",
        "_jgptIOkPEemeGdc82b-fAg"
      ],
      "id": "_dY1k4ukQEemeGdc82b-fAg",
      "z": 314,
      "parent": "_dY0WwOkQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 497,
        "y": 235.296875
      },
      "size": {
        "height": 206.703125,
        "width": 646
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MotionDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "embeds": [
        "_3gHsQOkPEemeGdc82b-fAg"
      ],
      "id": "_3gF3EOkPEemeGdc82b-fAg",
      "z": 318,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 718,
        "y": 193
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
      "id": "_6MCDcOkQEemeGdc82b-fAg",
      "z": 319,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -276,
        "y": 237.40625
      },
      "size": {
        "height": 197.40625,
        "width": 626
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "embeds": [
        "_jgriUOkPEemeGdc82b-fAg"
      ],
      "id": "_jgptIOkPEemeGdc82b-fAg",
      "z": 320,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 500,
        "y": 280.296875
      },
      "size": {
        "width": 640,
        "height": 158.703125
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
        "_bbJtAOkMEemeGdc82b-fAg",
        "_fEekIOkMEemeGdc82b-fAg",
        "__ZZ8sOkPEemeGdc82b-fAg",
        "_Rr-5AOkMEemeGdc82b-fAg",
        "_--jMsOkPEemeGdc82b-fAg",
        "_QYhGAOkMEemeGdc82b-fAg"
      ],
      "id": "_3gHsQOkPEemeGdc82b-fAg",
      "z": 321,
      "parent": "_3gF3EOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -273,
        "y": 282.40625
      },
      "size": {
        "width": 620,
        "height": 149.40625
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
        "_p_A3sOkPEemeGdc82b-fAg",
        "_P0LX8OkOEemeGdc82b-fAg",
        "_IpmAkOkOEemeGdc82b-fAg",
        "__1CasOkNEemeGdc82b-fAg",
        "_CrZj0OkOEemeGdc82b-fAg",
        "_plI_IOkPEemeGdc82b-fAg"
      ],
      "id": "_jgriUOkPEemeGdc82b-fAg",
      "z": 322,
      "parent": "_jgptIOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 572,
        "y": 300.296875
      },
      "size": {
        "height": 64.40625,
        "width": 189
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Idle",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0"
        }
      },
      "embeds": [],
      "id": "_Rr-5AOkMEemeGdc82b-fAg",
      "z": 326,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 522,
        "y": 324
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
      "id": "_--jMsOkPEemeGdc82b-fAg",
      "z": 327,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 879,
        "y": 304
      },
      "size": {
        "height": 64.40625,
        "width": 183
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "MotionDetected",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 1"
        }
      },
      "embeds": [
        "_EabG4OkNEemeGdc82b-fAg"
      ],
      "id": "_QYhGAOkMEemeGdc82b-fAg",
      "z": 328,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -232,
        "y": 303.40625
      },
      "size": {
        "height": 61.40625,
        "width": 196
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Idle",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0"
        }
      },
      "embeds": [],
      "id": "__1CasOkNEemeGdc82b-fAg",
      "z": 332,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 116,
        "y": 304.8125
      },
      "size": {
        "height": 60,
        "width": 194
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "TwilightDetected",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 1"
        }
      },
      "embeds": [],
      "id": "_CrZj0OkOEemeGdc82b-fAg",
      "z": 333,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -267,
        "y": 319
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
      "id": "_plI_IOkPEemeGdc82b-fAg",
      "z": 334,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_plI_IOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "__1CasOkNEemeGdc82b-fAg"
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
      "id": "_p_A3sOkPEemeGdc82b-fAg",
      "z": 335,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "id": "_P0LX8OkOEemeGdc82b-fAg",
      "z": 335,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "id": "_IpmAkOkOEemeGdc82b-fAg",
      "z": 335,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_--jMsOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "_Rr-5AOkMEemeGdc82b-fAg"
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
      "id": "__ZZ8sOkPEemeGdc82b-fAg",
      "z": 335,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "id": "_fEekIOkMEemeGdc82b-fAg",
      "z": 335,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "id": "_bbJtAOkMEemeGdc82b-fAg",
      "z": 335,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
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
      "id": "_cD4PAOkOEemeGdc82b-fAg",
      "z": 335,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_6MCDcOkQEemeGdc82b-fAg"
      },
      "target": {
        "id": "_3gF3EOkPEemeGdc82b-fAg"
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
      "id": "_6pL5gOkQEemeGdc82b-fAg",
      "z": 335,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_3gF3EOkPEemeGdc82b-fAg"
      },
      "target": {
        "id": "_jgptIOkPEemeGdc82b-fAg"
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
      "id": "_jCPvUOkOEemeGdc82b-fAg",
      "z": 335,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_7HK2AOkQEemeGdc82b-fAg"
      },
      "target": {
        "id": "_dY0WwOkQEemeGdc82b-fAg"
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
      "id": "_7yRogOkQEemeGdc82b-fAg",
      "z": 335,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_QYhGAOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "96.721%",
            "dy": "46.579%",
            "rotate": true
          }
        },
        "priority": true
      },
      "target": {
        "id": "_QYhGAOkMEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "96.721%",
            "dy": "31.053%",
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
          "x": 1113,
          "y": 384
        }
      ],
      "id": "_EabG4OkNEemeGdc82b-fAg",
      "z": 335,
      "parent": "_QYhGAOkMEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 259,
        "y": 552
      },
      "size": {
        "height": 82.99999618530273,
        "width": 341
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "ManualMode",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness += 1"
        }
      },
      "embeds": [
        "_33fKwOkMEemeGdc82b-fAg"
      ],
      "id": "_HslsYDekEeaQIqD3TyMHVw",
      "z": 344,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_dY0WwOkQEemeGdc82b-fAg"
      },
      "target": {
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.141%",
            "dy": "22.892%",
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
              "text": "user.on_button"
            }
          },
          "position": {
            "distance": 0.4797138307360343,
            "offset": -60,
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
      "id": "be6e2d54-333d-4168-b4d0-044e6bdb469f",
      "z": 345,
      "router": {
        "name": "orthogonal"
      },
      "vertices": [],
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "x": 295,
        "y": 447,
        "id": "_dY0WwOkQEemeGdc82b-fAg",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "40.162%",
            "dy": "98.065%",
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
      "id": "_yUYHgOkMEemeGdc82b-fAg",
      "z": 345,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "type": "Transition",
      "attrs": {},
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
          "x": 519,
          "y": 666
        }
      ],
      "id": "_33fKwOkMEemeGdc82b-fAg",
      "z": 345,
      "parent": "_HslsYDekEeaQIqD3TyMHVw"
    }
  ]
}