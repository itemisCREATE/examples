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
      "id": "b0456e8e-3f72-4243-851d-97d26b4c38fe",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "_02_DimmableLightSwitch"
        },
        "specification": {
          "text": "@EventDriven\n\ninterface:\n\tin event switch\n\tin event changeBrightness\n\tvar brightness: integer"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 0,
        "y": 7
      },
      "size": {
        "width": 540,
        "height": 288
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "z": 2,
      "embeds": [
        "1914b3f4-6026-45c9-9b30-598f0b954bbf",
        "92843b77-6eaa-4a02-9cd2-00ca32524b40",
        "bd48324d-87bd-4534-a534-590cc73d9685",
        "c56d8c53-be8c-49ad-a243-44591015ae59",
        "372465ad-5728-4305-ae67-2dcff3666e4d",
        "0539bd4a-d1ff-4da5-8495-06f092cd2312",
        "97961d62-266a-416d-8c6f-ec072e9d5c94",
        "82242200-41cf-419f-890c-c1d2c046f1e5"
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
        "x": 104,
        "y": 64
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "0539bd4a-d1ff-4da5-8495-06f092cd2312",
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "z": 3,
      "embeds": [
        "5f0670fd-93c2-4e63-831e-26153c9aa72c"
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
        "x": 104,
        "y": 79
      },
      "id": "5f0670fd-93c2-4e63-831e-26153c9aa72c",
      "z": 4,
      "parent": "0539bd4a-d1ff-4da5-8495-06f092cd2312",
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
        "x": 180,
        "y": 45
      },
      "size": {
        "width": 176,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "97961d62-266a-416d-8c6f-ec072e9d5c94",
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "z": 5,
      "attrs": {
        "name": {
          "text": "Off"
        },
        "specification": {
          "text": "entry / brightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 180,
        "y": 146
      },
      "size": {
        "width": 181,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "82242200-41cf-419f-890c-c1d2c046f1e5",
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "z": 6,
      "attrs": {
        "name": {
          "text": "On"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "95.55555555555561%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "0539bd4a-d1ff-4da5-8495-06f092cd2312"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.09469696969698047%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "97961d62-266a-416d-8c6f-ec072e9d5c94"
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
      "id": "372465ad-5728-4305-ae67-2dcff3666e4d",
      "z": 7,
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "25.09469696969698%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "97961d62-266a-416d-8c6f-ec072e9d5c94"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "24.40147329650093%",
            "dy": "0.9433962264150944%",
            "rotate": true
          }
        },
        "id": "82242200-41cf-419f-890c-c1d2c046f1e5"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "switch /\n brightness = 10",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.4375,
            "offset": 48.16999999999999,
            "angle": 0
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
      "id": "c56d8c53-be8c-49ad-a243-44591015ae59",
      "z": 8,
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "52.48618784530387%",
            "dy": "0.3144654088050672%",
            "rotate": true
          }
        },
        "id": "82242200-41cf-419f-890c-c1d2c046f1e5"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.97727272727273%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "97961d62-266a-416d-8c6f-ec072e9d5c94"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "switch ",
              "fontSize": "9"
            }
          },
          "position": {
            "offset": 32,
            "angle": 0
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
      "id": "bd48324d-87bd-4534-a534-590cc73d9685",
      "z": 9,
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "82242200-41cf-419f-890c-c1d2c046f1e5"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "63.812154696132595%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "82242200-41cf-419f-890c-c1d2c046f1e5"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "changeBrightness \n    [brightness > 1] / \n    brightness -= 1\n    ",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.3520408163265306,
            "offset": -72.5,
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
      "id": "92843b77-6eaa-4a02-9cd2-00ca32524b40",
      "z": 10,
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "vertices": [
        {
          "x": 383.5,
          "y": 172.5
        },
        {
          "x": 383.5,
          "y": 228.5
        },
        {
          "x": 295.5,
          "y": 228.5
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
            "dx": "3.6710371800606385%",
            "dy": "49.056603773584904%",
            "rotate": true
          }
        },
        "id": "82242200-41cf-419f-890c-c1d2c046f1e5"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "29.02891600034112%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "82242200-41cf-419f-890c-c1d2c046f1e5"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "changeBrightness \n    [brightness <= 1] / \n    brightness = 10\n    ",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.3398529355959671,
            "offset": 70.94383085081233,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "3"
            }
          }
        }
      ],
      "id": "1914b3f4-6026-45c9-9b30-598f0b954bbf",
      "z": 11,
      "parent": "10fa37b1-4b9b-40ff-8056-624d8d4e4260",
      "vertices": [
        {
          "x": 161.94383085081233,
          "y": 172
        },
        {
          "x": 161.94383085081233,
          "y": 231
        },
        {
          "x": 232.54233796061743,
          "y": 231
        }
      ],
      "attrs": {}
    }
  ]
}