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
      "id": "7d956db8-e436-46cb-9846-fcf5528572bd",
      "linkable": false,
      "z": 1,
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
        "x": 9,
        "y": 9
      },
      "size": {
        "width": 255,
        "height": 227
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "z": 2,
      "embeds": [
        "b1bb7086-fc46-42f4-a6c9-ea27940d431a",
        "3867482f-5f79-4406-b9d0-fb2236618d12",
        "db722577-d435-4a2f-a4ac-36a9b5f8f72b",
        "66ce1f09-050a-4104-bf29-c829dc5b4b87",
        "4e674d9c-6ca5-4e0a-87d7-f66267594232",
        "2ad91e83-e1fe-4487-b9d4-8716da4b4fa5"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": "9",
          "text": "main"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 43,
        "y": 51
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "66ce1f09-050a-4104-bf29-c829dc5b4b87",
      "parent": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "z": 3,
      "embeds": [
        "97b906e1-f51b-474a-993e-37e29a4be534"
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
        "x": 43,
        "y": 66
      },
      "id": "97b906e1-f51b-474a-993e-37e29a4be534",
      "z": 4,
      "parent": "66ce1f09-050a-4104-bf29-c829dc5b4b87",
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
        "x": 113,
        "y": 45
      },
      "size": {
        "width": 40,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "4e674d9c-6ca5-4e0a-87d7-f66267594232",
      "parent": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "z": 5,
      "attrs": {
        "name": {
          "text": "Off"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 113,
        "y": 155
      },
      "size": {
        "width": 40,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2ad91e83-e1fe-4487-b9d4-8716da4b4fa5",
      "parent": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "z": 6,
      "attrs": {
        "name": {
          "text": "On"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "88.8888888888889%",
            "dy": "36.666666666666664%",
            "rotate": true
          }
        },
        "id": "66ce1f09-050a-4104-bf29-c829dc5b4b87"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.416666666666643%",
            "dy": "21.69811320754717%",
            "rotate": true
          }
        },
        "id": "4e674d9c-6ca5-4e0a-87d7-f66267594232"
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
      "id": "db722577-d435-4a2f-a4ac-36a9b5f8f72b",
      "z": 7,
      "parent": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "63.20754716981132%",
            "rotate": true
          }
        },
        "id": "4e674d9c-6ca5-4e0a-87d7-f66267594232"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "2ad91e83-e1fe-4487-b9d4-8716da4b4fa5"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "switch",
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
      "id": "3867482f-5f79-4406-b9d0-fb2236618d12",
      "z": 8,
      "parent": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "vertices": [
        {
          "x": 86,
          "y": 78.5
        },
        {
          "x": 86,
          "y": 181.5
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
            "dy": "54.90566037735854%",
            "rotate": true
          }
        },
        "id": "2ad91e83-e1fe-4487-b9d4-8716da4b4fa5"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "60.94339622641509%",
            "rotate": true
          }
        },
        "id": "4e674d9c-6ca5-4e0a-87d7-f66267594232"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "switch",
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
      "id": "b1bb7086-fc46-42f4-a6c9-ea27940d431a",
      "z": 9,
      "parent": "b87be53c-caad-4e0b-b62d-f92a0b9b71c2",
      "vertices": [
        {
          "x": 179,
          "y": 184.10000000000002
        },
        {
          "x": 179,
          "y": 77.3
        }
      ],
      "attrs": {}
    }
  ]
}