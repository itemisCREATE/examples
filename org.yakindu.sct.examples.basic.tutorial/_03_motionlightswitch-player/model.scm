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
      "id": "22c4d9bb-d6ad-4dec-9f59-fea69ecf8097",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "_03_MotionLightSwitch"
        },
        "specification": {
          "text": "@EventDriven\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tin event toggleMode\n\tin event motionDetected\n\t\n\tvar brightness: integer"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 9,
        "y": 0
      },
      "size": {
        "width": 1164,
        "height": 330
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "z": 2,
      "embeds": [
        "102dcd23-67e6-415d-bdaa-128ab333c7b6",
        "9eff113c-7784-4c53-8173-878e3bda2b5b",
        "7f1d21aa-0834-4fb9-926d-51fe0362efca",
        "eb20886d-7334-410c-ad6c-5df2b8dc0516",
        "bdddf684-7f08-451c-806c-3d9772b5187a",
        "ec72d50b-2905-4996-bcca-9817044151bb"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": "9",
          "text": "main"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 235,
        "y": 28
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "eb20886d-7334-410c-ad6c-5df2b8dc0516",
      "parent": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "z": 3,
      "embeds": [
        "40578349-3556-4906-b8a9-15350704225f"
      ],
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 235,
        "y": 43
      },
      "id": "40578349-3556-4906-b8a9-15350704225f",
      "z": 4,
      "parent": "eb20886d-7334-410c-ad6c-5df2b8dc0516",
      "attrs": {
        "label": {
          "fontSize": "9",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 34,
        "y": 77
      },
      "size": {
        "width": 418,
        "height": 225
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bdddf684-7f08-451c-806c-3d9772b5187a",
      "parent": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "z": 5,
      "embeds": [
        "e29a9f23-6255-4f6e-a2f2-d18010ce811c"
      ],
      "attrs": {
        "name": {
          "text": "MotionSensing"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 35,
        "y": 117
      },
      "size": {
        "width": 416,
        "height": 184
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "z": 6,
      "parent": "bdddf684-7f08-451c-806c-3d9772b5187a",
      "embeds": [
        "c45c1000-84ee-415c-97d0-484bd341ef0c",
        "9263c09d-98eb-4ebe-a256-0cb42b504fd3",
        "57b70201-3c73-4e3b-ae94-769365641a5e",
        "f75eeecb-407c-424f-b052-25b0ebf8dd5b",
        "99b282df-76d2-4488-be81-e91d83b4d135",
        "9c68627e-182e-472e-bb4f-4eadd738026d",
        "8031cb6e-4c16-407b-a825-71e3c650f4a4"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "r1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 49,
        "y": 145
      },
      "size": {
        "width": 123,
        "height": 62
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "99b282df-76d2-4488-be81-e91d83b4d135",
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "z": 7,
      "attrs": {
        "name": {
          "text": "Off"
        },
        "specification": {
          "text": "entry / \r\nbrightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 108,
        "y": 250
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "9c68627e-182e-472e-bb4f-4eadd738026d",
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "z": 8,
      "embeds": [
        "0fccd18e-6e92-4c52-a3bc-ebb05a0f9450"
      ],
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 108,
        "y": 265
      },
      "id": "0fccd18e-6e92-4c52-a3bc-ebb05a0f9450",
      "z": 9,
      "parent": "9c68627e-182e-472e-bb4f-4eadd738026d",
      "attrs": {
        "label": {
          "fontSize": "9",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 271,
        "y": 145
      },
      "size": {
        "width": 132,
        "height": 62
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8031cb6e-4c16-407b-a825-71e3c650f4a4",
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "z": 10,
      "attrs": {
        "name": {
          "text": "On"
        },
        "specification": {
          "text": "entry /\nbrightness = 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 572,
        "y": 77
      },
      "size": {
        "width": 551,
        "height": 225
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ec72d50b-2905-4996-bcca-9817044151bb",
      "parent": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "z": 11,
      "embeds": [
        "256f22c3-eeda-4bfd-8040-a2633d82bcd9"
      ],
      "attrs": {
        "name": {
          "text": "Manual"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 573,
        "y": 117
      },
      "size": {
        "width": 549,
        "height": 184
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "z": 12,
      "parent": "ec72d50b-2905-4996-bcca-9817044151bb",
      "embeds": [
        "3f364057-d9a2-4e29-8442-c0ad9c9106c8",
        "f19d0376-7c3a-475b-ad13-ab7c6b69a438",
        "756e86de-3650-41fd-98b8-b6134a4d9c4f",
        "0ed07006-c1d4-4b33-9b21-378d10ea921b",
        "d75e6a9e-fcee-44b9-b17c-bc58a9056dae",
        "b6b48ac5-abca-4b12-8afa-8a385190a5e4"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "r1"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 656,
        "y": 247
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "0ed07006-c1d4-4b33-9b21-378d10ea921b",
      "parent": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "z": 13,
      "embeds": [
        "80ae9fff-723b-4416-ae5c-1e9df5ccb3c4"
      ],
      "attrs": {}
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 656,
        "y": 262
      },
      "id": "80ae9fff-723b-4416-ae5c-1e9df5ccb3c4",
      "z": 14,
      "parent": "0ed07006-c1d4-4b33-9b21-378d10ea921b",
      "attrs": {
        "label": {
          "fontSize": "9",
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 585,
        "y": 145
      },
      "size": {
        "width": 144,
        "height": 68
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d75e6a9e-fcee-44b9-b17c-bc58a9056dae",
      "parent": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "z": 15,
      "attrs": {
        "name": {
          "text": "Off"
        },
        "specification": {
          "text": "entry \n  / brightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 875,
        "y": 145
      },
      "size": {
        "width": 232,
        "height": 135
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "b6b48ac5-abca-4b12-8afa-8a385190a5e4",
      "parent": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "z": 16,
      "attrs": {
        "name": {
          "text": "On"
        },
        "specification": {
          "text": "changeBrightness \n  [brightness > 1] / brightness -= 1\nchangeBrightness \n  [brightness <= 1] / brightness = 10",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50.69444444444458%",
            "dy": "3.0188679245285734%",
            "rotate": true
          }
        },
        "id": "9c68627e-182e-472e-bb4f-4eadd738026d"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "54.14972899728999%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "99b282df-76d2-4488-be81-e91d83b4d135"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "f75eeecb-407c-424f-b052-25b0ebf8dd5b",
      "z": 17,
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "24.32542097788601%",
            "rotate": true
          }
        },
        "id": "99b282df-76d2-4488-be81-e91d83b4d135"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.3029935987784728%",
            "dy": "24.32542097788601%",
            "rotate": true
          }
        },
        "id": "8031cb6e-4c16-407b-a825-71e3c650f4a4"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "motionDetected",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "57b70201-3c73-4e3b-ae94-769365641a5e",
      "z": 18,
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.36150411292872126%",
            "dy": "79.45119396732304%",
            "rotate": true
          }
        },
        "id": "8031cb6e-4c16-407b-a825-71e3c650f4a4"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "79.45119396732304%",
            "rotate": true
          }
        },
        "id": "99b282df-76d2-4488-be81-e91d83b4d135"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after 30s",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "9263c09d-98eb-4ebe-a256-0cb42b504fd3",
      "z": 19,
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.13486658979703062%",
            "dy": "34.122079421505205%",
            "rotate": true
          }
        },
        "id": "ec72d50b-2905-4996-bcca-9817044151bb"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "34.122079421505205%",
            "rotate": true
          }
        },
        "id": "bdddf684-7f08-451c-806c-3d9772b5187a"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "toggleMode",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "7f1d21aa-0834-4fb9-926d-51fe0362efca",
      "z": 20,
      "parent": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "55.661835748792264%",
            "rotate": true
          }
        },
        "id": "bdddf684-7f08-451c-806c-3d9772b5187a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.09834927867935579%",
            "dy": "55.661835748792264%",
            "rotate": true
          }
        },
        "id": "ec72d50b-2905-4996-bcca-9817044151bb"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "toggleMode",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "9eff113c-7784-4c53-8173-878e3bda2b5b",
      "z": 21,
      "parent": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "98.32900669652105%",
            "dy": "34.67392822231531%",
            "rotate": true
          }
        },
        "id": "8031cb6e-4c16-407b-a825-71e3c650f4a4"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.41837098276804%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "8031cb6e-4c16-407b-a825-71e3c650f4a4"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "motionDetected",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.6388253317287163,
            "offset": -14.493506493506516,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        }
      ],
      "id": "c45c1000-84ee-415c-97d0-484bd341ef0c",
      "z": 22,
      "parent": "e29a9f23-6255-4f6e-a2f2-d18010ce811c",
      "vertices": [
        {
          "x": 421.06027579202316,
          "y": 166.4978354978355
        },
        {
          "x": 421.06027579202316,
          "y": 226.50649350649348
        },
        {
          "x": 366.5922496972538,
          "y": 226.50649350649348
        }
      ],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "48.88888888888896%",
            "dy": "97.11583924349885%",
            "rotate": true
          }
        },
        "id": "eb20886d-7334-410c-ad6c-5df2b8dc0516"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "49.84051036682616%",
            "dy": "0.2821118991331812%",
            "rotate": true
          }
        },
        "id": "bdddf684-7f08-451c-806c-3d9772b5187a"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "102dcd23-67e6-415d-bdaa-128ab333c7b6",
      "z": 23,
      "parent": "baca18da-7ab9-4c2f-b97a-185d4775fa30",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "35.555555555555806%",
            "dy": "2.222222222222475%",
            "rotate": true
          }
        },
        "id": "0ed07006-c1d4-4b33-9b21-378d10ea921b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.00925925925929%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "d75e6a9e-fcee-44b9-b17c-bc58a9056dae"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "756e86de-3650-41fd-98b8-b6134a4d9c4f",
      "z": 24,
      "parent": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "17.892156862745125%",
            "rotate": true
          }
        },
        "id": "d75e6a9e-fcee-44b9-b17c-bc58a9056dae"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "9.012345679012359%",
            "rotate": true
          }
        },
        "id": "b6b48ac5-abca-4b12-8afa-8a385190a5e4"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "switch /\n brightness = 10",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "f19d0376-7c3a-475b-ad13-ab7c6b69a438",
      "z": 25,
      "parent": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "33.53831819240626%",
            "rotate": true
          }
        },
        "id": "b6b48ac5-abca-4b12-8afa-8a385190a5e4"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "66.58342582315949%",
            "rotate": true
          }
        },
        "id": "d75e6a9e-fcee-44b9-b17c-bc58a9056dae"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "switch ",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1"
            }
          }
        }
      ],
      "id": "3f364057-d9a2-4e29-8442-c0ad9c9106c8",
      "z": 26,
      "parent": "256f22c3-eeda-4bfd-8040-a2633d82bcd9",
      "attrs": {}
    }
  ]
}