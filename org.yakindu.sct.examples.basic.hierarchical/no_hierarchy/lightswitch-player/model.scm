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
      "id": "210140e4-dea2-49c0-ab77-ca5ee77650be",
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
        "x": 23,
        "y": 10
      },
      "size": {
        "width": 1065,
        "height": 451
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "cce7fb80-b632-4d93-95fc-908bea554909",
      "z": 27,
      "embeds": [
        "7e155c54-4aca-42d5-820c-9867ef7b16af",
        "2e19f484-dbe8-4e11-a5ff-da0f7d187779",
        "4ea2e87f-9202-484c-9a78-53aba020b1be",
        "8a7d27a9-30b0-4074-b8e8-046fcc09798a",
        "bcc05d20-fafc-43b8-bf35-aa864ce1b1a4",
        "4b523e60-7727-4fe3-b87f-e146f5e9f02c",
        "96ba0afe-cc95-4154-bab3-d4e2b1e1141b",
        "18df1bea-fcc6-4e9a-aa62-8cfedee05db4",
        "a5e47415-f40d-4b8d-bf47-5a458046dd53",
        "35666f1e-65b9-46f7-8bc7-b3189a46def9",
        "0a03e25b-a3cc-4962-9a7e-6ea3b1cb1ca4",
        "c32a0b28-b1a3-4c00-9654-1d5d8f14ec46",
        "28bb3bf8-1ba0-4dcd-96d5-f92e93036a90",
        "448106b0-41bf-4b1c-a036-819f73cc8bff",
        "fb23e078-1ea7-4ccf-b8c9-e907cda4e320",
        "0b32fa87-34ac-4cc1-8bcf-fb33e799525b",
        "a5eb2228-225b-4a36-b478-b4d601c2491a",
        "efb60804-c1a1-46da-9e30-bdebf80f8b7e",
        "b7c3d99e-df16-49dd-a606-c0af5ad6137c",
        "69a600a9-e43b-49a9-9819-d0e4ecda6693"
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
        "x": 643,
        "y": 121
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "fb23e078-1ea7-4ccf-b8c9-e907cda4e320",
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "z": 43,
      "embeds": [
        "179c720d-48b3-4bd7-9be3-5a7c8b30789c"
      ],
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 836,
        "y": 169
      },
      "size": {
        "width": 139,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b",
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "z": 45,
      "embeds": [
        "e24c25c2-efaf-42ca-9292-d9c5fec2a8ad"
      ],
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
      "type": "State",
      "position": {
        "x": 576,
        "y": 169
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "a5eb2228-225b-4a36-b478-b4d601c2491a",
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "z": 46,
      "attrs": {
        "name": {
          "text": "MotionDetectionMode"
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
        "x": 72,
        "y": 169
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e",
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "z": 47,
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode"
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
        "x": 336,
        "y": 169
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "b7c3d99e-df16-49dd-a606-c0af5ad6137c",
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "z": 48,
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
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 643,
        "y": 136
      },
      "id": "179c720d-48b3-4bd7-9be3-5a7c8b30789c",
      "z": 49,
      "parent": "fb23e078-1ea7-4ccf-b8c9-e907cda4e320",
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
            "dx": "38.68356061419521%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "b7c3d99e-df16-49dd-a606-c0af5ad6137c"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "81.19617738644904%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e"
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
      "id": "35666f1e-65b9-46f7-8bc7-b3189a46def9",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 389.77014925373135,
          "y": 241
        },
        {
          "x": 184.86268656716416,
          "y": 241
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
            "dx": "99.67625899280577%",
            "dy": "58.17610062893084%",
            "rotate": true
          }
        },
        "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "42.82374100719427%",
            "dy": "58.17610062893084%",
            "rotate": true
          }
        },
        "id": "b7c3d99e-df16-49dd-a606-c0af5ad6137c"
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
      "id": "0a03e25b-a3cc-4962-9a7e-6ea3b1cb1ca4",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.195533125738216%",
            "dy": "0.18867924528306176%",
            "rotate": true
          }
        },
        "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "1.9574787930848856%",
            "dy": "0.7547169811320862%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
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
              "text": "2"
            }
          }
        }
      ],
      "id": "18df1bea-fcc6-4e9a-aa62-8cfedee05db4",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 145.94179104477612,
          "y": 138.2
        },
        {
          "x": 578.720895522388,
          "y": 138.2
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
            "dx": "97.84172661870507%",
            "dy": "28.301886792452883%",
            "rotate": true
          }
        },
        "id": "b7c3d99e-df16-49dd-a606-c0af5ad6137c"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.119295608289478%",
            "dy": "28.301886792452883%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
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
              "text": "2"
            }
          }
        }
      ],
      "id": "a5e47415-f40d-4b8d-bf47-5a458046dd53",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "27.657038548265923%",
            "dy": "7.924528301886771%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "38.04466874261786%",
            "dy": "9.056603773584927%",
            "rotate": true
          }
        }
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
              "text": "3"
            }
          }
        }
      ],
      "id": "96ba0afe-cc95-4154-bab3-d4e2b1e1141b",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 614.4432835820896,
          "y": 81
        },
        {
          "x": 124.88208955223882,
          "y": 81
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
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
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
        "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b"
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
      "id": "28bb3bf8-1ba0-4dcd-96d5-f92e93036a90",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "49.800279179641386%",
            "dy": "1.8867924528302424%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "24.983356598303455%",
            "dy": "1.8867924528301887%",
            "rotate": true
          }
        }
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
              "text": "4"
            }
          }
        }
      ],
      "id": "4b523e60-7727-4fe3-b87f-e146f5e9f02c",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 905.2223880597015,
          "y": 40
        },
        {
          "x": 106.7268656716418,
          "y": 40
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
            "dx": "35.331370713505365%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "88.83300956190462%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
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
      "id": "c32a0b28-b1a3-4c00-9654-1d5d8f14ec46",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 885.1106052917725,
          "y": 248
        },
        {
          "x": 699.4778832910474,
          "y": 248
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
            "dx": "29.55938697317985%",
            "dy": "95.55555555555561%",
            "rotate": true
          }
        },
        "id": "fb23e078-1ea7-4ccf-b8c9-e907cda4e320"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "51.39130075250142%",
            "dy": "0.3144654088050672%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
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
      "id": "448106b0-41bf-4b1c-a036-819f73cc8bff",
      "z": 50,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "42%",
            "dy": "62%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "92%",
            "dy": "22%",
            "rotate": true
          }
        }
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "sensor.motion",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.695882957002174,
            "offset": -12,
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
      "id": "e24c25c2-efaf-42ca-9292-d9c5fec2a8ad",
      "z": 50,
      "vertices": [
        {
          "x": 1036.1354838709678,
          "y": 206
        },
        {
          "x": 1036.1354838709678,
          "y": 251
        },
        {
          "x": 964.1354838709677,
          "y": 251
        }
      ],
      "parent": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 515,
        "y": 351
      },
      "size": {
        "width": 181,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693",
      "z": 51,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "embeds": [
        "448dbd20-cc73-4fe1-96d3-e25b232e38d0"
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
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "25.85116079045368%",
            "dy": "99.57927571515522%",
            "rotate": true
          }
        },
        "id": "efb60804-c1a1-46da-9e30-bdebf80f8b7e"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "4.2842897109330575%",
            "dy": "72.74345709068778%",
            "rotate": true
          }
        },
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693"
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
              "text": "3"
            }
          }
        }
      ],
      "id": "7e155c54-4aca-42d5-820c-9867ef7b16af",
      "z": 52,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 107.93,
          "y": 394.65
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
            "dx": "49.182741459037636%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "b7c3d99e-df16-49dd-a606-c0af5ad6137c"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "27.06999391357278%",
            "rotate": true
          }
        },
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693"
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
            "distance": 0.29326653143350834,
            "offset": 61.361748706044644,
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
      "id": "2e19f484-dbe8-4e11-a5ff-da0f7d187779",
      "z": 52,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 404.36,
          "y": 367.24
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
            "dx": "69.34529840916001%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "0b32fa87-34ac-4cc1-8bcf-fb33e799525b"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "87.38668197027467%",
            "dy": "41.235849056603804%",
            "rotate": true
          }
        },
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693"
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
      "id": "4ea2e87f-9202-484c-9a78-53aba020b1be",
      "z": 52,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "vertices": [
        {
          "x": 932.39,
          "y": 375.74
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
            "dx": "50.91118643476859%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.24671223443555%",
            "dy": "1.2014607425441064%",
            "rotate": true
          }
        },
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693"
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
            "distance": 0.3581395348837209,
            "offset": -55.23000000000002,
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
      "id": "8a7d27a9-30b0-4074-b8e8-046fcc09798a",
      "z": 52,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "75.50792934401991%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "40.14881332192047%",
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
      "id": "448dbd20-cc73-4fe1-96d3-e25b232e38d0",
      "z": 52,
      "vertices": [
        {
          "x": 652.669352112676,
          "y": 432
        },
        {
          "x": 588.669352112676,
          "y": 432
        }
      ],
      "parent": "69a600a9-e43b-49a9-9819-d0e4ecda6693",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "40.95847074366835%",
            "dy": "1.0014201663623998%",
            "rotate": true
          }
        },
        "id": "69a600a9-e43b-49a9-9819-d0e4ecda6693"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "10.168943918014186%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "a5eb2228-225b-4a36-b478-b4d601c2491a"
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
            "distance": 0.6232558139534884,
            "offset": -53.129999999999995,
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
      "id": "bcc05d20-fafc-43b8-bf35-aa864ce1b1a4",
      "z": 52,
      "parent": "cce7fb80-b632-4d93-95fc-908bea554909",
      "attrs": {}
    }
  ]
}