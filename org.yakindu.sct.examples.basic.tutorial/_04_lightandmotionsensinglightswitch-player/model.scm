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
      "id": "28eb1d70-39e4-4253-b8ec-92e8fcfa1022",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "_04_LightAndMotionSensingLightSwitch"
        },
        "specification": {
          "text": "@EventDriven\n\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\t\t\ninterface motion:\n\tconst timeout: integer = 30\n\tin event detected\n\t\ninterface luminosity:\n\tconst delay: integer = 10\n \tin event bright\n \tin event dark"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 0,
        "y": 0
      },
      "size": {
        "width": 1379,
        "height": 622
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "z": 2,
      "embeds": [
        "231c4a4b-3c3d-42f9-869b-bf57e95dba5c",
        "6d2e0252-baab-430a-9d1d-03b79369e04f",
        "4c43c205-cb4f-46f8-b139-f9282d1d4060",
        "2a9a1697-9390-4309-b28f-19339e7a037e",
        "09ff90e6-25bc-41ce-a4b7-9b020a63096a",
        "bd02f6d2-2770-462d-8023-5f4683fcb85b"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": "9",
          "text": "modes"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 602,
        "y": 47
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "2a9a1697-9390-4309-b28f-19339e7a037e",
      "parent": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "z": 3,
      "embeds": [
        "414bbca3-3560-4319-b25d-3da8a0b619c7"
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
        "x": 602,
        "y": 62
      },
      "id": "414bbca3-3560-4319-b25d-3da8a0b619c7",
      "z": 4,
      "parent": "2a9a1697-9390-4309-b28f-19339e7a037e",
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
        "x": 18,
        "y": 294
      },
      "size": {
        "width": 1311,
        "height": 300
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "09ff90e6-25bc-41ce-a4b7-9b020a63096a",
      "parent": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "z": 5,
      "embeds": [
        "da19678f-222e-45bf-a8a2-ef7a6ecce6f0"
      ],
      "attrs": {
        "name": {
          "text": "Automatic"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 19,
        "y": 334
      },
      "size": {
        "width": 1309,
        "height": 259
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "z": 6,
      "parent": "09ff90e6-25bc-41ce-a4b7-9b020a63096a",
      "embeds": [
        "aa232eb9-0b18-413c-a579-3b62fe180bc1",
        "8b31cf25-ece0-4d3e-b0b3-5def3fd7b83d",
        "d2a87959-719a-4ffc-8057-3687760c97d6",
        "44ad37b1-8174-44db-9af3-ee5d5f378ce8",
        "278ae822-3bb5-4b3b-b9b1-79f7fe46209b",
        "0dc6563b-8e04-4736-a3c9-3af0c523e057"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "modes"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 861,
        "y": 362
      },
      "size": {
        "width": 428,
        "height": 209
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "44ad37b1-8174-44db-9af3-ee5d5f378ce8",
      "parent": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "z": 7,
      "embeds": [
        "c657162c-aaf7-4760-869e-6731fcbca2ab"
      ],
      "attrs": {
        "name": {
          "text": "Motion Sensing"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 862,
        "y": 402
      },
      "size": {
        "width": 426,
        "height": 168
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "z": 8,
      "parent": "44ad37b1-8174-44db-9af3-ee5d5f378ce8",
      "embeds": [
        "36f02087-8958-4cf9-8e55-117060dead31",
        "d8098cd2-521f-4223-8eb2-f17178677397",
        "2e3025b5-9ed8-431e-821d-56b2c7c9f82e",
        "2bde34fc-18e2-43e5-9963-289e47b2536d",
        "27cb303e-d67f-4f21-96b8-f1816d79bfa1",
        "29220651-4eed-46c0-bec4-0d4624858ddc",
        "ff734c35-d03a-47d2-87ed-f39a3e33d278"
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
        "x": 887,
        "y": 430
      },
      "size": {
        "width": 117,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "27cb303e-d67f-4f21-96b8-f1816d79bfa1",
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "z": 9,
      "attrs": {
        "name": {
          "text": "Still"
        },
        "specification": {
          "text": "entry / \r\nbrightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "ShallowHistory",
      "position": {
        "x": 907,
        "y": 520
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "29220651-4eed-46c0-bec4-0d4624858ddc",
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "z": 10,
      "embeds": [
        "b5bdac9d-8e57-4a86-889f-388a5b94eebc"
      ],
      "attrs": {
        "name": {
          "fill": "#555555"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 907,
        "y": 535
      },
      "id": "b5bdac9d-8e57-4a86-889f-388a5b94eebc",
      "z": 11,
      "parent": "29220651-4eed-46c0-bec4-0d4624858ddc",
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
        "x": 1132,
        "y": 430
      },
      "size": {
        "width": 117,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ff734c35-d03a-47d2-87ed-f39a3e33d278",
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "z": 12,
      "attrs": {
        "name": {
          "text": "Motion"
        },
        "specification": {
          "text": "entry /\nbrightness = 10",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 31,
        "y": 362
      },
      "size": {
        "width": 674,
        "height": 210
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "278ae822-3bb5-4b3b-b9b1-79f7fe46209b",
      "parent": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "z": 13,
      "embeds": [
        "f786f67b-f82a-44f2-b9ac-c54fbb407874"
      ],
      "attrs": {
        "name": {
          "text": "Light Sensing"
        }
      }
    },
    {
      "type": "ShallowHistory",
      "position": {
        "x": 762,
        "y": 385
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "0dc6563b-8e04-4736-a3c9-3af0c523e057",
      "parent": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "z": 21,
      "embeds": [
        "783a632d-b8fb-4329-8b82-e317f8929ed2"
      ],
      "attrs": {
        "name": {
          "fill": "#555555"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 762,
        "y": 400
      },
      "id": "783a632d-b8fb-4329-8b82-e317f8929ed2",
      "z": 22,
      "parent": "0dc6563b-8e04-4736-a3c9-3af0c523e057",
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
        "x": 18,
        "y": 28
      },
      "size": {
        "width": 530,
        "height": 216
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bd02f6d2-2770-462d-8023-5f4683fcb85b",
      "parent": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "z": 23,
      "embeds": [
        "d0e022eb-a366-47d2-8de7-341d16439357"
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
        "x": 19,
        "y": 68
      },
      "size": {
        "width": 528,
        "height": 175
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "d0e022eb-a366-47d2-8de7-341d16439357",
      "z": 24,
      "parent": "bd02f6d2-2770-462d-8023-5f4683fcb85b",
      "embeds": [
        "1f426c73-cd8e-4c41-8f4c-f186e24189ad",
        "475ff1f0-3054-437d-9ac9-da17e3c5cb3b",
        "f1526dbc-acb5-4bf2-897e-67afebb6245c",
        "9712ac76-6397-4d7e-984f-572bcfdf78a5",
        "d2b5b9c0-4488-47c5-aeb9-96fbfc1f2a15",
        "ea064364-8a4b-433c-8610-7fb0515ea792"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "r1"
        }
      }
    },
    {
      "type": "ShallowHistory",
      "position": {
        "x": 97,
        "y": 198
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "9712ac76-6397-4d7e-984f-572bcfdf78a5",
      "parent": "d0e022eb-a366-47d2-8de7-341d16439357",
      "z": 25,
      "embeds": [
        "06a940c3-9c22-4f5b-800c-4d1f07528571"
      ],
      "attrs": {
        "name": {
          "fill": "#555555"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 97,
        "y": 213
      },
      "id": "06a940c3-9c22-4f5b-800c-4d1f07528571",
      "z": 26,
      "parent": "9712ac76-6397-4d7e-984f-572bcfdf78a5",
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
        "x": 48,
        "y": 96
      },
      "size": {
        "width": 126,
        "height": 68
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d2b5b9c0-4488-47c5-aeb9-96fbfc1f2a15",
      "parent": "d0e022eb-a366-47d2-8de7-341d16439357",
      "z": 27,
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
        "x": 295,
        "y": 96
      },
      "size": {
        "width": 213,
        "height": 126
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ea064364-8a4b-433c-8610-7fb0515ea792",
      "parent": "d0e022eb-a366-47d2-8de7-341d16439357",
      "z": 28,
      "attrs": {
        "name": {
          "text": "On"
        },
        "specification": {
          "text": "hmi.changeBrightness \n [brightness > 1] / brightness -= 1\nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10",
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
            "dx": "69.30555555555581%",
            "dy": "2.222222222222475%",
            "rotate": true
          }
        },
        "id": "29220651-4eed-46c0-bec4-0d4624858ddc"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "25.97934472934476%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "27cb303e-d67f-4f21-96b8-f1816d79bfa1"
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
      "id": "2bde34fc-18e2-43e5-9963-289e47b2536d",
      "z": 29,
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "57.763620027771026%",
            "rotate": true
          }
        },
        "id": "27cb303e-d67f-4f21-96b8-f1816d79bfa1"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.5075534487299297%",
            "dy": "57.763620027771026%",
            "rotate": true
          }
        },
        "id": "ff734c35-d03a-47d2-87ed-f39a3e33d278"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "motion.detected",
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
      "id": "2e3025b5-9ed8-431e-821d-56b2c7c9f82e",
      "z": 30,
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "8.548445019033336%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "ff734c35-d03a-47d2-87ed-f39a3e33d278"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.85046326222792%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "27cb303e-d67f-4f21-96b8-f1816d79bfa1"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after motion.timeout s",
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
      "id": "d8098cd2-521f-4223-8eb2-f17178677397",
      "z": 31,
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "vertices": [
        {
          "x": 1142.001680672269,
          "y": 512.8103896103896
        },
        {
          "x": 950.0050420168067,
          "y": 512.8103896103896
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
            "dx": "90.89743589743648%",
            "dy": "36.030595813204705%",
            "rotate": true
          }
        },
        "id": "0dc6563b-8e04-4736-a3c9-3af0c523e057"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.17972681524082168%",
            "dy": "13.590712618172587%",
            "rotate": true
          }
        },
        "id": "44ad37b1-8174-44db-9af3-ee5d5f378ce8"
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
      "id": "d2a87959-719a-4ffc-8057-3687760c97d6",
      "z": 32,
      "parent": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "65.99964401987621%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "bd02f6d2-2770-462d-8023-5f4683fcb85b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "26.681778284160483%",
            "dy": "0.2673672203953477%",
            "rotate": true
          }
        },
        "id": "09ff90e6-25bc-41ce-a4b7-9b020a63096a"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.toggleMode",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.44,
            "offset": -47.19999999999999,
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
      "id": "4c43c205-cb4f-46f8-b139-f9282d1d4060",
      "z": 33,
      "parent": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "10.458475214784666%",
            "dy": "0.11090347971346166%",
            "rotate": true
          }
        },
        "id": "09ff90e6-25bc-41ce-a4b7-9b020a63096a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "25.869926427514528%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "bd02f6d2-2770-462d-8023-5f4683fcb85b"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.switch",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.54,
            "offset": -39.110000000000014,
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
      "id": "6d2e0252-baab-430a-9d1d-03b79369e04f",
      "z": 34,
      "parent": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.1481481481478113%",
            "dy": "37.38562091503274%",
            "rotate": true
          }
        },
        "id": "2a9a1697-9390-4309-b28f-19339e7a037e"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "11.392519970951348%",
            "rotate": true
          }
        },
        "id": "bd02f6d2-2770-462d-8023-5f4683fcb85b"
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
      "id": "231c4a4b-3c3d-42f9-869b-bf57e95dba5c",
      "z": 35,
      "parent": "b9e4ae18-b543-482f-8464-646a9e68136d",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.16703480837721943%",
            "dy": "58.62515313316228%",
            "rotate": true
          }
        },
        "id": "44ad37b1-8174-44db-9af3-ee5d5f378ce8"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "58.345985737290086%",
            "rotate": true
          }
        },
        "id": "278ae822-3bb5-4b3b-b9b1-79f7fe46209b"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.toggleMode",
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
      "id": "8b31cf25-ece0-4d3e-b0b3-5def3fd7b83d",
      "z": 43,
      "parent": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "78.03830227743273%",
            "rotate": true
          }
        },
        "id": "278ae822-3bb5-4b3b-b9b1-79f7fe46209b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.13530571256240442%",
            "dy": "78.41169128354485%",
            "rotate": true
          }
        },
        "id": "44ad37b1-8174-44db-9af3-ee5d5f378ce8"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.toggleMode",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.4807692307692308,
            "offset": 10.120000000000005,
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
      "id": "aa232eb9-0b18-413c-a579-3b62fe180bc1",
      "z": 44,
      "parent": "da19678f-222e-45bf-a8a2-ef7a6ecce6f0",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "35.55555555555562%",
            "dy": "11.111111111111237%",
            "rotate": true
          }
        },
        "id": "9712ac76-6397-4d7e-984f-572bcfdf78a5"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "43.12169312169313%",
            "dy": "98.28431372549021%",
            "rotate": true
          }
        },
        "id": "d2b5b9c0-4488-47c5-aeb9-96fbfc1f2a15"
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
      "id": "f1526dbc-acb5-4bf2-897e-67afebb6245c",
      "z": 45,
      "parent": "d0e022eb-a366-47d2-8de7-341d16439357",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "17.64705882352943%",
            "rotate": true
          }
        },
        "id": "d2b5b9c0-4488-47c5-aeb9-96fbfc1f2a15"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.15649452269172356%",
            "dy": "9.523809523809536%",
            "rotate": true
          }
        },
        "id": "ea064364-8a4b-433c-8610-7fb0515ea792"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.switch /\n brightness = 5",
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
      "id": "475ff1f0-3054-437d-9ac9-da17e3c5cb3b",
      "z": 46,
      "parent": "d0e022eb-a366-47d2-8de7-341d16439357",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "43.820505141259865%",
            "rotate": true
          }
        },
        "id": "ea064364-8a4b-433c-8610-7fb0515ea792"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "81.19681834998151%",
            "rotate": true
          }
        },
        "id": "d2b5b9c0-4488-47c5-aeb9-96fbfc1f2a15"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.switch",
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
      "id": "1f426c73-cd8e-4c41-8f4c-f186e24189ad",
      "z": 47,
      "parent": "d0e022eb-a366-47d2-8de7-341d16439357",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "86.79245283018868%",
            "rotate": true
          }
        },
        "id": "ff734c35-d03a-47d2-87ed-f39a3e33d278"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "55.55555555555556%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "ff734c35-d03a-47d2-87ed-f39a3e33d278"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "motion.detected",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        }
      ],
      "id": "36f02087-8958-4cf9-8e55-117060dead31",
      "z": 48,
      "parent": "c657162c-aaf7-4760-869e-6731fcbca2ab",
      "vertices": [
        {
          "x": 1274,
          "y": 476
        },
        {
          "x": 1274,
          "y": 510
        },
        {
          "x": 1197,
          "y": 510
        }
      ],
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 32,
        "y": 402
      },
      "size": {
        "width": 672,
        "height": 169
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "z": 49,
      "embeds": [
        "9a36dfb3-d4ca-4cfa-9ab6-0ac319449bfe",
        "cf1f4883-292d-46f9-a24f-0e338b9e2c7f",
        "b0682eb5-ff90-4ea8-8b37-be97a182d53a",
        "f17a37b2-f83c-4320-acdf-ef4e01cfa926",
        "036562ad-a456-413b-ba90-035f3d65d120",
        "89411791-00de-48df-b9c6-f98db3467d33",
        "a2eb38c9-4c56-40f6-91ae-a976acfa0a33",
        "bcdbf5c2-d641-4052-b3c8-2c1e575c596b",
        "dd2455fd-4984-418c-954a-5436c187d4ac",
        "ac780f67-f150-47ea-b520-5a033878658d",
        "da6d330d-9a52-4b1c-87ea-9566e25de3ec",
        "32feccbc-a22c-45b0-8b19-685e874fb9f4"
      ],
      "parent": "278ae822-3bb5-4b3b-b9b1-79f7fe46209b",
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
        "x": 51,
        "y": 494
      },
      "size": {
        "width": 117,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bcdbf5c2-d641-4052-b3c8-2c1e575c596b",
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "z": 57,
      "attrs": {
        "name": {
          "text": "Bright"
        },
        "specification": {
          "text": "entry /\r\nbrightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 548,
        "y": 430
      },
      "size": {
        "width": 117,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "dd2455fd-4984-418c-954a-5436c187d4ac",
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "z": 58,
      "attrs": {
        "name": {
          "text": "Dark"
        },
        "specification": {
          "text": "entry / \r\nbrightness = 10",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 238,
        "y": 430
      },
      "size": {
        "width": 104,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ac780f67-f150-47ea-b520-5a033878658d",
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "z": 59,
      "attrs": {
        "name": {
          "text": "Getting Dark"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 346,
        "y": 494
      },
      "size": {
        "width": 122,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "da6d330d-9a52-4b1c-87ea-9566e25de3ec",
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "z": 60,
      "attrs": {
        "name": {
          "text": "Getting Bright"
        }
      }
    },
    {
      "type": "ShallowHistory",
      "position": {
        "x": 61,
        "y": 436
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "32feccbc-a22c-45b0-8b19-685e874fb9f4",
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "z": 61,
      "embeds": [
        "8bb89c86-dd62-4d3e-9ae5-ef15c6435598"
      ],
      "attrs": {
        "name": {
          "fill": "#555555"
        }
      }
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 61,
        "y": 451
      },
      "id": "8bb89c86-dd62-4d3e-9ae5-ef15c6435598",
      "z": 62,
      "parent": "32feccbc-a22c-45b0-8b19-685e874fb9f4",
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
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "30.43974437005477%",
            "rotate": true
          }
        },
        "id": "da6d330d-9a52-4b1c-87ea-9566e25de3ec"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "8.684371184371129%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "dd2455fd-4984-418c-954a-5436c187d4ac"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "luminosity.dark",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.3069158153123002,
            "offset": -20.13122360978476,
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
      "id": "cf1f4883-292d-46f9-a24f-0e338b9e2c7f",
      "z": 63,
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "vertices": [
        {
          "x": 558.1607142857142,
          "y": 510.133064516129
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
            "dx": "50%",
            "dy": "43.65997159667284%",
            "rotate": true
          }
        },
        "id": "ac780f67-f150-47ea-b520-5a033878658d"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.2572400630653576%",
            "dy": "43.65997159667284%",
            "rotate": true
          }
        },
        "id": "dd2455fd-4984-418c-954a-5436c187d4ac"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after luminosity.delay s",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        }
      ],
      "id": "f17a37b2-f83c-4320-acdf-ef4e01cfa926",
      "z": 63,
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "31.134004884004916%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "dd2455fd-4984-418c-954a-5436c187d4ac"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "77.35849056603774%",
            "rotate": true
          }
        },
        "id": "da6d330d-9a52-4b1c-87ea-9566e25de3ec"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "luminosity.bright",
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
      "id": "b0682eb5-ff90-4ea8-8b37-be97a182d53a",
      "z": 63,
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "vertices": [
        {
          "x": 584.4267857142858,
          "y": 535
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
            "dx": "0.3903200624512144%",
            "dy": "58.76445526475976%",
            "rotate": true
          }
        },
        "id": "da6d330d-9a52-4b1c-87ea-9566e25de3ec"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "58.76445526475976%",
            "rotate": true
          }
        },
        "id": "bcdbf5c2-d641-4052-b3c8-2c1e575c596b"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after luminosity.delay s",
              "fontSize": "9"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "2"
            }
          }
        }
      ],
      "id": "9a36dfb3-d4ca-4cfa-9ab6-0ac319449bfe",
      "z": 63,
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.14278045983141613%",
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "ac780f67-f150-47ea-b520-5a033878658d"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "43.82697938523181%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "bcdbf5c2-d641-4052-b3c8-2c1e575c596b"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "luminosity.bright",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.41683216491738817,
            "offset": 14,
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
      "id": "036562ad-a456-413b-ba90-035f3d65d120",
      "z": 63,
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "vertices": [
        {
          "x": 103.27756588072121,
          "y": 444
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
            "dx": "70.47619047619045%",
            "dy": "88.88888888888914%",
            "rotate": true
          }
        },
        "id": "32feccbc-a22c-45b0-8b19-685e874fb9f4"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "17.58241758241758%",
            "dy": "0.31446540880495993%",
            "rotate": true
          }
        },
        "id": "bcdbf5c2-d641-4052-b3c8-2c1e575c596b"
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
      "id": "a2eb38c9-4c56-40f6-91ae-a976acfa0a33",
      "z": 63,
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.64957264957265%",
            "dy": "0.5249543517954476%",
            "rotate": true
          }
        },
        "id": "bcdbf5c2-d641-4052-b3c8-2c1e575c596b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "49.40657334144857%",
            "rotate": true
          }
        },
        "id": "ac780f67-f150-47ea-b520-5a033878658d"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "luminosity.dark",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.6137615335097633,
            "offset": 11.810000000000004,
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
      "id": "89411791-00de-48df-b9c6-f98db3467d33",
      "z": 63,
      "vertices": [
        {
          "x": 136,
          "y": 456.19
        }
      ],
      "parent": "f786f67b-f82a-44f2-b9ac-c54fbb407874",
      "attrs": {}
    }
  ]
}