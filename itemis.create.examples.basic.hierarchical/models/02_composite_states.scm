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
          "x": -382,
          "y": 72
        },
        "size": {
          "height": 632,
          "width": 1538
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": false,
        "embeds": [
          "_jCPvUOkOEemeGdc82b-fAg",
          "_cD4PAOkOEemeGdc82b-fAg",
          "_2l1qwOkOEemeGdc82b-fAg",
          "_Y9ILYOkMEemeGdc82b-fAg",
          "_yUYHgOkMEemeGdc82b-fAg",
          "_o8a5oOkMEemeGdc82b-fAg",
          "_3gF3EOkPEemeGdc82b-fAg",
          "_HslsYDekEeaQIqD3TyMHVw",
          "_3ASJk5OAEeWuO-fDDpYHyA",
          "542ac681-10df-4490-b6b7-475e3c5c56ce",
          "_jgptIOkPEemeGdc82b-fAg"
        ],
        "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "z": 224,
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
          "x": 423,
          "y": 171
        },
        "size": {
          "height": 201,
          "width": 699
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_3gHsQOkPEemeGdc82b-fAg"
        ],
        "id": "_3gF3EOkPEemeGdc82b-fAg",
        "z": 225,
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
          "x": 502,
          "y": 506
        },
        "size": {
          "height": 60,
          "width": 312
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_33fKwOkMEemeGdc82b-fAg"
        ],
        "id": "_HslsYDekEeaQIqD3TyMHVw",
        "z": 227,
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
          "x": 676,
          "y": 100
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_3ASJk5OAEeWuO-fDDpYHyA",
        "z": 228,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "Note",
        "position": {
          "x": -269,
          "y": 430
        },
        "size": {
          "width": 255.4817657470703,
          "height": 59.999996185302734
        },
        "angle": 0,
        "linkable": false,
        "id": "542ac681-10df-4490-b6b7-475e3c5c56ce",
        "z": 229,
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
      },
      {
        "type": "Region",
        "position": {
          "x": 424,
          "y": 209.59375
        },
        "size": {
          "height": 161.40625,
          "width": 697
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
        "z": 236,
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
          "x": 472,
          "y": 230.59375
        },
        "size": {
          "height": 60,
          "width": 185
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_Rr-5AOkMEemeGdc82b-fAg",
        "z": 239,
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
          "x": 433,
          "y": 243.59375
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_--jMsOkPEemeGdc82b-fAg",
        "z": 240,
        "parent": "_3gHsQOkPEemeGdc82b-fAg",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 784,
          "y": 230.59375
        },
        "size": {
          "height": 60,
          "width": 223
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_EabG4OkNEemeGdc82b-fAg"
        ],
        "id": "_QYhGAOkMEemeGdc82b-fAg",
        "z": 241,
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
            "x": 747,
            "y": 613
          },
          {
            "x": 678,
            "y": 613
          }
        ],
        "id": "_33fKwOkMEemeGdc82b-fAg",
        "z": 248,
        "parent": "_HslsYDekEeaQIqD3TyMHVw",
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
        "z": 248,
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
        "z": 248,
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
        "z": 248,
        "parent": "_3gHsQOkPEemeGdc82b-fAg",
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_Y9ILYOkMEemeGdc82b-fAg",
        "z": 248,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
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
        "z": 248,
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "vertices": [],
        "id": "_o8a5oOkMEemeGdc82b-fAg",
        "z": 248,
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
            "x": 1037,
            "y": 272
          },
          {
            "x": 961,
            "y": 313
          }
        ],
        "id": "_EabG4OkNEemeGdc82b-fAg",
        "z": 251,
        "parent": "_QYhGAOkMEemeGdc82b-fAg",
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": -360,
          "y": 175
        },
        "size": {
          "height": 201,
          "width": 599
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [
          "_jgriUOkPEemeGdc82b-fAg"
        ],
        "id": "_jgptIOkPEemeGdc82b-fAg",
        "z": 260,
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
        "type": "Region",
        "position": {
          "x": -359,
          "y": 213.59375
        },
        "size": {
          "height": 161.40625,
          "width": 597
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
        "z": 261,
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
          "x": -359,
          "y": 253.59375
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "_plI_IOkPEemeGdc82b-fAg",
        "z": 262,
        "parent": "_jgriUOkPEemeGdc82b-fAg",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -304,
          "y": 238.09375
        },
        "size": {
          "height": 60,
          "width": 183
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "__1CasOkNEemeGdc82b-fAg",
        "z": 263,
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
          "x": 23,
          "y": 245.5
        },
        "size": {
          "height": 60,
          "width": 190
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "embeds": [],
        "id": "_CrZj0OkOEemeGdc82b-fAg",
        "z": 264,
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
        "z": 265,
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
        "z": 265,
        "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
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
            "x": 175,
            "y": 471
          }
        ],
        "id": "_2l1qwOkOEemeGdc82b-fAg",
        "z": 265,
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
        "z": 265,
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
        "z": 266,
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
        "z": 267,
        "parent": "_jgriUOkPEemeGdc82b-fAg",
        "attrs": {}
      }
    ]
  }
}