{
  "graph": {
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
            "text": "@EventDriven\n\n// super steps disabled\n@SuperSteps(no)\n\ninterface:\n\tin event e\n\ninternal:\n\tevent local1\n\tevent local2\n\tvar x : integer = 0\n"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -33,
          "y": 190
        },
        "size": {
          "height": 298,
          "width": 680
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "z": 73,
        "embeds": [
          "65ce9085-aed4-4478-9dad-5e2ae298a2a3",
          "c415df08-9dab-4474-9eee-0942698c2d31",
          "0319e44b-577c-42b5-b62e-2bd9bb33d683",
          "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
          "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
          "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
          "36b8548a-74b1-4925-ae23-291c03231ee6",
          "db372094-acc6-467b-b44d-495606208445",
          "b0acff06-b063-4fa9-b9f3-73bdb91fd240",
          "7043399f-42e3-418a-827d-e3c6f80635f7"
        ],
        "attrs": {
          "name": {
            "text": "main region"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 38.64279556274414,
          "y": 280
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 74,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
        ],
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {
          "name": {
            "fill": "#CFD8DC"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 10.32139778137207,
          "y": 377
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 75,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {
          "name": {
            "text": "A",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 225,
          "y": 377
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "db372094-acc6-467b-b44d-495606208445",
        "z": 76,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {
          "name": {
            "text": "B",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 434,
          "y": 377
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "b0acff06-b063-4fa9-b9f3-73bdb91fd240",
        "z": 77,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {
          "name": {
            "text": "C",
            "fill": "#CFD8DC",
            "fontSize": 12
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 434,
          "y": 250
        },
        "size": {
          "height": 60,
          "width": 71.64279556274414
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "7043399f-42e3-418a-827d-e3c6f80635f7",
        "z": 78,
        "embeds": [
          "bf77dc0a-fbbc-4856-89c2-aa9777a6a9db"
        ],
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {
          "name": {
            "text": "L",
            "fill": "#CFD8DC",
            "fontSize": 12
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
          "x": 38.64279556274414,
          "y": 295
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 84,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
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
          "id": "7043399f-42e3-418a-827d-e3c6f80635f7"
        },
        "target": {
          "id": "b0acff06-b063-4fa9-b9f3-73bdb91fd240",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 58,
              "dy": 9,
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
                "text": "local2"
              }
            },
            "position": {
              "offset": -37,
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
        "id": "c415df08-9dab-4474-9eee-0942698c2d31",
        "z": 85,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b0acff06-b063-4fa9-b9f3-73bdb91fd240"
        },
        "target": {
          "id": "7043399f-42e3-418a-827d-e3c6f80635f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 15.1785888671875,
              "dy": 61.111114501953125,
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
                "text": "local1"
              }
            },
            "position": {
              "distance": 0.5000000763814658,
              "offset": -39,
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
        "id": "65ce9085-aed4-4478-9dad-5e2ae298a2a3",
        "z": 85,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "db372094-acc6-467b-b44d-495606208445"
        },
        "target": {
          "id": "b0acff06-b063-4fa9-b9f3-73bdb91fd240",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 1,
              "dy": 30,
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
                "text": "e / raise local2"
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
        "id": "0319e44b-577c-42b5-b62e-2bd9bb33d683",
        "z": 85,
        "vertices": [],
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "db372094-acc6-467b-b44d-495606208445"
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
                "text": "e / raise local1"
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
        "z": 85,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
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
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "z": 85,
        "parent": "50adef0d-3e5b-4d38-a6db-581abdb0c229",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "7043399f-42e3-418a-827d-e3c6f80635f7"
        },
        "target": {
          "id": "7043399f-42e3-418a-827d-e3c6f80635f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 1.1785888671875,
              "dy": 11,
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
                "text": "local1 [x > 17] / x--"
              }
            },
            "position": {
              "distance": 0.4849970511331435,
              "offset": -93,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "2",
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
        "id": "bf77dc0a-fbbc-4856-89c2-aa9777a6a9db",
        "z": 85,
        "parent": "7043399f-42e3-418a-827d-e3c6f80635f7",
        "vertices": [
          {
            "x": 380.17860221862793,
            "y": 296
          },
          {
            "x": 380.17860221862793,
            "y": 261
          }
        ],
        "attrs": {}
      }
    ]
  }
}