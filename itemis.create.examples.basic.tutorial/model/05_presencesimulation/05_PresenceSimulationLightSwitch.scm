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
      "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
      "attrs": {
        "name": {
          "text": "_05_PresenceSimulationLightSwitch"
        },
        "specification": {
          "text": "@EventDriven\n\t\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\ninterface simulation:\n\tvar WAIT_MIN: integer = 5\n\tvar WAIT_MAX: integer = 1200\n\tvar UPDATE_PERIOD : integer = 2\n\n\ninternal:\n\tvar wait_time: integer\n\tvar hour: integer\n\t\n\tevent changePresence\n\tevent startSimulation\n\tevent stopSimulation\n\t\n\toperation get_rand(): real\n\toperation get_hour(): integer\n\t\t\n\t\n\t"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": -397,
        "y": -89
      },
      "size": {
        "width": 1424,
        "height": 860
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "main"
        }
      },
      "id": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b",
      "z": 421,
      "embeds": [
        "9d982e83-2acf-4df2-a91d-d2a503530d03",
        "2dad5e69-4028-4fa8-896a-d75b0e22988f",
        "7c677995-e5c0-4420-a0d5-26c694db9eee",
        "36b8548a-74b1-4925-ae23-291c03231ee6",
        "14a9a50c-4a27-44fb-84c0-b6e437502d70",
        "239550e0-9354-4ea1-9d5a-62a62c88d0a0"
      ]
    },
    {
      "position": {
        "x": -365,
        "y": -53
      },
      "size": {
        "width": 710,
        "height": 291.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Manual",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 422,
      "embeds": [
        "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
      ],
      "parent": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b"
    },
    {
      "position": {
        "x": 433,
        "y": 42
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "14a9a50c-4a27-44fb-84c0-b6e437502d70",
      "z": 423,
      "parent": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b"
    },
    {
      "position": {
        "x": -362,
        "y": -8
      },
      "size": {
        "width": 704,
        "height": 243.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "mode"
        }
      },
      "id": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "z": 423,
      "embeds": [
        "798906f3-0965-441a-9b3e-e9baa822d930",
        "2eb67142-cc7c-4f84-a88f-ae822a9a83f4",
        "d8c7b78a-acdf-4009-bccd-ad6d8b3a18a0",
        "21efbd93-ac43-4985-86f6-05bb6ba7f9be",
        "4c8fcd52-a8e0-444f-875a-0d71329c21c5",
        "1ac667e7-592c-4342-84a7-8dec5cf5a3a3"
      ],
      "parent": "36b8548a-74b1-4925-ae23-291c03231ee6"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "21efbd93-ac43-4985-86f6-05bb6ba7f9be"
      },
      "target": {
        "id": "1ac667e7-592c-4342-84a7-8dec5cf5a3a3",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 5,
            "dy": 31,
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
              "text": "hmi.switch / \nbrightness = 10"
            }
          },
          "position": {
            "distance": 0.5386740433542352,
            "offset": -22,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "798906f3-0965-441a-9b3e-e9baa822d930",
      "z": 424,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "1ac667e7-592c-4342-84a7-8dec5cf5a3a3"
      },
      "target": {
        "id": "21efbd93-ac43-4985-86f6-05bb6ba7f9be",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 175,
            "dy": 62.35040283203125,
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
              "text": "hmi.switch"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "2eb67142-cc7c-4f84-a88f-ae822a9a83f4",
      "z": 425,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "vertices": []
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "4c8fcd52-a8e0-444f-875a-0d71329c21c5"
      },
      "target": {
        "id": "21efbd93-ac43-4985-86f6-05bb6ba7f9be",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 25,
            "dy": 66.35040283203125,
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
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "d8c7b78a-acdf-4009-bccd-ad6d8b3a18a0",
      "z": 426,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
    },
    {
      "position": {
        "x": -325,
        "y": 63.40625
      },
      "size": {
        "height": 79,
        "width": 177
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Off",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry \n    / brightness = 0"
        }
      },
      "id": "21efbd93-ac43-4985-86f6-05bb6ba7f9be",
      "z": 427,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
    },
    {
      "position": {
        "x": -306,
        "y": 179.40625
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "4c8fcd52-a8e0-444f-875a-0d71329c21c5",
      "z": 428,
      "embeds": [
        "40b38423-97be-4f37-be52-9c82142c7a16"
      ],
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": -306,
        "y": 194.40625
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "40b38423-97be-4f37-be52-9c82142c7a16",
      "z": 429,
      "parent": "4c8fcd52-a8e0-444f-875a-0d71329c21c5"
    },
    {
      "position": {
        "x": 16,
        "y": 49.40625
      },
      "size": {
        "height": 103,
        "width": 311
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "On",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "hmi.changeBrightness \n  [brightness > 1] / brightness -= 1 \nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10"
        }
      },
      "id": "1ac667e7-592c-4342-84a7-8dec5cf5a3a3",
      "z": 430,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "14a9a50c-4a27-44fb-84c0-b6e437502d70"
      },
      "target": {
        "x": 611,
        "y": 371,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 703.0000152587891,
            "dy": 107.40621948242188,
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
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "7c677995-e5c0-4420-a0d5-26c694db9eee",
      "z": 455,
      "parent": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b"
    },
    {
      "position": {
        "x": -370,
        "y": 274
      },
      "size": {
        "width": 1380,
        "height": 475.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Presence Simulation",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "\tevery simulation.UPDATE_PERIOD s /  hour = get_hour "
        }
      },
      "id": "239550e0-9354-4ea1-9d5a-62a62c88d0a0",
      "z": 456,
      "embeds": [
        "19e941b6-1719-4c37-a00b-227b02e3c38c"
      ],
      "parent": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b"
    },
    {
      "position": {
        "x": -367,
        "y": 319
      },
      "size": {
        "width": 1374,
        "height": 427.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "mode"
        }
      },
      "id": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "z": 457,
      "embeds": [
        "064582ea-e0ca-444e-961a-ce150dde913a",
        "b912361b-f32d-4773-bcdd-19adea8af7f4",
        "38944a7d-258f-4c5c-80c4-64adbd744ff4",
        "57d6a6e1-4e93-4882-831b-637e170f27e6",
        "6950640b-04c2-4d87-a960-78d5b756815b",
        "1824a94a-38e8-4e75-b7fb-10dd2073fb88"
      ],
      "parent": "239550e0-9354-4ea1-9d5a-62a62c88d0a0"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "1824a94a-38e8-4e75-b7fb-10dd2073fb88"
      },
      "target": {
        "id": "6950640b-04c2-4d87-a960-78d5b756815b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 28,
            "dy": 55.35040283203125,
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
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "064582ea-e0ca-444e-961a-ce150dde913a",
      "z": 458,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "6950640b-04c2-4d87-a960-78d5b756815b"
      },
      "target": {
        "id": "57d6a6e1-4e93-4882-831b-637e170f27e6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 72,
            "dy": 35.111083984375,
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
              "text": "startSimulation"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "b912361b-f32d-4773-bcdd-19adea8af7f4",
      "z": 459,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "57d6a6e1-4e93-4882-831b-637e170f27e6"
      },
      "target": {
        "id": "6950640b-04c2-4d87-a960-78d5b756815b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 238,
            "dy": 73,
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
              "text": "stopSimulation"
            }
          },
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "38944a7d-258f-4c5c-80c4-64adbd744ff4",
      "z": 460,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c"
    },
    {
      "position": {
        "x": 86,
        "y": 368.40625
      },
      "size": {
        "width": 892.9999999999999,
        "height": 370.40625
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Active",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "57d6a6e1-4e93-4882-831b-637e170f27e6",
      "z": 461,
      "embeds": [
        "505fd101-0e42-4036-8edd-3dfdccf6ede0",
        "8924389e-6226-42f3-a304-0d9d49b66264"
      ],
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c"
    },
    {
      "position": {
        "x": 89,
        "y": 413.40625
      },
      "size": {
        "width": 542.9999999999999,
        "height": 322.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "text": "schedule"
        }
      },
      "id": "505fd101-0e42-4036-8edd-3dfdccf6ede0",
      "z": 462,
      "embeds": [
        "1bae6be0-ec27-4026-9b5b-ad5550febdc2",
        "8a6b0756-aea3-47b7-8319-de4deb112c34",
        "ab29ecab-4681-454a-b4cc-ba1ce14c417f"
      ],
      "parent": "57d6a6e1-4e93-4882-831b-637e170f27e6"
    },
    {
      "position": {
        "x": 631.9999999999999,
        "y": 413.40625
      },
      "size": {
        "width": 344,
        "height": 322.40625
      },
      "type": "Region",
      "attrs": {
        "priority": {
          "text": 2
        },
        "name": {
          "text": "presence"
        }
      },
      "id": "8924389e-6226-42f3-a304-0d9d49b66264",
      "z": 462,
      "embeds": [
        "9c7bf01b-bb4a-43c7-b966-8f021f657891",
        "88ee445a-45fe-42b9-9e62-30650aeb0d4a",
        "e000a7b0-80bf-47a6-a44b-058fcdd4463d",
        "3ce3d085-1c16-4cc4-920c-7719a22f43ee",
        "63214031-4bc7-45be-92f9-1dcc6f898005",
        "c4399a63-d0e5-47b8-b2df-255f73dae12c"
      ],
      "parent": "57d6a6e1-4e93-4882-831b-637e170f27e6"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "ab29ecab-4681-454a-b4cc-ba1ce14c417f"
      },
      "target": {
        "id": "8a6b0756-aea3-47b7-8319-de4deb112c34",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 64,
            "dy": 24.350341796875,
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
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "1bae6be0-ec27-4026-9b5b-ad5550febdc2",
      "z": 463,
      "parent": "505fd101-0e42-4036-8edd-3dfdccf6ede0"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "63214031-4bc7-45be-92f9-1dcc6f898005"
      },
      "target": {
        "id": "c4399a63-d0e5-47b8-b2df-255f73dae12c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 100,
            "dy": 7.350341796875,
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
              "text": "changePresence"
            }
          },
          "position": {
            "distance": 0.43043478260869567,
            "offset": -56,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "9c7bf01b-bb4a-43c7-b966-8f021f657891",
      "z": 463,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264"
    },
    {
      "position": {
        "x": 158,
        "y": 475.109375
      },
      "size": {
        "height": 211.5625,
        "width": 438
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Waiting",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\n  wait_time =\n    (simulation.WAIT_MIN \n      + get_rand() \n        * (simulation.WAIT_MAX - simulation.WAIT_MIN)\n    ) as integer\n\nalways [ !(hour > 17 || (hour > 7 && hour < 10)) ]  \n\t/ raise stopSimulation\n\nafter wait_time s / raise changePresence"
        }
      },
      "id": "8a6b0756-aea3-47b7-8319-de4deb112c34",
      "z": 464,
      "parent": "505fd101-0e42-4036-8edd-3dfdccf6ede0"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "c4399a63-d0e5-47b8-b2df-255f73dae12c"
      },
      "target": {
        "id": "63214031-4bc7-45be-92f9-1dcc6f898005",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 65,
            "dy": 59.5,
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
              "text": "changePresence"
            }
          },
          "position": {
            "distance": 0.5695652173913044,
            "offset": -68,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "88ee445a-45fe-42b9-9e62-30650aeb0d4a",
      "z": 464,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264"
    },
    {
      "position": {
        "x": 102,
        "y": 490.8125
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "ab29ecab-4681-454a-b4cc-ba1ce14c417f",
      "z": 465,
      "parent": "505fd101-0e42-4036-8edd-3dfdccf6ede0"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "3ce3d085-1c16-4cc4-920c-7719a22f43ee"
      },
      "target": {
        "id": "63214031-4bc7-45be-92f9-1dcc6f898005",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 3.642822265625,
            "dy": 28.5,
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
          "attrs": {},
          "position": {}
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "e000a7b0-80bf-47a6-a44b-058fcdd4463d",
      "z": 465,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264"
    },
    {
      "position": {
        "x": 652.155087741544,
        "y": 490.8125
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
      "id": "3ce3d085-1c16-4cc4-920c-7719a22f43ee",
      "z": 466,
      "embeds": [
        "5b62bae0-3fdf-44f1-bac4-b5d1c3cff8e7"
      ],
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 652.155087741544,
        "y": 505.8125
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "5b62bae0-3fdf-44f1-bac4-b5d1c3cff8e7",
      "z": 467,
      "parent": "3ce3d085-1c16-4cc4-920c-7719a22f43ee"
    },
    {
      "position": {
        "x": 723.155087741544,
        "y": 475.109375
      },
      "size": {
        "height": 60,
        "width": 191
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Absent",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0"
        }
      },
      "id": "63214031-4bc7-45be-92f9-1dcc6f898005",
      "z": 468,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264"
    },
    {
      "position": {
        "x": 723.155087741544,
        "y": 626.671875
      },
      "size": {
        "height": 60,
        "width": 191
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Present",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 10"
        }
      },
      "id": "c4399a63-d0e5-47b8-b2df-255f73dae12c",
      "z": 469,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264"
    },
    {
      "position": {
        "x": -310,
        "y": 368.40625
      },
      "size": {
        "height": 115,
        "width": 241
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "Idle",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0\n\n[ hour > 17 \n  || (hour > 7 && hour < 10) \n] / raise startSimulation"
        }
      },
      "id": "6950640b-04c2-4d87-a960-78d5b756815b",
      "z": 474,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c"
    },
    {
      "position": {
        "x": -289,
        "y": 543.203125
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Entry",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "1824a94a-38e8-4e75-b7fb-10dd2073fb88",
      "z": 475,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "239550e0-9354-4ea1-9d5a-62a62c88d0a0",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 546,
            "dy": 22.35040283203125,
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
              "text": "hmi.toggleMode"
            }
          },
          "position": {
            "distance": 0.4420289855072464,
            "offset": -63,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "9d982e83-2acf-4df2-a91d-d2a503530d03",
      "z": 476,
      "parent": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "239550e0-9354-4ea1-9d5a-62a62c88d0a0"
      },
      "target": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 363,
            "dy": 34,
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
              "text": "hmi.toggleMode"
            }
          },
          "position": {
            "distance": 0.5289855072463768,
            "offset": -63,
            "angle": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
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
      "id": "2dad5e69-4028-4fa8-896a-d75b0e22988f",
      "z": 476,
      "vertices": [],
      "parent": "6a10cd10-3ff7-4f19-b2bb-d6c473756b9b"
    }
  ]
}