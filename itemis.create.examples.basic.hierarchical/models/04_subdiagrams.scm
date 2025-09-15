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
          "x": -370,
          "y": 65
        },
        "size": {
          "height": 585,
          "width": 814
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
          "_7yRogOkQEemeGdc82b-fAg",
          "_2l1qwOkOEemeGdc82b-fAg",
          "_yUYHgOkMEemeGdc82b-fAg",
          "_dY0WwOkQEemeGdc82b-fAg",
          "_HslsYDekEeaQIqD3TyMHVw",
          "_7HK2AOkQEemeGdc82b-fAg"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 372
      },
      {
        "position": {
          "x": -342,
          "y": 133
        },
        "size": {
          "height": 279,
          "width": 761
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
        "z": 373,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": -148,
          "y": 485
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
        "z": 374,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": 30,
          "y": 82
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
        "z": 377,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "position": {
          "x": -339,
          "y": 154.796875
        },
        "size": {
          "height": 254.203125,
          "width": 755
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
          "_jCPvUOkOEemeGdc82b-fAg",
          "_cD4PAOkOEemeGdc82b-fAg",
          "_3gF3EOkPEemeGdc82b-fAg",
          "_jgptIOkPEemeGdc82b-fAg",
          "_6MCDcOkQEemeGdc82b-fAg",
          "ee97c1bf-f5df-49a4-831c-6afb0f975ba5",
          "9f1bf85f-3b5f-4ccb-8712-5c7636e98f25"
        ],
        "id": "_dY1k4ukQEemeGdc82b-fAg",
        "z": 379,
        "parent": "_dY0WwOkQEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 115,
          "y": 215.203125
        },
        "size": {
          "height": 94,
          "width": 267
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "MotionDetectionMode",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "subdiagram": {
            "active": true
          },
          "active": true
        },
        "embeds": [
          "_3gHsQOkPEemeGdc82b-fAg"
        ],
        "id": "_3gF3EOkPEemeGdc82b-fAg",
        "z": 381,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -306,
          "y": 215.203125
        },
        "size": {
          "height": 89,
          "width": 259
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "TwilightDetectionMode",
            "fill": "#CFD8DC",
            "fontSize": 12
          },
          "subdiagram": {
            "active": true
          },
          "active": true
        },
        "embeds": [
          "_jgriUOkPEemeGdc82b-fAg"
        ],
        "id": "_jgptIOkPEemeGdc82b-fAg",
        "z": 382,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 258,
          "y": 173.203125
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
        "z": 383,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "type": "Note",
        "attrs": {
          "root": {
            "display": ""
          },
          "body": {
            "filter": {
              "args": {}
            }
          },
          "label": {
            "text": "You can hover over\nthe the decorator icon to\nsee the subdiagram's contents.",
            "annotations": [
              {
                "start": 0,
                "end": 75,
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
        },
        "position": {
          "x": -292,
          "y": 326
        },
        "size": {
          "width": 227,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "ee97c1bf-f5df-49a4-831c-6afb0f975ba5",
        "z": 384,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "type": "Note",
        "attrs": {
          "root": {
            "display": ""
          },
          "body": {
            "filter": {
              "args": {}
            }
          },
          "label": {
            "text": "Click on the decorator icon \nto open the subdiagram.",
            "annotations": [
              {
                "start": 0,
                "end": 52,
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
        },
        "position": {
          "x": 123,
          "y": 329
        },
        "size": {
          "width": 207,
          "height": 60
        },
        "angle": 0,
        "linkable": false,
        "id": "9f1bf85f-3b5f-4ccb-8712-5c7636e98f25",
        "z": 385,
        "parent": "_dY1k4ukQEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -195,
          "y": 253.796875
        },
        "size": {
          "height": 152.40625,
          "width": 640
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
        "z": 389,
        "parent": "_3gF3EOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -305,
          "y": 253.796875
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
        "z": 390,
        "parent": "_jgptIOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -163,
          "y": 300
        },
        "size": {
          "height": 64.40625,
          "width": 193.81076049804688
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
        "z": 391,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 171,
          "y": 292
        },
        "size": {
          "height": 64.40625,
          "width": 193.81076049804688
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
        "z": 392,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -94,
          "y": 266
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
        "z": 395,
        "parent": "_3gHsQOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -302,
          "y": 287.796875
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
        "z": 397,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": -264,
          "y": 274.796875
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
        "z": 398,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
      },
      {
        "position": {
          "x": 84,
          "y": 276.203125
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
        "z": 399,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
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
            "x": 112,
            "y": 599
          }
        ],
        "id": "_33fKwOkMEemeGdc82b-fAg",
        "z": 400,
        "parent": "_HslsYDekEeaQIqD3TyMHVw"
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
        "z": 400,
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
        "z": 400,
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
        "z": 400,
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
        "z": 400,
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
        "z": 400,
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
        "z": 400,
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
        "z": 400,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "_HslsYDekEeaQIqD3TyMHVw"
        },
        "target": {
          "x": -64,
          "y": 310,
          "id": "_dY0WwOkQEemeGdc82b-fAg",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "39.894%",
              "dy": "100.44%",
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
        "z": 400,
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
        "z": 400,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA"
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
        "z": 400,
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
        "z": 401,
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
        "z": 402,
        "parent": "_jgriUOkPEemeGdc82b-fAg"
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
              "dx": "97.002%",
              "dy": "48.132%",
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
              "distance": 0.5696202441717559,
              "offset": 16.175628662109375,
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
            "x": 391,
            "y": 369
          }
        ],
        "id": "_EabG4OkNEemeGdc82b-fAg",
        "z": 403,
        "parent": "_QYhGAOkMEemeGdc82b-fAg"
      }
    ]
  }
}