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
          "text": "StateMachine"
        },
        "specification": {
          "text": "@EventDriven\n\ninterface:\nin event inEvent1\nin event inEvent2\n\nout event outEvent1\nout event outEvent2\n"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 340,
        "y": 241
      },
      "size": {
        "height": 267,
        "width": 508
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "z": 43,
      "embeds": [
        "44ee3102-6c46-4c5a-b430-3034cb668558",
        "1d3e95d1-4642-46c8-82c5-19f7649ea6fa",
        "f4fdd1fd-fc69-42a9-a51b-34aeb2fd7fe4",
        "7197094a-c890-4098-9170-1701f27ac3cb",
        "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "36b8548a-74b1-4925-ae23-291c03231ee6",
        "db372094-acc6-467b-b44d-495606208445",
        "db8002b7-2f1c-4dfb-a78f-5a197c464389"
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
        "x": 422.0000057220459,
        "y": 292.3046875
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
      "z": 44,
      "embeds": [
        "f70f632c-e54d-4002-9ec5-7baec620de10"
      ],
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 395.0000057220459,
        "y": 350.8046875
      },
      "size": {
        "height": 60.390625,
        "width": 160
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
      "z": 45,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "attrs": {
        "name": {
          "text": "StateA",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\nraise outEvent1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 645.0000057220459,
        "y": 350.8046875
      },
      "size": {
        "height": 60.390625,
        "width": 162
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "db372094-acc6-467b-b44d-495606208445",
      "z": 46,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "attrs": {
        "name": {
          "text": "StateB",
          "fill": "#CFD8DC",
          "fontSize": 12
        },
        "specification": {
          "text": "entry /\nraise outEvent2"
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
        "x": 422.0000057220459,
        "y": 307.3046875
      },
      "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
      "z": 50,
      "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
      "attrs": {
        "label": {
          "fill": "#C5C8C6",
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
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "db372094-acc6-467b-b44d-495606208445",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 2,
            "dy": 22.111114501953125,
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
              "text": "inEvent1"
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
      "z": 51,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "vertices": [],
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
        }
      ],
      "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
      "z": 51,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
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
            "dx": 146,
            "dy": 49.1953125,
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
              "text": "after 2 s"
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
      "id": "1d3e95d1-4642-46c8-82c5-19f7649ea6fa",
      "z": 52,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "attrs": {}
    },
    {
      "type": "Final",
      "position": {
        "x": 467.5000057220459,
        "y": 453
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "db8002b7-2f1c-4dfb-a78f-5a197c464389",
      "z": 55,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
      },
      "target": {
        "id": "db8002b7-2f1c-4dfb-a78f-5a197c464389"
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
              "text": "inEvent2"
            }
          },
          "position": {
            "distance": 0.523923590993197,
            "offset": 44,
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
      "id": "44ee3102-6c46-4c5a-b430-3034cb668558",
      "z": 56,
      "parent": "7619016a-fdfc-4d8c-996b-c4f435c5720d",
      "attrs": {}
    }
  ]
}