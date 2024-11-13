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
      "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "MyStatechart"
        },
        "specification": {
          "text": "@EventDriven\n\t\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\ninterface simulation:\n\tvar WAIT_MIN: integer = 5\n\tvar WAIT_MAX: integer = 1200\n\tvar UPDATE_PERIOD : integer = 2\n\n\ninternal:\n\tvar wait_time: integer\n\tvar hour: integer\n\t\n\tevent changePresence\n\tevent startSimulation\n\tevent stopSimulation\n\t\n\toperation get_rand(): real\n\toperation get_hour(): integer\n\t\t\n\t\n\t"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -93,
        "y": 225
      },
      "size": {
        "height": 283,
        "width": 706
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 63,
      "embeds": [
        "4759ac2c-c1f9-4481-9c99-89d752b6bc3c"
      ],
      "attrs": {
        "name": {
          "text": "Manual",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": -94,
        "y": 577
      },
      "size": {
        "height": 503,
        "width": 1373
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "239550e0-9354-4ea1-9d5a-62a62c88d0a0",
      "z": 84,
      "embeds": [
        "19e941b6-1719-4c37-a00b-227b02e3c38c"
      ],
      "attrs": {
        "name": {
          "text": "Presence Simulation",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "\tevery simulation.UPDATE_PERIOD s /  hour = get_hour "
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": -92,
        "y": 263.59375
      },
      "size": {
        "height": 243.40625,
        "width": 704
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "z": 87,
      "embeds": [
        "798906f3-0965-441a-9b3e-e9baa822d930",
        "2eb67142-cc7c-4f84-a88f-ae822a9a83f4",
        "d8c7b78a-acdf-4009-bccd-ad6d8b3a18a0",
        "21efbd93-ac43-4985-86f6-05bb6ba7f9be",
        "4c8fcd52-a8e0-444f-875a-0d71329c21c5",
        "1ac667e7-592c-4342-84a7-8dec5cf5a3a3"
      ],
      "parent": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -55,
        "y": 335
      },
      "size": {
        "height": 79,
        "width": 177
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "21efbd93-ac43-4985-86f6-05bb6ba7f9be",
      "z": 88,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "attrs": {
        "name": {
          "text": "Off",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry \n    / brightness = 0"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": -36,
        "y": 451
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "4c8fcd52-a8e0-444f-875a-0d71329c21c5",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 89,
      "embeds": [
        "40b38423-97be-4f37-be52-9c82142c7a16"
      ],
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 286,
        "y": 321
      },
      "size": {
        "height": 103,
        "width": 311
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "1ac667e7-592c-4342-84a7-8dec5cf5a3a3",
      "z": 91,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "attrs": {
        "name": {
          "text": "On",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "hmi.changeBrightness \n  [brightness > 1] / brightness -= 1 \nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10"
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
        "x": -36,
        "y": 466
      },
      "id": "40b38423-97be-4f37-be52-9c82142c7a16",
      "z": 94,
      "parent": "4c8fcd52-a8e0-444f-875a-0d71329c21c5",
      "attrs": {
        "label": {
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
        }
      ],
      "id": "2eb67142-cc7c-4f84-a88f-ae822a9a83f4",
      "z": 95,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
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
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "d8c7b78a-acdf-4009-bccd-ad6d8b3a18a0",
      "z": 95,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "798906f3-0965-441a-9b3e-e9baa822d930",
      "z": 95,
      "parent": "4759ac2c-c1f9-4481-9c99-89d752b6bc3c",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "2dad5e69-4028-4fa8-896a-d75b0e22988f",
      "z": 97,
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "9d982e83-2acf-4df2-a91d-d2a503530d03",
      "z": 98,
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": -93,
        "y": 615.59375
      },
      "size": {
        "height": 463.40625,
        "width": 1371
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "z": 99,
      "parent": "239550e0-9354-4ea1-9d5a-62a62c88d0a0",
      "embeds": [
        "064582ea-e0ca-444e-961a-ce150dde913a",
        "b912361b-f32d-4773-bcdd-19adea8af7f4",
        "38944a7d-258f-4c5c-80c4-64adbd744ff4",
        "57d6a6e1-4e93-4882-831b-637e170f27e6",
        "6950640b-04c2-4d87-a960-78d5b756815b",
        "1824a94a-38e8-4e75-b7fb-10dd2073fb88"
      ],
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 360,
        "y": 665
      },
      "size": {
        "height": 362,
        "width": 890
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "57d6a6e1-4e93-4882-831b-637e170f27e6",
      "z": 203,
      "embeds": [
        "505fd101-0e42-4036-8edd-3dfdccf6ede0",
        "8924389e-6226-42f3-a304-0d9d49b66264"
      ],
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "attrs": {
        "name": {
          "text": "Active",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 361,
        "y": 703.59375
      },
      "size": {
        "height": 322.40625,
        "width": 542.9999999999999
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "505fd101-0e42-4036-8edd-3dfdccf6ede0",
      "z": 204,
      "parent": "57d6a6e1-4e93-4882-831b-637e170f27e6",
      "embeds": [
        "1bae6be0-ec27-4026-9b5b-ad5550febdc2",
        "8a6b0756-aea3-47b7-8319-de4deb112c34",
        "ab29ecab-4681-454a-b4cc-ba1ce14c417f"
      ],
      "attrs": {}
    },
    {
      "type": "Region",
      "position": {
        "x": 904.9999999999999,
        "y": 703.59375
      },
      "size": {
        "height": 322,
        "width": 344
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8924389e-6226-42f3-a304-0d9d49b66264",
      "z": 205,
      "embeds": [
        "9c7bf01b-bb4a-43c7-b966-8f021f657891",
        "88ee445a-45fe-42b9-9e62-30650aeb0d4a",
        "e000a7b0-80bf-47a6-a44b-058fcdd4463d",
        "3ce3d085-1c16-4cc4-920c-7719a22f43ee",
        "63214031-4bc7-45be-92f9-1dcc6f898005",
        "c4399a63-d0e5-47b8-b2df-255f73dae12c"
      ],
      "parent": "57d6a6e1-4e93-4882-831b-637e170f27e6",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 430,
        "y": 765.296875
      },
      "size": {
        "height": 211.5625,
        "width": 438
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8a6b0756-aea3-47b7-8319-de4deb112c34",
      "z": 206,
      "parent": "505fd101-0e42-4036-8edd-3dfdccf6ede0",
      "attrs": {
        "name": {
          "text": "Waiting",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\n  wait_time =\n    (simulation.WAIT_MIN \n      + get_rand() \n        * (simulation.WAIT_MAX - simulation.WAIT_MIN)\n    ) as integer\n\nalways [ !(hour > 17 || (hour > 7 && hour < 10)) ]  \n\t/ raise stopSimulation\n\nafter wait_time s / raise changePresence"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 374,
        "y": 781
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "ab29ecab-4681-454a-b4cc-ba1ce14c417f",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 207,
      "parent": "505fd101-0e42-4036-8edd-3dfdccf6ede0",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 925.1550877415441,
        "y": 781
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "ShallowHistory",
      "id": "3ce3d085-1c16-4cc4-920c-7719a22f43ee",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\" />\n      <rect width=\"40\" height =\"10\" x=\"30\" y=\"45\" />\n      <rect width=\"10\" height =\"50\" x=\"30\" y=\"25\" />\n      <rect width=\"10\" height =\"50\" x=\"60\" y=\"25\" />\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 209,
      "embeds": [
        "5b62bae0-3fdf-44f1-bac4-b5d1c3cff8e7"
      ],
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 996.1550877415441,
        "y": 765.296875
      },
      "size": {
        "height": 60,
        "width": 191
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "63214031-4bc7-45be-92f9-1dcc6f898005",
      "z": 210,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264",
      "attrs": {
        "name": {
          "text": "Absent",
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
        "x": 996.1550877415441,
        "y": 916.859375
      },
      "size": {
        "height": 60,
        "width": 191
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "c4399a63-d0e5-47b8-b2df-255f73dae12c",
      "z": 211,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264",
      "attrs": {
        "name": {
          "text": "Present",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 10"
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
        "x": 925.1550877415441,
        "y": 796
      },
      "id": "5b62bae0-3fdf-44f1-bac4-b5d1c3cff8e7",
      "z": 215,
      "parent": "3ce3d085-1c16-4cc4-920c-7719a22f43ee",
      "attrs": {
        "label": {
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
        }
      ],
      "id": "88ee445a-45fe-42b9-9e62-30650aeb0d4a",
      "z": 216,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "9c7bf01b-bb4a-43c7-b966-8f021f657891",
      "z": 216,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264",
      "attrs": {}
    },
    {
      "type": "Transition",
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
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "e000a7b0-80bf-47a6-a44b-058fcdd4463d",
      "z": 216,
      "parent": "8924389e-6226-42f3-a304-0d9d49b66264",
      "attrs": {}
    },
    {
      "type": "Transition",
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
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "1bae6be0-ec27-4026-9b5b-ad5550febdc2",
      "z": 216,
      "parent": "505fd101-0e42-4036-8edd-3dfdccf6ede0",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": -36,
        "y": 665
      },
      "size": {
        "height": 115,
        "width": 241
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "6950640b-04c2-4d87-a960-78d5b756815b",
      "z": 217,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "attrs": {
        "name": {
          "text": "Idle",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry / brightness = 0\n\n[ hour > 17 \n  || (hour > 7 && hour < 10) \n] / raise startSimulation"
        }
      }
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "38944a7d-258f-4c5c-80c4-64adbd744ff4",
      "z": 220,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "attrs": {}
    },
    {
      "type": "Transition",
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
        }
      ],
      "id": "b912361b-f32d-4773-bcdd-19adea8af7f4",
      "z": 221,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": -15,
        "y": 839.796875
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "entryKind": "Entry",
      "id": "1824a94a-38e8-4e75-b7fb-10dd2073fb88",
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "z": 222,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Transition",
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
              "text": "1",
              "fill": "#555555"
            },
            "circleBody": {
              "fill": "#F0F0F0",
              "stroke": "#555555"
            }
          }
        }
      ],
      "id": "064582ea-e0ca-444e-961a-ce150dde913a",
      "z": 223,
      "parent": "19e941b6-1719-4c37-a00b-227b02e3c38c",
      "attrs": {}
    }
  ]
}