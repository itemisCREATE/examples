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
      "id": "835f6fbe-a4b3-4705-a4df-182a7b377603",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "LightSwitch"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninternal:\n\tvar brightness: integer\n\t\ninterface user:\n\tin event on_button\n\tin event off_button\n\tin event mode_button\n\t\ninterface sensor:\n\tin event motion\n\t\ninterface lum_sensor:\n \tin event bright\n \tin event dark"
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
        "width": 1204,
        "height": 560
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "z": 2,
      "embeds": [
        "3a75bc1c-52d9-42eb-8e4c-349df626af14",
        "6dfb85d1-173c-4abd-a31a-0972a0213968",
        "4f08040a-1618-41c2-b01b-24d368178a6d",
        "c4be5617-4112-4cd4-8864-21df92f99343",
        "9e3ad33b-bbd7-424f-9168-111d646c3e57",
        "f44779d7-da73-4685-9f51-bada251d825a"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": "9",
          "text": "main region"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 36,
        "y": 84
      },
      "size": {
        "width": 1118,
        "height": 306
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "c4be5617-4112-4cd4-8864-21df92f99343",
      "parent": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "z": 4,
      "embeds": [
        "7ded07df-840f-454b-92cc-1c70444b682c"
      ],
      "attrs": {
        "body": {
          "fill": "#F5D82C",
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "AutomaticMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 36,
        "y": 124
      },
      "size": {
        "width": 1116,
        "height": 265
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "7ded07df-840f-454b-92cc-1c70444b682c",
      "z": 5,
      "parent": "c4be5617-4112-4cd4-8864-21df92f99343",
      "embeds": [
        "c42df543-c1e2-4fa8-acbd-55e49aff2bf5",
        "d2406335-80dd-410d-8fa8-db1ad15cd7b0",
        "c5c4079a-e18f-464f-9f34-97b7b6bf1650",
        "bd48ee95-5e61-4553-89db-d38460d4b218",
        "92bc1788-79db-4ea6-bf07-286f7a7bb50b",
        "e1f5d3b8-c903-444b-9dab-5990626b15b5"
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
        "x": 61,
        "y": 171
      },
      "size": {
        "width": 461,
        "height": 198
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bd48ee95-5e61-4553-89db-d38460d4b218",
      "parent": "7ded07df-840f-454b-92cc-1c70444b682c",
      "z": 6,
      "embeds": [
        "02fdd10b-dfd4-4f39-b1db-a16d8097f781"
      ],
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 62,
        "y": 211
      },
      "size": {
        "width": 459,
        "height": 157
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "z": 7,
      "parent": "bd48ee95-5e61-4553-89db-d38460d4b218",
      "embeds": [
        "b41d9b40-a4e9-44a0-931f-c46d51f9357e",
        "d209a21d-0c0a-4879-85db-a8d079e27802",
        "0d60d0d1-fa2a-49ab-8344-de12a641ec88",
        "f9c8e2b8-e1bb-4dca-84d2-81c7bd3d9658",
        "025152a7-c108-45fa-ae15-9ee87921d5e8",
        "9fc745c6-592a-4d07-96a3-2180f8c63353"
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
        "x": 122,
        "y": 260
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f9c8e2b8-e1bb-4dca-84d2-81c7bd3d9658",
      "parent": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "z": 8,
      "attrs": {
        "name": {
          "text": "Idle"
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
        "x": 342,
        "y": 260
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "025152a7-c108-45fa-ae15-9ee87921d5e8",
      "parent": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "z": 9,
      "attrs": {
        "name": {
          "text": "TwilightDetected"
        },
        "specification": {
          "text": "entry / brightness = 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 77,
        "y": 273
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "9fc745c6-592a-4d07-96a3-2180f8c63353",
      "parent": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "z": 10,
      "embeds": [
        "fd57b6c0-6665-4c1d-ae29-ffba4515f1ff"
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
        "x": 77,
        "y": 288
      },
      "id": "fd57b6c0-6665-4c1d-ae29-ffba4515f1ff",
      "z": 11,
      "parent": "9fc745c6-592a-4d07-96a3-2180f8c63353",
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
        "x": 641,
        "y": 169
      },
      "size": {
        "width": 493,
        "height": 204
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "92bc1788-79db-4ea6-bf07-286f7a7bb50b",
      "parent": "7ded07df-840f-454b-92cc-1c70444b682c",
      "z": 12,
      "embeds": [
        "cec79be6-18c6-497b-8fea-2ccb87b4a42b"
      ],
      "attrs": {
        "body": {
          "fill": "#F5D82C",
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "MotionDetectionMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 642,
        "y": 209
      },
      "size": {
        "width": 491,
        "height": 163
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "z": 13,
      "parent": "92bc1788-79db-4ea6-bf07-286f7a7bb50b",
      "embeds": [
        "f9137752-b456-435d-b129-ed03fd97ffe8",
        "794a799f-3826-4427-864b-b04d0780d698",
        "ba687d5c-f250-45e0-9d04-3577c632a261",
        "6d0fdaa3-9fd4-46b6-b77b-97a1f1074e12",
        "22f90178-eae7-4489-badc-0ce41f65a213",
        "2c0c5823-9054-4a81-baf2-bf005c2d3f34",
        "66186c10-ca44-414e-83c2-5982ec22f19e"
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
        "x": 685,
        "y": 258
      },
      "size": {
        "width": 157,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "22f90178-eae7-4489-badc-0ce41f65a213",
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "z": 14,
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Idle"
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
        "x": 937,
        "y": 258
      },
      "size": {
        "width": 157,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2c0c5823-9054-4a81-baf2-bf005c2d3f34",
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "z": 15,
      "attrs": {
        "body": {
          "fill": "#F5D82C",
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "MotionDetected"
        },
        "specification": {
          "text": "entry / brightness = 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 717,
        "y": 131
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "e1f5d3b8-c903-444b-9dab-5990626b15b5",
      "parent": "7ded07df-840f-454b-92cc-1c70444b682c",
      "z": 18,
      "embeds": [
        "88b612f1-d078-4227-9c20-849e8fd687a7"
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
        "x": 717,
        "y": 146
      },
      "id": "88b612f1-d078-4227-9c20-849e8fd687a7",
      "z": 19,
      "parent": "e1f5d3b8-c903-444b-9dab-5990626b15b5",
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
      "type": "Entry",
      "position": {
        "x": 149,
        "y": 34
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "9e3ad33b-bbd7-424f-9168-111d646c3e57",
      "parent": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "z": 20,
      "embeds": [
        "ff8762af-27b8-43ab-9871-9b3a4e11af7e"
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
        "x": 149,
        "y": 49
      },
      "id": "ff8762af-27b8-43ab-9871-9b3a4e11af7e",
      "z": 21,
      "parent": "9e3ad33b-bbd7-424f-9168-111d646c3e57",
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
            "dy": "22.641509433962266%",
            "rotate": true
          }
        },
        "id": "22f90178-eae7-4489-badc-0ce41f65a213"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.3300835943975332%",
            "dy": "22.641509433962266%",
            "rotate": true
          }
        },
        "id": "2c0c5823-9054-4a81-baf2-bf005c2d3f34"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "sensor.motion",
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
      "id": "6d0fdaa3-9fd4-46b6-b77b-97a1f1074e12",
      "z": 22,
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "32.72128044177371%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "2c0c5823-9054-4a81-baf2-bf005c2d3f34"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "55.538778704552314%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "22f90178-eae7-4489-badc-0ce41f65a213"
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
      "id": "ba687d5c-f250-45e0-9d04-3577c632a261",
      "z": 23,
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "vertices": [
        {
          "x": 988.3724102935847,
          "y": 336
        },
        {
          "x": 772.1958825661471,
          "y": 336
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
            "dx": "94.8140538319294%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "2c0c5823-9054-4a81-baf2-bf005c2d3f34"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "60.41914937333067%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "2c0c5823-9054-4a81-baf2-bf005c2d3f34"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "sensor.motion",
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
      "id": "794a799f-3826-4427-864b-b04d0780d698",
      "z": 26,
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "vertices": [
        {
          "x": 1085.8580645161292,
          "y": 338
        },
        {
          "x": 1031.8580645161292,
          "y": 338
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
            "dx": "89.12470023980816%",
            "dy": "58.1761006289309%",
            "rotate": true
          }
        },
        "id": "f9c8e2b8-e1bb-4dca-84d2-81c7bd3d9658"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.375299760191886%",
            "dy": "58.1761006289309%",
            "rotate": true
          }
        },
        "id": "025152a7-c108-45fa-ae15-9ee87921d5e8"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "lum_sensor.dark",
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
      "id": "0d60d0d1-fa2a-49ab-8344-de12a641ec88",
      "z": 27,
      "parent": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "56.381402340813935%",
            "dy": "98.49056603773593%",
            "rotate": true
          }
        },
        "id": "025152a7-c108-45fa-ae15-9ee87921d5e8"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "39.32567378932674%",
            "dy": "99.62264150943399%",
            "rotate": true
          }
        },
        "id": "f9c8e2b8-e1bb-4dca-84d2-81c7bd3d9658"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "lum_sensor.bright",
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
      "id": "d209a21d-0c0a-4879-85db-a8d079e27802",
      "z": 28,
      "parent": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "vertices": [
        {
          "x": 420.37014925373137,
          "y": 332.4
        },
        {
          "x": 176.66268656716417,
          "y": 332.4
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
            "dy": "30.053447062983203%",
            "rotate": true
          }
        },
        "id": "bd48ee95-5e61-4553-89db-d38460d4b218"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.03457812390638491%",
            "dy": "30.14991430622879%",
            "rotate": true
          }
        },
        "id": "92bc1788-79db-4ea6-bf07-286f7a7bb50b"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.mode_button",
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
      "id": "c5c4079a-e18f-464f-9f34-97b7b6bf1650",
      "z": 29,
      "parent": "7ded07df-840f-454b-92cc-1c70444b682c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.15330697946914143%",
            "dy": "16.348717764819437%",
            "rotate": true
          }
        },
        "id": "92bc1788-79db-4ea6-bf07-286f7a7bb50b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "15.83403244456144%",
            "rotate": true
          }
        },
        "id": "bd48ee95-5e61-4553-89db-d38460d4b218"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.mode_button",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.48739495798319327,
            "offset": -37.650000000000006,
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
      "id": "d2406335-80dd-410d-8fa8-db1ad15cd7b0",
      "z": 30,
      "parent": "7ded07df-840f-454b-92cc-1c70444b682c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "94.24543946932015%",
            "dy": "48.88888888888914%",
            "rotate": true
          }
        },
        "id": "9fc745c6-592a-4d07-96a3-2180f8c63353"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "38.36477987421391%",
            "rotate": true
          }
        },
        "id": "f9c8e2b8-e1bb-4dca-84d2-81c7bd3d9658"
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
      "id": "b41d9b40-a4e9-44a0-931f-c46d51f9357e",
      "z": 32,
      "parent": "02fdd10b-dfd4-4f39-b1db-a16d8097f781",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "49.72882331416107%",
            "dy": "96.36363636363645%",
            "rotate": true
          }
        },
        "id": "e1f5d3b8-c903-444b-9dab-5990626b15b5"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.92886886351403%",
            "dy": "0.20053475935830145%",
            "rotate": true
          }
        },
        "id": "92bc1788-79db-4ea6-bf07-286f7a7bb50b"
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
      "id": "c42df543-c1e2-4fa8-acbd-55e49aff2bf5",
      "z": 34,
      "parent": "7ded07df-840f-454b-92cc-1c70444b682c",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 531,
        "y": 446
      },
      "size": {
        "width": 144,
        "height": 62
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f44779d7-da73-4685-9f51-bada251d825a",
      "z": 36,
      "parent": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "embeds": [
        "fbae5ca5-424d-406b-bcbe-968a8d5b7213"
      ],
      "attrs": {
        "name": {
          "text": "ManualMode"
        },
        "specification": {
          "text": "entry / brightness += 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "f44779d7-da73-4685-9f51-bada251d825a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "74.98373599259793%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "f44779d7-da73-4685-9f51-bada251d825a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "29.913313457386657%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.on_button [brightness < 10]",
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
      "id": "fbae5ca5-424d-406b-bcbe-968a8d5b7213",
      "z": 37,
      "vertices": [
        {
          "x": 638.98,
          "y": 526
        },
        {
          "x": 574.08,
          "y": 526
        }
      ],
      "parent": "f44779d7-da73-4685-9f51-bada251d825a",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "31.987731707884425%",
            "dy": "0.3001517250478144%",
            "rotate": true
          }
        },
        "id": "f44779d7-da73-4685-9f51-bada251d825a"
      },
      "target": {
        "id": "c4be5617-4112-4cd4-8864-21df92f99343",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "48%",
            "dy": "27%",
            "rotate": true
          }
        }
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.off_button",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.44,
            "offset": -61.419999999999966,
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
      "id": "4f08040a-1618-41c2-b01b-24d368178a6d",
      "z": 37,
      "parent": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.3928248663087%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "c4be5617-4112-4cd4-8864-21df92f99343"
      },
      "target": {
        "id": "f44779d7-da73-4685-9f51-bada251d825a"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.on_button",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.4,
            "offset": -59.919999999999966,
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
      "id": "6dfb85d1-173c-4abd-a31a-0972a0213968",
      "z": 38,
      "parent": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "49.434346879771354%",
            "dy": "96.53715064758008%",
            "rotate": true
          }
        },
        "id": "9e3ad33b-bbd7-424f-9168-111d646c3e57"
      },
      "target": {
        "id": "c4be5617-4112-4cd4-8864-21df92f99343"
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
      "id": "3a75bc1c-52d9-42eb-8e4c-349df626af14",
      "z": 39,
      "parent": "8c2fb755-a4cc-4cec-b172-ecdec8552a2f",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 685,
        "y": 211
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "66186c10-ca44-414e-83c2-5982ec22f19e",
      "z": 46,
      "embeds": [
        "9d562030-7aff-496e-954e-3ca1443c5d64"
      ],
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
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
        "x": 685,
        "y": 226
      },
      "id": "9d562030-7aff-496e-954e-3ca1443c5d64",
      "z": 47,
      "parent": "66186c10-ca44-414e-83c2-5982ec22f19e",
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
        "id": "66186c10-ca44-414e-83c2-5982ec22f19e"
      },
      "target": {
        "id": "22f90178-eae7-4489-badc-0ce41f65a213"
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
      "id": "f9137752-b456-435d-b129-ed03fd97ffe8",
      "z": 48,
      "parent": "cec79be6-18c6-497b-8fea-2ccb87b4a42b",
      "attrs": {}
    }
  ]
}