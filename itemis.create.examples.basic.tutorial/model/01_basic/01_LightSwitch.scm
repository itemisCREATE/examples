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
          "text": "_01_LightSwitch Export"
        },
        "specification": {
          "text": "@EventDriven\n\ninterface:\n\tin event switch"
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
        "width": 241,
        "height": 200
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "embeds": [
        "_3AT-w5OAEeWuO-fDDpYHyA",
        "_QwgAQJQ6EeWuO-fDDpYHyA",
        "_Er2m0JQzEeWuO-fDDpYHyA",
        "_3ASwp5OAEeWuO-fDDpYHyA",
        "_Muq1cJQtEeWuO-fDDpYHyA",
        "_3ASJk5OAEeWuO-fDDpYHyA"
      ],
      "id": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "z": 10,
      "attrs": {
        "name": {
          "text": "main"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 92,
        "y": 8
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
      "z": 12,
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
        "x": 97.5,
        "y": 131
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
      "z": 14,
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
      "type": "Transition",
      "source": {
        "id": "_Muq1cJQtEeWuO-fDDpYHyA"
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
              "text": 1
            }
          }
        }
      ],
      "vertices": [
        {
          "x": 168,
          "y": 171
        },
        {
          "x": 168,
          "y": 38
        }
      ],
      "id": "_QwgAQJQ6EeWuO-fDDpYHyA",
      "z": 15,
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
            "dx": 6,
            "dy": 36,
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
            "distance": 0.465901583312739,
            "offset": 31,
            "x": 0,
            "y": 0,
            "angle": 0
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
      "vertices": [
        {
          "x": 57,
          "y": 33
        },
        {
          "x": 57,
          "y": 126
        }
      ],
      "id": "_Er2m0JQzEeWuO-fDDpYHyA",
      "z": 16,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 50,
        "y": 10
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
      "z": 17,
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
      "z": 18,
      "parent": "_3AQ7cpOAEeWuO-fDDpYHyA",
      "attrs": {}
    }
  ]
}
