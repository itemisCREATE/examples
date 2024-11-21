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
      "id": "7f85a5d8-4f8b-4021-89ed-2c96ab106e07",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "_05_PresenceSimulationLightSwitch"
        },
        "specification": {
          "text": "@EventDriven\n\t\ninterface:\n\tvar brightness: integer\n\ninterface hmi:\n\tin event switch\n\tin event toggleMode\n\tin event changeBrightness\n\ninterface simulation:\n\tvar WAIT_MIN: integer = 5\n\tvar WAIT_MAX: integer = 1200\n\tvar UPDATE_PERIOD : integer = 2\n\n\ninternal:\n\tvar wait_time: integer\n\tvar hour: integer\n\t\n\tevent changePresence\n\tevent startSimulation\n\tevent stopSimulation\n\t\n\toperation get_rand(): real\n\toperation get_hour(): integer\n\t\t\n\t\n\t"
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
        "width": 1362,
        "height": 703
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "z": 2,
      "embeds": [
        "638bb0bb-3dec-4c9b-8b24-ca6ea5db1db0",
        "b2d1772a-2f6e-4a24-a853-5fbeabcc594b",
        "e410273c-308a-490c-8def-97fe976e2772",
        "4f052e01-2238-403d-b1b9-313465e9899f",
        "07946cb1-5a22-4700-900b-d1063d931909",
        "0a9d0361-bd0b-484c-9258-dd9c7f77e4ba"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": "10",
          "text": "main"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 737,
        "y": 46
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "4f052e01-2238-403d-b1b9-313465e9899f",
      "parent": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "z": 3,
      "embeds": [
        "fe373c20-adba-4235-8444-8b042d0ab7a7"
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
        "x": 737,
        "y": 61
      },
      "id": "fe373c20-adba-4235-8444-8b042d0ab7a7",
      "z": 4,
      "parent": "4f052e01-2238-403d-b1b9-313465e9899f",
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
        "x": 16,
        "y": 283
      },
      "size": {
        "width": 1272,
        "height": 408
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "07946cb1-5a22-4700-900b-d1063d931909",
      "parent": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "z": 5,
      "embeds": [
        "6c66075d-4e32-4391-ab8e-d695a156888c"
      ],
      "attrs": {
        "name": {
          "text": "Presence Simulation"
        },
        "specification": {
          "text": "\tevery simulation.UPDATE_PERIOD s /  hour = get_hour ",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 17,
        "y": 319
      },
      "size": {
        "width": 1270,
        "height": 371
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "z": 6,
      "parent": "07946cb1-5a22-4700-900b-d1063d931909",
      "embeds": [
        "cc22fd67-4d1e-46c9-b31d-03a588d760bc",
        "75488694-b5a8-4aa5-9487-60565f341956",
        "ad2377aa-6dc0-47f0-9ff8-3e3289a833a3",
        "e59c2540-2777-4a41-ac4b-5d7ec1c25369",
        "268d569e-a9ef-4e40-95f1-392806cdf02d",
        "6c1679c4-7121-4ff3-a63b-55a0d872812c"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "mode"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 90,
        "y": 494
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "e59c2540-2777-4a41-ac4b-5d7ec1c25369",
      "parent": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "z": 7,
      "embeds": [
        "6676ba5d-41b4-4f00-8f97-8ceb4069cb2c"
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
        "x": 90,
        "y": 509
      },
      "id": "6676ba5d-41b4-4f00-8f97-8ceb4069cb2c",
      "z": 8,
      "parent": "e59c2540-2777-4a41-ac4b-5d7ec1c25369",
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
        "x": 38,
        "y": 347
      },
      "size": {
        "width": 220,
        "height": 111
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "268d569e-a9ef-4e40-95f1-392806cdf02d",
      "parent": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "z": 9,
      "attrs": {
        "name": {
          "text": "Idle"
        },
        "specification": {
          "text": "entry / brightness = 0\n\n[ hour > 17 \n  || (hour > 7 && hour < 10) \n] / raise startSimulation",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 391,
        "y": 347
      },
      "size": {
        "width": 842,
        "height": 334
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "6c1679c4-7121-4ff3-a63b-55a0d872812c",
      "parent": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "z": 10,
      "embeds": [
        "88a8c04d-8e20-4c78-a672-a079ff68a21c",
        "56c1f544-1d81-43fc-a4f1-e8395e163f0c"
      ],
      "attrs": {
        "name": {
          "text": "Active"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 392,
        "y": 385
      },
      "size": {
        "width": 543,
        "height": 293
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "88a8c04d-8e20-4c78-a672-a079ff68a21c",
      "z": 11,
      "parent": "6c1679c4-7121-4ff3-a63b-55a0d872812c",
      "embeds": [
        "a5a3c4c5-4d03-4997-856d-3b9e71d54d44",
        "3133b1a6-9e84-463e-a167-068f5a1d8c1f",
        "d3692ff5-f72e-44cb-a4e1-121c214d76a0",
        "fdf95d30-e875-4951-a053-725ac435b2f3"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "schedule"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 466,
        "y": 414
      },
      "size": {
        "width": 403,
        "height": 205
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d3692ff5-f72e-44cb-a4e1-121c214d76a0",
      "parent": "88a8c04d-8e20-4c78-a672-a079ff68a21c",
      "z": 12,
      "attrs": {
        "name": {
          "text": "Waiting"
        },
        "specification": {
          "text": "entry /\n  wait_time =\n    (simulation.WAIT_MIN \n      + get_rand() \n        * (simulation.WAIT_MAX - simulation.WAIT_MIN)\n    ) as integer\n\nalways [ !(hour > 17 || (hour > 7 && hour < 10)) ]  \n\t/ raise stopSimulation\n\nafter wait_time s / raise changePresence",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 422,
        "y": 426
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "fdf95d30-e875-4951-a053-725ac435b2f3",
      "parent": "88a8c04d-8e20-4c78-a672-a079ff68a21c",
      "z": 13,
      "embeds": [
        "2dc8a8f3-0d0b-45c3-b548-d4ecc7fd9792"
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
        "x": 422,
        "y": 441
      },
      "id": "2dc8a8f3-0d0b-45c3-b548-d4ecc7fd9792",
      "z": 14,
      "parent": "fdf95d30-e875-4951-a053-725ac435b2f3",
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
      "type": "Region",
      "position": {
        "x": 935,
        "y": 385
      },
      "size": {
        "width": 297,
        "height": 293
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "z": 15,
      "parent": "6c1679c4-7121-4ff3-a63b-55a0d872812c",
      "embeds": [
        "f86606a0-d804-4ee3-a57d-48a49491e564",
        "f2a4acb9-65c9-4695-a29c-f49956dbfe41",
        "3a8d50e4-18df-4a23-bf91-447b91b19dfc",
        "0ec80181-baad-43be-856d-d9b213a775e9",
        "024687c4-9673-49af-9435-75d7aca4cbc9",
        "4fe93143-4f52-4ee3-9ab1-26d0a993434c"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "presence"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1015,
        "y": 496
      },
      "size": {
        "width": 176,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "0ec80181-baad-43be-856d-d9b213a775e9",
      "parent": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "z": 16,
      "attrs": {
        "name": {
          "text": "Present"
        },
        "specification": {
          "text": "entry / brightness = 10",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 1012,
        "y": 413
      },
      "size": {
        "width": 179,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "024687c4-9673-49af-9435-75d7aca4cbc9",
      "parent": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "z": 17,
      "attrs": {
        "name": {
          "text": "Absent"
        },
        "specification": {
          "text": "entry / brightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "ShallowHistory",
      "position": {
        "x": 964,
        "y": 428
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "4fe93143-4f52-4ee3-9ab1-26d0a993434c",
      "parent": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "z": 18,
      "embeds": [
        "e4c2c1a4-25e6-4c29-8d6e-9e7c960725f2"
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
        "x": 964,
        "y": 443
      },
      "id": "e4c2c1a4-25e6-4c29-8d6e-9e7c960725f2",
      "z": 19,
      "parent": "4fe93143-4f52-4ee3-9ab1-26d0a993434c",
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
        "x": 16,
        "y": 36
      },
      "size": {
        "width": 665,
        "height": 185
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "0a9d0361-bd0b-484c-9258-dd9c7f77e4ba",
      "parent": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "z": 20,
      "embeds": [
        "c130c1b9-0cc7-471c-bc25-41e10fa734d8"
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
        "x": 17,
        "y": 76
      },
      "size": {
        "width": 663,
        "height": 144
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "z": 21,
      "parent": "0a9d0361-bd0b-484c-9258-dd9c7f77e4ba",
      "embeds": [
        "ba5b58dc-01e3-4bdc-b95e-d3807e983340",
        "f9895c16-e41d-44d5-8514-d12880368cdc",
        "96c9bcf8-061d-43b0-9347-c144af91998d",
        "8bc70fba-1ad7-45e5-90f4-b32eeddced18",
        "0667d8ef-3fc1-4297-b64a-b718ebd16170",
        "ed689cd7-556f-4d90-a640-c821abd4d860"
      ],
      "attrs": {
        "name": {
          "fontSize": "9",
          "text": "mode"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 134,
        "y": 201
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "8bc70fba-1ad7-45e5-90f4-b32eeddced18",
      "parent": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "z": 22,
      "embeds": [
        "62f6416c-96aa-4595-b843-f41ee86a670a"
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
        "x": 134,
        "y": 216
      },
      "id": "62f6416c-96aa-4595-b843-f41ee86a670a",
      "z": 23,
      "parent": "8bc70fba-1ad7-45e5-90f4-b32eeddced18",
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
        "x": 36,
        "y": 104
      },
      "size": {
        "width": 159,
        "height": 68
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "0667d8ef-3fc1-4297-b64a-b718ebd16170",
      "parent": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "z": 24,
      "attrs": {
        "name": {
          "text": "Off"
        },
        "specification": {
          "text": "entry \n    / brightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 338,
        "y": 104
      },
      "size": {
        "width": 303,
        "height": 98
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "ed689cd7-556f-4d90-a640-c821abd4d860",
      "parent": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "z": 25,
      "attrs": {
        "name": {
          "text": "On"
        },
        "specification": {
          "text": "hmi.changeBrightness \n  [brightness > 1] / brightness -= 1 \nhmi.changeBrightness \n  [brightness <= 1] / brightness = 10",
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
            "dx": "3.283902858371069%",
            "dy": "37.4020397208803%",
            "rotate": true
          }
        },
        "id": "4f052e01-2238-403d-b1b9-313465e9899f"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "8.438003220611916%",
            "rotate": true
          }
        },
        "id": "0a9d0361-bd0b-484c-9258-dd9c7f77e4ba"
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
      "id": "e410273c-308a-490c-8def-97fe976e2772",
      "z": 26,
      "parent": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "37.736240913811045%",
            "dy": "3.1452991452992287%",
            "rotate": true
          }
        },
        "id": "e59c2540-2777-4a41-ac4b-5d7ec1c25369"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "26.20928915321439%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "268d569e-a9ef-4e40-95f1-392806cdf02d"
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
      "id": "ad2377aa-6dc0-47f0-9ff8-3e3289a833a3",
      "z": 27,
      "parent": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "15.336454271338493%",
            "dy": "0.015614221904530323%",
            "rotate": true
          }
        },
        "id": "07946cb1-5a22-4700-900b-d1063d931909"
      },
      "target": {
        "id": "0a9d0361-bd0b-484c-9258-dd9c7f77e4ba",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "29%",
            "dy": "51%",
            "rotate": true
          }
        }
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
            "distance": 0.5451798482226036,
            "offset": -54.58976543309253,
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
      "id": "b2d1772a-2f6e-4a24-a853-5fbeabcc594b",
      "z": 28,
      "parent": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "0a9d0361-bd0b-484c-9258-dd9c7f77e4ba",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "07946cb1-5a22-4700-900b-d1063d931909",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "26%",
            "dy": "1%",
            "rotate": true
          }
        }
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
            "distance": 0.47563760378169606,
            "offset": -45.871030369228,
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
      "id": "638bb0bb-3dec-4c9b-8b24-ca6ea5db1db0",
      "z": 29,
      "parent": "d6eff3b9-ca8d-4163-b996-a6c587f11158",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "58.252534968952915%",
            "rotate": true
          }
        },
        "id": "268d569e-a9ef-4e40-95f1-392806cdf02d"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.04259412144254548%",
            "dy": "19.359375393873574%",
            "rotate": true
          }
        },
        "id": "6c1679c4-7121-4ff3-a63b-55a0d872812c"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "startSimulation",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.47368421052631576,
            "offset": 17.339999999999918,
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
      "id": "75488694-b5a8-4aa5-9487-60565f341956",
      "z": 30,
      "parent": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.05689644653007485%",
            "dy": "3.4639251063545413%",
            "rotate": true
          }
        },
        "id": "6c1679c4-7121-4ff3-a63b-55a0d872812c"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "10.422981851553304%",
            "rotate": true
          }
        },
        "id": "268d569e-a9ef-4e40-95f1-392806cdf02d"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "stopSimulation",
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
      "id": "cc22fd67-4d1e-46c9-b31d-03a588d760bc",
      "z": 31,
      "parent": "6c66075d-4e32-4391-ab8e-d695a156888c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "89.6106362773033%",
            "dy": "28.88888888888914%",
            "rotate": true
          }
        },
        "id": "4fe93143-4f52-4ee3-9ab1-26d0a993434c"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.21407311910111249%",
            "dy": "36.477987421383716%",
            "rotate": true
          }
        },
        "id": "024687c4-9673-49af-9435-75d7aca4cbc9"
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
      "id": "3a8d50e4-18df-4a23-bf91-447b91b19dfc",
      "z": 32,
      "parent": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "14.554011114413806%",
            "dy": "1.6302077739191887%",
            "rotate": true
          }
        },
        "id": "0ec80181-baad-43be-856d-d9b213a775e9"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "15.986066794060502%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "024687c4-9673-49af-9435-75d7aca4cbc9"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "changePresence",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.4666666666666667,
            "offset": -59.61999999999989,
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
      "id": "f2a4acb9-65c9-4695-a29c-f49956dbfe41",
      "z": 33,
      "parent": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "56.69143340541619%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "024687c4-9673-49af-9435-75d7aca4cbc9"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "55.95321920209941%",
            "dy": "1.242138364779817%",
            "rotate": true
          }
        },
        "id": "0ec80181-baad-43be-856d-d9b213a775e9"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "changePresence",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.43333333333333335,
            "offset": -43.51999999999998,
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
      "id": "f86606a0-d804-4ee3-a57d-48a49491e564",
      "z": 34,
      "parent": "56c1f544-1d81-43fc-a4f1-e8395e163f0c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "97.00305810397595%",
            "dy": "48.88888888888914%",
            "rotate": true
          }
        },
        "id": "fdf95d30-e875-4951-a053-725ac435b2f3"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.14911102510984367%",
            "dy": "9.430894308943108%",
            "rotate": true
          }
        },
        "id": "d3692ff5-f72e-44cb-a4e1-121c214d76a0"
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
      "id": "3133b1a6-9e84-463e-a167-068f5a1d8c1f",
      "z": 35,
      "parent": "88a8c04d-8e20-4c78-a672-a079ff68a21c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "2.2222222222222854%",
            "rotate": true
          }
        },
        "id": "8bc70fba-1ad7-45e5-90f4-b32eeddced18"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "66.35220125786164%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "0667d8ef-3fc1-4297-b64a-b718ebd16170"
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
      "id": "96c9bcf8-061d-43b0-9347-c144af91998d",
      "z": 36,
      "parent": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "16.176470588235293%",
            "rotate": true
          }
        },
        "id": "0667d8ef-3fc1-4297-b64a-b718ebd16170"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.16501650165016502%",
            "dy": "11.224489795918368%",
            "rotate": true
          }
        },
        "id": "ed689cd7-556f-4d90-a640-c821abd4d860"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.switch /\n brightness = 10",
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
      "id": "f9895c16-e41d-44d5-8514-d12880368cdc",
      "z": 37,
      "parent": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.05500550055006126%",
            "dy": "59.504556539596976%",
            "rotate": true
          }
        },
        "id": "ed689cd7-556f-4d90-a640-c821abd4d860"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "85.75656677765447%",
            "rotate": true
          }
        },
        "id": "0667d8ef-3fc1-4297-b64a-b718ebd16170"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "hmi.switch ",
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
      "id": "ba5b58dc-01e3-4bdc-b95e-d3807e983340",
      "z": 38,
      "parent": "c130c1b9-0cc7-471c-bc25-41e10fa734d8",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "d3692ff5-f72e-44cb-a4e1-121c214d76a0",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "77.91563275434244%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "d3692ff5-f72e-44cb-a4e1-121c214d76a0",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "63.27543424317618%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "changePresence",
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
      "id": "a5a3c4c5-4d03-4997-856d-3b9e71d54d44",
      "z": 39,
      "parent": "88a8c04d-8e20-4c78-a672-a079ff68a21c",
      "vertices": [
        {
          "x": 780,
          "y": 644
        },
        {
          "x": 721,
          "y": 644
        }
      ],
      "attrs": {}
    }
  ]
}