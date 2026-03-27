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
        "x": -378,
        "y": 43
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
      "z": 156
    },
    {
      "position": {
        "x": -241,
        "y": 63
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
      "z": 158,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": 284,
        "y": 544
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
      "z": 160,
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
          "x": 544,
          "y": 658
        }
      ],
      "id": "_33fKwOkMEemeGdc82b-fAg",
      "z": 182,
      "parent": "_HslsYDekEeaQIqD3TyMHVw"
    },
    {
      "position": {
        "x": -364,
        "y": 116
      },
      "size": {
        "width": 1485,
        "height": 327.40625
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
      "z": 186,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": -361,
        "y": 161
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
        "_6pL5gOkQEemeGdc82b-fAg",
        "_cD4PAOkOEemeGdc82b-fAg",
        "_jCPvUOkOEemeGdc82b-fAg",
        "_6MCDcOkQEemeGdc82b-fAg",
        "_jgptIOkPEemeGdc82b-fAg",
        "_3gF3EOkPEemeGdc82b-fAg"
      ],
      "id": "_dY1k4ukQEemeGdc82b-fAg",
      "z": 187,
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
      "z": 188,
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
      "z": 189,
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
      "z": 190,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 656,
        "y": 181
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
      "z": 191,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -348,
        "y": 224.40625
      },
      "size": {
        "width": 626,
        "height": 197.40625
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
      "z": 192,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -345,
        "y": 269.40625
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
        "_P0LX8OkOEemeGdc82b-fAg",
        "_IpmAkOkOEemeGdc82b-fAg",
        "_p_A3sOkPEemeGdc82b-fAg",
        "_plI_IOkPEemeGdc82b-fAg",
        "__1CasOkNEemeGdc82b-fAg",
        "_CrZj0OkOEemeGdc82b-fAg"
      ],
      "id": "_jgriUOkPEemeGdc82b-fAg",
      "z": 193,
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
      "z": 194,
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
      "z": 195,
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
      "z": 196,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -342,
        "y": 303.40625
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
      "z": 197,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": -304,
        "y": 290.40625
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
      "z": 198,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 44,
        "y": 291.8125
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
      "z": 199,
      "parent": "_jgriUOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 427,
        "y": 219.40625
      },
      "size": {
        "width": 646,
        "height": 200.40625
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
      "z": 200,
      "parent": "_dY1k4ukQEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 430,
        "y": 264.40625
      },
      "size": {
        "width": 640,
        "height": 152.40625
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
        "__ZZ8sOkPEemeGdc82b-fAg",
        "_bbJtAOkMEemeGdc82b-fAg",
        "_fEekIOkMEemeGdc82b-fAg",
        "_Rr-5AOkMEemeGdc82b-fAg",
        "_QYhGAOkMEemeGdc82b-fAg",
        "_--jMsOkPEemeGdc82b-fAg"
      ],
      "id": "_3gHsQOkPEemeGdc82b-fAg",
      "z": 201,
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
      "z": 202,
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
      "z": 203,
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
      "z": 204,
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
      "z": 205,
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
      "z": 205,
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
      "z": 205,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
    },
    {
      "position": {
        "x": 461,
        "y": 285.40625
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
      "z": 205,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 773,
        "y": 287.515625
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
      "z": 206,
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
          "x": 1012,
          "y": 292
        }
      ],
      "id": "_EabG4OkNEemeGdc82b-fAg",
      "z": 207,
      "parent": "_QYhGAOkMEemeGdc82b-fAg"
    },
    {
      "position": {
        "x": 534,
        "y": 386.8125
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
      "z": 208,
      "parent": "_3gHsQOkPEemeGdc82b-fAg"
    }
  ]
}