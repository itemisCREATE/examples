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
      "id": "043cdabd-aeda-424c-b344-d636dbc60e03",
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
        "width": 1218,
        "height": 561
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "z": 2,
      "embeds": [
        "61635871-c353-4335-a334-b24b261a6146",
        "956397d9-3dc0-4fc6-912b-71a797a27b20",
        "b6d1ad94-d5a6-4dfe-8564-f4234918767d",
        "2d5093e8-8956-4b82-b54b-2b07753aa4d1",
        "6378a9c5-6ff7-49d8-a1a3-5aa8651c9ec9",
        "f788bbad-1714-41b8-8834-ee539439d7d2",
        "d15e8a85-079a-46a0-8847-6b921289241b",
        "46e59768-fddc-4f7b-b804-434d9ab8a730",
        "bdb30744-1ef5-4dba-a035-7f14c0749852",
        "6ffed9d4-73fc-4a7a-86b0-226a0c1e89bc",
        "6b424766-21cc-4633-ae25-39cc46559429"
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
      "type": "Entry",
      "position": {
        "x": 721,
        "y": 66
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "46e59768-fddc-4f7b-b804-434d9ab8a730",
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "z": 3,
      "embeds": [
        "37330f51-ffc3-4760-8e4f-231d27171aef"
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
        "x": 721,
        "y": 81
      },
      "id": "37330f51-ffc3-4760-8e4f-231d27171aef",
      "z": 4,
      "parent": "46e59768-fddc-4f7b-b804-434d9ab8a730",
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
        "x": 598,
        "y": 458
      },
      "size": {
        "width": 181,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "bdb30744-1ef5-4dba-a035-7f14c0749852",
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "z": 5,
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
        "x": 25,
        "y": 127
      },
      "size": {
        "width": 487,
        "height": 194
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "6ffed9d4-73fc-4a7a-86b0-226a0c1e89bc",
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "z": 6,
      "embeds": [
        "2c0b49c2-4da7-4af4-a96f-a4d83dc41173"
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
        "x": 26,
        "y": 167
      },
      "size": {
        "width": 485,
        "height": 153
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
      "z": 7,
      "parent": "6ffed9d4-73fc-4a7a-86b0-226a0c1e89bc",
      "embeds": [
        "49f826c7-ae13-4bdd-9718-de59d86d41a6",
        "b4dd75f7-0011-4b3d-bef6-887b7412396e",
        "c9e25e9c-21ea-4c7e-b7ef-70fe6301fb4f",
        "a621a9a4-be28-4bf7-bb8f-8d62c8c47ca6",
        "8412a71b-104f-4856-8cb9-58f06777fba3",
        "dba20652-1e4a-4044-8b18-64c2489b05a2"
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
        "x": 66,
        "y": 216
      },
      "size": {
        "width": 157,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "a621a9a4-be28-4bf7-bb8f-8d62c8c47ca6",
      "parent": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
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
        "x": 330,
        "y": 216
      },
      "size": {
        "width": 157,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8412a71b-104f-4856-8cb9-58f06777fba3",
      "parent": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
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
        "x": 38,
        "y": 235
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "dba20652-1e4a-4044-8b18-64c2489b05a2",
      "parent": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
      "z": 10,
      "embeds": [
        "4c3592d5-725d-4dbf-ac10-51f7653bf306"
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
        "x": 38,
        "y": 250
      },
      "id": "4c3592d5-725d-4dbf-ac10-51f7653bf306",
      "z": 11,
      "parent": "dba20652-1e4a-4044-8b18-64c2489b05a2",
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
        "x": 643,
        "y": 127
      },
      "size": {
        "width": 525,
        "height": 194
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "6b424766-21cc-4633-ae25-39cc46559429",
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "z": 12,
      "embeds": [
        "813e6b14-8298-4422-b119-7be4f2688204"
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
        "x": 644,
        "y": 167
      },
      "size": {
        "width": 523,
        "height": 153
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "813e6b14-8298-4422-b119-7be4f2688204",
      "z": 13,
      "parent": "6b424766-21cc-4633-ae25-39cc46559429",
      "embeds": [
        "bc58b3af-619a-4d34-8210-d8198cb724c8",
        "96c22fad-cc61-470b-9206-29f9afa61585",
        "e4bd2abb-1b34-4f7f-a78f-551476b42e6a",
        "c53c7469-a357-4e23-88af-a631cb93dbee",
        "15421854-0e22-4a6a-9257-1b0fc5d1847d",
        "8e73421b-1d4a-4ad8-b2fc-0096cdd4cb6a",
        "0042899f-5400-4859-9ab0-3d2c04df8350"
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
        "x": 704,
        "y": 216
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "15421854-0e22-4a6a-9257-1b0fc5d1847d",
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
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
        "x": 964,
        "y": 216
      },
      "size": {
        "width": 164,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8e73421b-1d4a-4ad8-b2fc-0096cdd4cb6a",
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
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
        "x": 665,
        "y": 229
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "0042899f-5400-4859-9ab0-3d2c04df8350",
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
      "z": 16,
      "embeds": [
        "d23023b6-643b-4289-b405-70948df53575"
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
        "x": 665,
        "y": 244
      },
      "id": "d23023b6-643b-4289-b405-70948df53575",
      "z": 17,
      "parent": "0042899f-5400-4859-9ab0-3d2c04df8350",
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
            "dx": "49.44350537149755%",
            "dy": "97.71069345711471%",
            "rotate": true
          }
        },
        "id": "46e59768-fddc-4f7b-b804-434d9ab8a730"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.269814439185645%",
            "dy": "0.41917940058475045%",
            "rotate": true
          }
        },
        "id": "6b424766-21cc-4633-ae25-39cc46559429"
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
      "id": "d15e8a85-079a-46a0-8847-6b921289241b",
      "z": 18,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "attrs": {}
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
        "id": "15421854-0e22-4a6a-9257-1b0fc5d1847d"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "8e73421b-1d4a-4ad8-b2fc-0096cdd4cb6a"
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
      "id": "c53c7469-a357-4e23-88af-a631cb93dbee",
      "z": 19,
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "14.074019395503864%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "8e73421b-1d4a-4ad8-b2fc-0096cdd4cb6a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "46.016745719046384%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "15421854-0e22-4a6a-9257-1b0fc5d1847d"
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
      "id": "e4bd2abb-1b34-4f7f-a78f-551476b42e6a",
      "z": 20,
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
      "vertices": [
        {
          "x": 987.0813918086263,
          "y": 293
        },
        {
          "x": 767.9632765494745,
          "y": 293
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
            "dx": "16.26158677523985%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "6b424766-21cc-4633-ae25-39cc46559429"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.02946440332%",
            "dy": "1.3272591551811892%",
            "rotate": true
          }
        },
        "id": "bdb30744-1ef5-4dba-a035-7f14c0749852"
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
      "id": "f788bbad-1714-41b8-8834-ee539439d7d2",
      "z": 21,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "36.23296699608171%",
            "dy": "1.1272185789995899%",
            "rotate": true
          }
        },
        "id": "bdb30744-1ef5-4dba-a035-7f14c0749852"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.920318145315789%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "6b424766-21cc-4633-ae25-39cc46559429"
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
      "id": "6378a9c5-6ff7-49d8-a1a3-5aa8651c9ec9",
      "z": 22,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.15418368163986%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "bdb30744-1ef5-4dba-a035-7f14c0749852"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "36.795067659540415%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "bdb30744-1ef5-4dba-a035-7f14c0749852"
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
      "id": "2d5093e8-8956-4b82-b54b-2b07753aa4d1",
      "z": 23,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "vertices": [
        {
          "x": 728.5990724637682,
          "y": 537.7258064516129
        },
        {
          "x": 664.5990724637682,
          "y": 537.7258064516129
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
            "dx": "91.07395751376876%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "8e73421b-1d4a-4ad8-b2fc-0096cdd4cb6a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "47.17151848937851%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "8e73421b-1d4a-4ad8-b2fc-0096cdd4cb6a"
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
      "id": "96c22fad-cc61-470b-9206-29f9afa61585",
      "z": 24,
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
      "vertices": [
        {
          "x": 1113.3612903225808,
          "y": 289
        },
        {
          "x": 1041.3612903225808,
          "y": 289
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
            "dy": "49.371069182389974%",
            "rotate": true
          }
        },
        "id": "a621a9a4-be28-4bf7-bb8f-8d62c8c47ca6"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.2600849256900019%",
            "dy": "49.371069182389974%",
            "rotate": true
          }
        },
        "id": "8412a71b-104f-4856-8cb9-58f06777fba3"
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
      "id": "c9e25e9c-21ea-4c7e-b7ef-70fe6301fb4f",
      "z": 25,
      "parent": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "41.44120163513645%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "8412a71b-104f-4856-8cb9-58f06777fba3"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "55.49576955984408%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "a621a9a4-be28-4bf7-bb8f-8d62c8c47ca6"
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
      "id": "b4dd75f7-0011-4b3d-bef6-887b7412396e",
      "z": 26,
      "parent": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
      "vertices": [
        {
          "x": 395.06268656716423,
          "y": 295
        },
        {
          "x": 153.1283582089552,
          "y": 295
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
            "dy": "45.6244635646769%",
            "rotate": true
          }
        },
        "id": "6ffed9d4-73fc-4a7a-86b0-226a0c1e89bc"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.00592783044976386%",
            "dy": "45.6244635646769%",
            "rotate": true
          }
        },
        "id": "6b424766-21cc-4633-ae25-39cc46559429"
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
      "id": "b6d1ad94-d5a6-4dfe-8564-f4234918767d",
      "z": 27,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.07413655102848116%",
            "dy": "26.072514149993342%",
            "rotate": true
          }
        },
        "id": "6b424766-21cc-4633-ae25-39cc46559429"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "26.072514149993342%",
            "rotate": true
          }
        },
        "id": "6ffed9d4-73fc-4a7a-86b0-226a0c1e89bc"
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
      "id": "956397d9-3dc0-4fc6-912b-71a797a27b20",
      "z": 28,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "91.03682982727742%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "6ffed9d4-73fc-4a7a-86b0-226a0c1e89bc"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.07788947590401704%",
            "dy": "55.68101619264737%",
            "rotate": true
          }
        },
        "id": "bdb30744-1ef5-4dba-a035-7f14c0749852"
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
              "text": "2"
            }
          }
        }
      ],
      "id": "61635871-c353-4335-a334-b24b261a6146",
      "z": 29,
      "parent": "918215e2-3fd8-491e-be0b-eb46fd317e7e",
      "vertices": [
        {
          "x": 468.349361258841,
          "y": 487.5109385821031
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
            "dx": "97.52902155887236%",
            "dy": "48.88888888888896%",
            "rotate": true
          }
        },
        "id": "dba20652-1e4a-4044-8b18-64c2489b05a2"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.48325252717305484%",
            "dy": "49.68553459119499%",
            "rotate": true
          }
        },
        "id": "a621a9a4-be28-4bf7-bb8f-8d62c8c47ca6"
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
      "id": "49f826c7-ae13-4bdd-9718-de59d86d41a6",
      "z": 30,
      "parent": "2c0b49c2-4da7-4af4-a96f-a4d83dc41173",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "98.27529021558955%",
            "dy": "53.333333333333336%",
            "rotate": true
          }
        },
        "id": "0042899f-5400-4859-9ab0-3d2c04df8350"
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
        "id": "15421854-0e22-4a6a-9257-1b0fc5d1847d"
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
      "id": "bc58b3af-619a-4d34-8210-d8198cb724c8",
      "z": 31,
      "parent": "813e6b14-8298-4422-b119-7be4f2688204",
      "attrs": {}
    }
  ]
}