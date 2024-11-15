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
          "text": "LightCtrl"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninterface:\n\tin event button\n\toperation setLight(lightOn: boolean): void"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 222.5,
        "y": 130
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "z": 2,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
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
        "x": 222.5,
        "y": 145
      },
      "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
      "z": 3,
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
      "type": "State",
      "position": {
        "x": 200,
        "y": 200
      },
      "size": {
        "height": 60,
        "width": 71.65876770019531
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 4,
      "attrs": {
        "name": {
          "text": "Light Off",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
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
        }
      ],
      "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
      "z": 6,
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 496,
        "y": 200
      },
      "size": {
        "width": 71.65876770019531,
        "height": 60
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "db372094-acc6-467b-b44d-495606208445",
      "z": 17,
      "embeds": [
        "0630eafe-d798-43d5-828d-6d176fa4a808"
      ],
      "attrs": {
        "name": {
          "text": "Light On",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "db372094-acc6-467b-b44d-495606208445",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 8,
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
              "text": "button / setLight(true)"
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
      "id": "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
      "z": 18,
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "db372094-acc6-467b-b44d-495606208445"
      },
      "target": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 52,
            "dy": 45,
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
              "text": "after 5s / setLight(false)"
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
      "id": "7197094a-c890-4098-9170-1701f27ac3cb",
      "z": 18,
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "db372094-acc6-467b-b44d-495606208445"
      },
      "target": {
        "id": "db372094-acc6-467b-b44d-495606208445",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 69,
            "dy": 35,
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
              "text": "button"
            }
          },
          "position": {
            "distance": 0.5791527129154926,
            "offset": 32.0369873046875,
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
        }
      ],
      "id": "0630eafe-d798-43d5-828d-6d176fa4a808",
      "z": 19,
      "parent": "db372094-acc6-467b-b44d-495606208445",
      "vertices": [
        {
          "x": 609,
          "y": 288
        }
      ],
      "attrs": {}
    }
  ]
}