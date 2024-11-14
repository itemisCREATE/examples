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
      "id": "_3AQUYJOAEeWuO-fDDpYHyA",
      "linkable": true,
      "fixedRatio": false,
      "embedable": true,
      "z": 0,
      "attrs": {
        "name": {
          "text": "_01_LightSwitch"
        },
        "specification": {
          "text": "@EventDriven\n\ninterface:\n\tin event switch"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 430,
        "y": 193
      },
      "size": {
        "height": 200,
        "width": 241
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "5fcd9884-4765-4b87-bb28-8bcd97546e56",
        "_QwgAQJQ6EeWuO-fDDpYHyA",
        "_3AT-w5OAEeWuO-fDDpYHyA",
        "_3ASwp5OAEeWuO-fDDpYHyA",
        "_Muq1cJQtEeWuO-fDDpYHyA",
        "_3ASJk5OAEeWuO-fDDpYHyA"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 19,
      "attrs": {
        "name": {
          "text": "main"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 522,
        "y": 201
      },
      "size": {
        "height": 53,
        "width": 40
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_3ASwp5OAEeWuO-fDDpYHyA",
      "z": 20,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "Off",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 527.5,
        "y": 324
      },
      "size": {
        "height": 53,
        "width": 40
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "embeds": [],
      "id": "_Muq1cJQtEeWuO-fDDpYHyA",
      "z": 21,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "text": "On",
          "fill": "#CFD8DC",
          "fontSize": 12
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 480,
        "y": 203
      },
      "size": {
        "height": 15,
        "width": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "_3ASJk5OAEeWuO-fDDpYHyA",
      "z": 24,
      "markup": "\n    <g class=\"scalable default-outline\" stroke-linejoin=\"round\">\n      <circle cx=\"50\" cy=\"50\" r=\"50\" fill=\"#000000\"/>\n      <text font-family=\"FontAwesome\" font-size=\"13\" x=\"-5\" y=\"0\" opacity=\"0\" fill=\"#00ff00\" text=\"\"/>\n    </g>\n  ",
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {
        "name": {
          "fill": "#CFD8DC"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "_3ASJk5OAEeWuO-fDDpYHyA"
      },
      "target": {
        "id": "_3ASwp5OAEeWuO-fDDpYHyA"
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
          "position": {
            "x": 0,
            "y": 0
          }
        },
        {
          "attrs": {
            "label": {
              "text": 1
            }
          }
        }
      ],
      "vertices": [],
      "id": "_3AT-w5OAEeWuO-fDDpYHyA",
      "z": 25,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_Muq1cJQtEeWuO-fDDpYHyA"
      },
      "target": {
        "id": "_3ASwp5OAEeWuO-fDDpYHyA",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 29,
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
              "text": "switch"
            }
          },
          "position": {
            "distance": 0.5059468032751314,
            "offset": 33,
            "x": 0,
            "y": 0,
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
      "vertices": [
        {
          "x": 598,
          "y": 364
        },
        {
          "x": 598,
          "y": 231
        }
      ],
      "id": "_QwgAQJQ6EeWuO-fDDpYHyA",
      "z": 27,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "_3ASwp5OAEeWuO-fDDpYHyA"
      },
      "target": {
        "id": "_Muq1cJQtEeWuO-fDDpYHyA",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": 4.5,
            "dy": 36.111114501953125,
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
              "text": "switch"
            }
          },
          "position": {
            "distance": 0.4377999267925989,
            "offset": 27,
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
      "id": "5fcd9884-4765-4b87-bb28-8bcd97546e56",
      "z": 28,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "vertices": [
        {
          "x": 492,
          "y": 234
        },
        {
          "x": 492,
          "y": 360.11
        }
      ],
      "attrs": {}
    }
  ]
}