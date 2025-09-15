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
          "y": 71
        },
        "size": {
          "height": 675,
          "width": 1527
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
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
          "height": 314,
          "width": 1481
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
          "x": -363,
          "y": 172.59375
        },
        "size": {
          "height": 274.40625,
          "width": 1479
        },
        "type": "Region",
        "attrs": {
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
        "position": {
          "x": 654,
          "y": 187.59375
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
        "z": 220,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_2l1qwOkOEemeGdc82b-fAg",
        "z": 235,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": -344,
          "y": 231
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
        "z": 239,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -343,
          "y": 269.59375
        },
        "size": {
          "height": 149.40625,
          "width": 620
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
        "z": 240,
        "parent": "_jgptIOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -340,
          "y": 303.59375
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
        "z": 241,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -302,
          "y": 290.59375
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
        "z": 242,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 46,
          "y": 292
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
        "z": 243,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_P0LX8OkOEemeGdc82b-fAg",
        "z": 244,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_IpmAkOkOEemeGdc82b-fAg",
        "z": 245,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_p_A3sOkPEemeGdc82b-fAg",
        "z": 246,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 441,
          "y": 232
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
        "z": 247,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 442,
          "y": 270.59375
        },
        "size": {
          "height": 152.40625,
          "width": 640
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
        "z": 248,
        "parent": "_3gF3EOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 473,
          "y": 291.59375
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
        "z": 249,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 785,
          "y": 293.703125
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
        "z": 251,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_6pL5gOkQEemeGdc82b-fAg",
        "z": 252,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_cD4PAOkOEemeGdc82b-fAg",
        "z": 252,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_jCPvUOkOEemeGdc82b-fAg",
        "z": 252,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_bbJtAOkMEemeGdc82b-fAg",
        "z": 252,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_fEekIOkMEemeGdc82b-fAg",
        "z": 253,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [
          {
            "x": 985,
            "y": 327.40625
          },
          {
            "x": 985,
            "y": 372.40625
          }
        ],
        "id": "_EabG4OkNEemeGdc82b-fAg",
        "z": 255,
        "parent": "_QYhGAOkMEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 560,
          "y": 392
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
        "z": 256,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "__ZZ8sOkPEemeGdc82b-fAg",
        "z": 257,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
      }
    ]
  }
}