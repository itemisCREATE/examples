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
          "text": "MyStatechart"
        },
        "specification": {
          "text": "@CycleBased(200)\n@SuperSteps(no)\n\n// event buffers are enabled per default, so this can be omitted\n@EventBuffering(inEvents=yes,localEvents=yes)\n\ninterface:\n\tin event e\n\tin event f\n\ninternal:\n\tevent l1\n\tevent l2\n\t\n"
        }
      },
      "z": 1
    },
    {
      "position": {
        "x": 135,
        "y": 135
      },
      "size": {
        "width": 384,
        "height": 187
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "r1"
        }
      },
      "id": "84c6232f-3d8a-458b-a703-b44073527d80",
      "z": 92,
      "embeds": [
        "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
        "7197094a-c890-4098-9170-1701f27ac3cb",
        "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "36b8548a-74b1-4925-ae23-291c03231ee6",
        "db372094-acc6-467b-b44d-495606208445"
      ]
    },
    {
      "position": {
        "x": 145,
        "y": 233.5
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "type": "Entry",
      "entryKind": "Initial",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      },
      "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "z": 97,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "parent": "84c6232f-3d8a-458b-a703-b44073527d80"
    },
    {
      "type": "NodeLabel",
      "label": true,
      "size": {
        "width": 15,
        "height": 15
      },
      "position": {
        "x": 145,
        "y": 248.5
      },
      "attrs": {
        "label": {
          "refX": "50%",
          "textAnchor": "middle",
          "refY": "50%",
          "textVerticalAnchor": "middle"
        }
      },
      "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
      "z": 99,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
    },
    {
      "position": {
        "x": 135,
        "y": 357
      },
      "size": {
        "width": 384,
        "height": 187
      },
      "type": "Region",
      "attrs": {
        "name": {
          "text": "r2"
        }
      },
      "id": "99752277-d01b-4e0e-b5a2-161f957839d9",
      "z": 101,
      "embeds": [
        "96ef9688-7270-4a27-baa7-98db47d00ec3",
        "fe7ec85e-2e94-45cf-8b88-310007293559",
        "b1ab9e8c-474c-4e25-9bca-6dbcab1fc1a6",
        "881eac7b-67ac-4b4f-8c35-267925dd4cb0",
        "f22bd6d8-aaa6-43e1-93d9-a51b8d28fc3d",
        "485cf6ec-7bb6-49a4-a5f9-63703c78d01c"
      ]
    },
    {
      "position": {
        "x": 145,
        "y": 443
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
      "id": "881eac7b-67ac-4b4f-8c35-267925dd4cb0",
      "z": 104,
      "parent": "99752277-d01b-4e0e-b5a2-161f957839d9"
    },
    {
      "position": {
        "x": 201,
        "y": 211
      },
      "size": {
        "height": 60,
        "width": 84.60938262939453
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "A",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "e / raise l1"
        }
      },
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 108,
      "parent": "84c6232f-3d8a-458b-a703-b44073527d80"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
      },
      "target": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
      "z": 109,
      "parent": "84c6232f-3d8a-458b-a703-b44073527d80"
    },
    {
      "position": {
        "x": 426,
        "y": 210
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "B",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "db372094-acc6-467b-b44d-495606208445",
      "z": 110,
      "parent": "84c6232f-3d8a-458b-a703-b44073527d80"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "db372094-acc6-467b-b44d-495606208445",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 6,
            "dy": 9,
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
              "text": "l2"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
      "z": 111,
      "vertices": [],
      "parent": "84c6232f-3d8a-458b-a703-b44073527d80"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "db372094-acc6-467b-b44d-495606208445"
      },
      "target": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 60,
            "dy": 51,
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
              "text": "e"
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
      "router": {
        "name": "orthogonal",
        "args": {
          "padding": 8
        }
      },
      "id": "7197094a-c890-4098-9170-1701f27ac3cb",
      "z": 111,
      "parent": "84c6232f-3d8a-458b-a703-b44073527d80"
    },
    {
      "position": {
        "x": 426,
        "y": 420
      },
      "size": {
        "height": 60,
        "width": 71.64279556274414
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "D",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "f22bd6d8-aaa6-43e1-93d9-a51b8d28fc3d",
      "z": 112,
      "parent": "99752277-d01b-4e0e-b5a2-161f957839d9"
    },
    {
      "position": {
        "x": 193,
        "y": 421
      },
      "size": {
        "height": 61,
        "width": 84.60938262939453
      },
      "type": "State",
      "attrs": {
        "name": {
          "text": "C",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      },
      "id": "485cf6ec-7bb6-49a4-a5f9-63703c78d01c",
      "z": 114,
      "parent": "99752277-d01b-4e0e-b5a2-161f957839d9"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "f22bd6d8-aaa6-43e1-93d9-a51b8d28fc3d"
      },
      "target": {
        "id": "485cf6ec-7bb6-49a4-a5f9-63703c78d01c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 75.32140159606934,
            "dy": 50,
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
              "text": "f / raise l2"
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
      "id": "96ef9688-7270-4a27-baa7-98db47d00ec3",
      "z": 115,
      "parent": "99752277-d01b-4e0e-b5a2-161f957839d9"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "881eac7b-67ac-4b4f-8c35-267925dd4cb0"
      },
      "target": {
        "id": "485cf6ec-7bb6-49a4-a5f9-63703c78d01c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": -0.4832916259765625,
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
      "id": "fe7ec85e-2e94-45cf-8b88-310007293559",
      "z": 115,
      "parent": "99752277-d01b-4e0e-b5a2-161f957839d9"
    },
    {
      "type": "Transition",
      "attrs": {},
      "source": {
        "id": "485cf6ec-7bb6-49a4-a5f9-63703c78d01c"
      },
      "target": {
        "id": "f22bd6d8-aaa6-43e1-93d9-a51b8d28fc3d",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 8.321395874023438,
            "dy": 16.611114501953125,
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
              "text": "l1"
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
      "id": "b1ab9e8c-474c-4e25-9bca-6dbcab1fc1a6",
      "z": 115,
      "parent": "99752277-d01b-4e0e-b5a2-161f957839d9"
    }
  ]
}