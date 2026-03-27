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
        "x": -396,
        "y": 57
      },
      "size": {
        "width": 1527,
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
        "_yUYHgOkMEemeGdc82b-fAg",
        "_7yRogOkQEemeGdc82b-fAg",
        "_2l1qwOkOEemeGdc82b-fAg",
        "_7HK2AOkQEemeGdc82b-fAg",
        "_HslsYDekEeaQIqD3TyMHVw",
        "_dY0WwOkQEemeGdc82b-fAg"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 186
    },
    {
      "position": {
        "x": -259,
        "y": 77
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
      "z": 188,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": 266,
        "y": 558
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
      "z": 189,
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
              "text": 2
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
          "x": 526,
          "y": 672
        }
      ],
      "id": "_33fKwOkMEemeGdc82b-fAg",
      "z": 212,
      "parent": "_HslsYDekEeaQIqD3TyMHVw"
    },
    {
      "position": {
        "x": -364,
        "y": 134
      },
      "size": {
        "width": 1485,
        "height": 322.40625
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
      "z": 216,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": -361,
        "y": 179
      },
      "size": {
        "width": 1479,
        "height": 274.40625
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
        "_6pL5gOkQEemeGdc82b-fAg",
        "_cD4PAOkOEemeGdc82b-fAg",
        "_jCPvUOkOEemeGdc82b-fAg",
        "_6MCDcOkQEemeGdc82b-fAg",
        "_jgptIOkPEemeGdc82b-fAg",
        "_3gF3EOkPEemeGdc82b-fAg"
      ],
      "id": "_dY1k4ukQEemeGdc82b-fAg",
      "z": 217,
      "parent": "_dY0WwOkQEemeGdc82b-fAg"
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
      "z": 218,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
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
      "z": 219,
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
      "id": "_jCPvUOkOEemeGdc82b-fAg",
      "z": 220,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 656,
        "y": 194
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "ShallowHistory",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "_6MCDcOkQEemeGdc82b-fAg",
      "z": 221,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -342,
        "y": 237.40625
      },
      "size": {
        "height": 189,
        "width": 622
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
      "z": 222,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -341,
        "y": 276
      },
      "size": {
        "width": 620,
        "height": 149.40625
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "r1"
        }
      },
      "embeds": [
        "_P0LX8OkOEemeGdc82b-fAg",
        "_IpmAkOkOEemeGdc82b-fAg",
        "_p_A3sOkPEemeGdc82b-fAg",
        "_plI_IOkPEemeGdc82b-fAg",
        "__1CasOkNEemeGdc82b-fAg",
        "_CrZj0OkOEemeGdc82b-fAg"
      ],
      "id": "_jgriUOkPEemeGdc82b-fAg",
      "z": 223,
      "parent": "_jgptIOkPEemeGdc82b-fAg"
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
      "z": 224,
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
      "z": 225,
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
      "z": 226,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -338,
        "y": 310
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
      "z": 227,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -300,
        "y": 297
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
      "z": 228,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 48,
        "y": 298.40625
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
      "z": 229,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 443,
        "y": 238.40625
      },
      "size": {
        "height": 192,
        "width": 642
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
      "z": 230,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 444,
        "y": 277
      },
      "size": {
        "width": 640,
        "height": 152.40625
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "r1"
        }
      },
      "embeds": [
        "__ZZ8sOkPEemeGdc82b-fAg",
        "_bbJtAOkMEemeGdc82b-fAg",
        "_fEekIOkMEemeGdc82b-fAg",
        "_Rr-5AOkMEemeGdc82b-fAg",
        "_QYhGAOkMEemeGdc82b-fAg",
        "_--jMsOkPEemeGdc82b-fAg"
      ],
      "id": "_3gHsQOkPEemeGdc82b-fAg",
      "z": 231,
      "parent": "_3gF3EOkPEemeGdc82b-fAg"
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
      "z": 232,
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
      "z": 233,
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
      "id": "_fEekIOkMEemeGdc82b-fAg",
      "z": 234,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "_HslsYDekEeaQIqD3TyMHVw"
      },
      "target": {
        "id": "_dY0WwOkQEemeGdc82b-fAg"
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
      "z": 235,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
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
      "z": 235,
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
            "dx": 260,
            "dy": 8,
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
      "id": "_2l1qwOkOEemeGdc82b-fAg",
      "z": 235,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": 475,
        "y": 298
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
      "z": 235,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 787,
        "y": 300.109375
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
      "z": 236,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "type": "Transition",
      "attrs": {},
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
          "x": 987,
          "y": 333.8125
        },
        {
          "x": 987,
          "y": 378.8125
        }
      ],
      "id": "_EabG4OkNEemeGdc82b-fAg",
      "z": 237,
      "parent": "_QYhGAOkMEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 562,
        "y": 398.40625
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
      "z": 238,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    }
  ]
}