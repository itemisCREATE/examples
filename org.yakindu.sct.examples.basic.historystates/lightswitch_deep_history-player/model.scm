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
      "id": "1d350dda-03cf-4aae-9d64-11e330724541",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "LightSwitch_Deep_History"
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
        "width": 1275,
        "height": 625
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "z": 2,
      "embeds": [
        "552b5e84-04f1-43ab-af9a-bb85363f894e",
        "e00f83fd-15e3-484a-a775-742a7534174e",
        "6ed50a25-4a0b-4b56-ac4d-55b43daf10de",
        "5e31d1b5-c278-4356-8454-194f2419a913",
        "05c9b5c2-709b-434f-ab8d-27370ee3cb84",
        "1a3218a8-48ef-4e4d-a6a3-6c13e7ddb64f",
        "3a6adaf5-2143-4174-a75d-8b10c80ee021"
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
        "x": 533,
        "y": 491
      },
      "size": {
        "width": 142,
        "height": 62
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "05c9b5c2-709b-434f-ab8d-27370ee3cb84",
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "z": 3,
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
      "type": "State",
      "position": {
        "x": 17,
        "y": 83
      },
      "size": {
        "width": 1208,
        "height": 336
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "1a3218a8-48ef-4e4d-a6a3-6c13e7ddb64f",
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "z": 4,
      "embeds": [
        "5b921f50-4a71-46bc-b720-61db59b2b17c"
      ],
      "attrs": {
        "name": {
          "text": "AutomaticMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 18,
        "y": 123
      },
      "size": {
        "width": 1206,
        "height": 295
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "z": 5,
      "parent": "1a3218a8-48ef-4e4d-a6a3-6c13e7ddb64f",
      "embeds": [
        "5f666b70-050a-4573-bdbe-d9f8c96fef37",
        "1bb51cbf-6a43-40a2-b042-3ba3930e415c",
        "2a9747dd-93b9-4a4a-a902-c0c70f6a6767",
        "cd21cfa5-b802-46a0-aa47-747a17120b86",
        "04213d82-3642-4b3c-8170-406bb993c05e",
        "e889c5f1-af91-4d91-83dd-30e672addb84"
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
        "x": 41,
        "y": 187
      },
      "size": {
        "width": 467,
        "height": 178
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "cd21cfa5-b802-46a0-aa47-747a17120b86",
      "parent": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "z": 6,
      "embeds": [
        "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac"
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
        "x": 42,
        "y": 227
      },
      "size": {
        "width": 465,
        "height": 137
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
      "z": 7,
      "parent": "cd21cfa5-b802-46a0-aa47-747a17120b86",
      "embeds": [
        "0dd9c41d-6a57-45ef-9aed-fc22041ebcb2",
        "0ea258f9-145c-45b5-8000-9a2c031e1023",
        "e65f10e9-2b77-42aa-958f-a3d4fceec909",
        "fcb2ff9f-e851-48df-8f91-b4675ba737c0",
        "0c275457-ae4c-4db4-8c6b-18b8195e9a47",
        "3fdf1a92-cb3b-4561-924d-3af2b7680e19"
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
        "x": 102,
        "y": 276
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "fcb2ff9f-e851-48df-8f91-b4675ba737c0",
      "parent": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
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
        "x": 322,
        "y": 276
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "0c275457-ae4c-4db4-8c6b-18b8195e9a47",
      "parent": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
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
        "x": 57,
        "y": 289
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "3fdf1a92-cb3b-4561-924d-3af2b7680e19",
      "parent": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
      "z": 10,
      "embeds": [
        "d866c07d-2036-482c-836e-4dd1b9b31389"
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
        "x": 57,
        "y": 304
      },
      "id": "d866c07d-2036-482c-836e-4dd1b9b31389",
      "z": 11,
      "parent": "3fdf1a92-cb3b-4561-924d-3af2b7680e19",
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
        "x": 654,
        "y": 191
      },
      "size": {
        "width": 531,
        "height": 198
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "04213d82-3642-4b3c-8170-406bb993c05e",
      "parent": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "z": 12,
      "embeds": [
        "f41e2e60-e027-49f9-846d-3756e06d905b"
      ],
      "attrs": {
        "name": {
          "text": "MotionDetectionMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 655,
        "y": 231
      },
      "size": {
        "width": 529,
        "height": 157
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "z": 13,
      "parent": "04213d82-3642-4b3c-8170-406bb993c05e",
      "embeds": [
        "00464ad9-f9a5-44e5-8799-a9b7e9e0d620",
        "fa1fd841-b052-4330-b4a3-06387e63972c",
        "008952f7-25e5-4c60-85f8-d3334548bc74",
        "07983b61-15cc-4851-9f26-ba90d8cb62ce",
        "8523eae5-21fd-4a0b-ae63-02a22df9843d",
        "d0da9c32-d170-4291-9c15-caacf5c0a2eb",
        "d6dbac91-34ea-4ee8-aa0d-79d145dd753a"
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
        "x": 715,
        "y": 280
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8523eae5-21fd-4a0b-ae63-02a22df9843d",
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "z": 14,
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
        "x": 934,
        "y": 280
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d0da9c32-d170-4291-9c15-caacf5c0a2eb",
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "z": 15,
      "attrs": {
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
        "x": 676,
        "y": 293
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "d6dbac91-34ea-4ee8-aa0d-79d145dd753a",
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "z": 16,
      "embeds": [
        "173cdec2-da00-4804-bd18-e5244771a7bc"
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
        "x": 676,
        "y": 308
      },
      "id": "173cdec2-da00-4804-bd18-e5244771a7bc",
      "z": 17,
      "parent": "d6dbac91-34ea-4ee8-aa0d-79d145dd753a",
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
      "type": "DeepHistory",
      "position": {
        "x": 697,
        "y": 149
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "e889c5f1-af91-4d91-83dd-30e672addb84",
      "parent": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "z": 18,
      "embeds": [
        "b5b3ffdd-8f3a-4beb-aeef-4cb6ecf5df21"
      ],
      "attrs": {
        "name": {
          "fill": "#333333"
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
        "x": 697,
        "y": 164
      },
      "id": "b5b3ffdd-8f3a-4beb-aeef-4cb6ecf5df21",
      "z": 19,
      "parent": "e889c5f1-af91-4d91-83dd-30e672addb84",
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
        "x": 81,
        "y": 39
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "3a6adaf5-2143-4174-a75d-8b10c80ee021",
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "z": 20,
      "embeds": [
        "2f633c76-3b14-47d3-8489-dd142461451a"
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
        "x": 81,
        "y": 54
      },
      "id": "2f633c76-3b14-47d3-8489-dd142461451a",
      "z": 21,
      "parent": "3a6adaf5-2143-4174-a75d-8b10c80ee021",
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
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "8523eae5-21fd-4a0b-ae63-02a22df9843d"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.3574706019888962%",
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "d0da9c32-d170-4291-9c15-caacf5c0a2eb"
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
      "id": "07983b61-15cc-4851-9f26-ba90d8cb62ce",
      "z": 22,
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "40.51122682861331%",
            "dy": "98.49056603773593%",
            "rotate": true
          }
        },
        "id": "d0da9c32-d170-4291-9c15-caacf5c0a2eb"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "43.22149877053773%",
            "dy": "99.62264150943399%",
            "rotate": true
          }
        },
        "id": "8523eae5-21fd-4a0b-ae63-02a22df9843d"
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
      "id": "008952f7-25e5-4c60-85f8-d3334548bc74",
      "z": 23,
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "vertices": [
        {
          "x": 990.3106052917725,
          "y": 357.4
        },
        {
          "x": 775.0778832910474,
          "y": 357.4
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
            "dx": "28.51116077394466%",
            "dy": "0.45517514347915455%",
            "rotate": true
          }
        },
        "id": "05c9b5c2-709b-434f-ab8d-27370ee3cb84"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "46.06670929627495%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "1a3218a8-48ef-4e4d-a6a3-6c13e7ddb64f"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.off_button",
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
      "id": "5e31d1b5-c278-4356-8454-194f2419a913",
      "z": 24,
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "74.98373599259793%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "05c9b5c2-709b-434f-ab8d-27370ee3cb84"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "29.913313457386657%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "05c9b5c2-709b-434f-ab8d-27370ee3cb84"
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
      "id": "6ed50a25-4a0b-4b56-ac4d-55b43daf10de",
      "z": 25,
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "vertices": [
        {
          "x": 639.476905109489,
          "y": 593
        },
        {
          "x": 575.476905109489,
          "y": 593
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
            "dy": "75.47169811320755%",
            "rotate": true
          }
        },
        "id": "d0da9c32-d170-4291-9c15-caacf5c0a2eb"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "96.50034810860996%",
            "dy": "92.45283018867924%",
            "rotate": true
          }
        },
        "id": "d0da9c32-d170-4291-9c15-caacf5c0a2eb"
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
      "id": "fa1fd841-b052-4330-b4a3-06387e63972c",
      "z": 26,
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "vertices": [
        {
          "x": 1140.1354838709678,
          "y": 320
        },
        {
          "x": 1140.1354838709678,
          "y": 353
        },
        {
          "x": 1068.1354838709678,
          "y": 353
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
        "id": "fcb2ff9f-e851-48df-8f91-b4675ba737c0"
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
        "id": "0c275457-ae4c-4db4-8c6b-18b8195e9a47"
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
      "id": "e65f10e9-2b77-42aa-958f-a3d4fceec909",
      "z": 27,
      "parent": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
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
        "id": "0c275457-ae4c-4db4-8c6b-18b8195e9a47"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "39.32567378932674%",
            "dy": "99.62264150943388%",
            "rotate": true
          }
        },
        "id": "fcb2ff9f-e851-48df-8f91-b4675ba737c0"
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
      "id": "0ea258f9-145c-45b5-8000-9a2c031e1023",
      "z": 28,
      "parent": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
      "vertices": [
        {
          "x": 400.37014925373137,
          "y": 348.4
        },
        {
          "x": 156.66268656716417,
          "y": 348.4
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
            "dy": "36.96613239409154%",
            "rotate": true
          }
        },
        "id": "cd21cfa5-b802-46a0-aa47-747a17120b86"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.017134164975107946%",
            "dy": "31.211977606809565%",
            "rotate": true
          }
        },
        "id": "04213d82-3642-4b3c-8170-406bb993c05e"
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
      "id": "2a9747dd-93b9-4a4a-a902-c0c70f6a6767",
      "z": 29,
      "parent": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.10493515937317902%",
            "dy": "17.38701692537912%",
            "rotate": true
          }
        },
        "id": "04213d82-3642-4b3c-8170-406bb993c05e"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "21.58780534396104%",
            "rotate": true
          }
        },
        "id": "cd21cfa5-b802-46a0-aa47-747a17120b86"
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
      "id": "1bb51cbf-6a43-40a2-b042-3ba3930e415c",
      "z": 30,
      "parent": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50.280303746567924%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "1a3218a8-48ef-4e4d-a6a3-6c13e7ddb64f"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "64.35638680178909%",
            "dy": "0.3727158783560973%",
            "rotate": true
          }
        },
        "id": "05c9b5c2-709b-434f-ab8d-27370ee3cb84"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.on_button",
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
      "id": "e00f83fd-15e3-484a-a775-742a7534174e",
      "z": 31,
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "92.02321724709786%",
            "dy": "60%",
            "rotate": true
          }
        },
        "id": "3fdf1a92-cb3b-4561-924d-3af2b7680e19"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "8.710046887862847%",
            "dy": "41.509433962264154%",
            "rotate": true
          }
        },
        "id": "fcb2ff9f-e851-48df-8f91-b4675ba737c0"
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
      "id": "0dd9c41d-6a57-45ef-9aed-fc22041ebcb2",
      "z": 32,
      "parent": "be497a1a-ba40-4ba7-b4f9-bbcaee3f12ac",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "98.27529021558878%",
            "dy": "53.333333333333336%",
            "rotate": true
          }
        },
        "id": "d6dbac91-34ea-4ee8-aa0d-79d145dd753a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "5.02344393142204%",
            "dy": "39.62264150943396%",
            "rotate": true
          }
        },
        "id": "8523eae5-21fd-4a0b-ae63-02a22df9843d"
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
      "id": "00464ad9-f9a5-44e5-8799-a9b7e9e0d620",
      "z": 33,
      "parent": "f41e2e60-e027-49f9-846d-3756e06d905b",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "57.52401321126324%",
            "dy": "88.88888888888896%",
            "rotate": true
          }
        },
        "id": "e889c5f1-af91-4d91-83dd-30e672addb84"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "9.722900561523444%",
            "dy": "0.08417508417509374%",
            "rotate": true
          }
        },
        "id": "04213d82-3642-4b3c-8170-406bb993c05e"
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
      "id": "5f666b70-050a-4573-bdbe-d9f8c96fef37",
      "z": 34,
      "parent": "5b921f50-4a71-46bc-b720-61db59b2b17c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "97.0873804805683%",
            "dy": "49.42229038854805%",
            "rotate": true
          }
        },
        "id": "3a6adaf5-2143-4174-a75d-8b10c80ee021"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "11.641242892729345%",
            "dy": "0.07143770084720895%",
            "rotate": true
          }
        },
        "id": "1a3218a8-48ef-4e4d-a6a3-6c13e7ddb64f"
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
      "id": "552b5e84-04f1-43ab-af9a-bb85363f894e",
      "z": 35,
      "parent": "53eecf17-baef-4a8e-96cb-ebe112ec4acd",
      "vertices": [
        {
          "x": 157.6262141441705,
          "y": 46.41334355828221
        }
      ],
      "attrs": {}
    }
  ]
}