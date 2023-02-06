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
      "id": "c61e5c49-f8f4-4a2b-82f6-647a13ca0ed3",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "childfirst"
        },
        "specification": {
          "text": "@ChildFirstExecution\n@CycleBased(200)\n\ninterface:\n  in event e\n  var m : integer = 0\n  var n : integer = 0\n  var o : integer = 0"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 4,
        "y": 0
      },
      "size": {
        "width": 417,
        "height": 429
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "f8e0a667-0239-46cb-a603-462a925cc24c",
      "z": 2,
      "embeds": [
        "df33b6e4-03e6-467c-8ac3-3e33369a58c6",
        "c77f8a92-2e1e-41f3-870c-e4029df5713f",
        "b67eb288-2475-43e6-9771-037bf624d4d2",
        "4b7141ed-a359-4fb0-bf64-3e82ecaa43bd",
        "b2b05fa3-4f82-41b2-9c2e-ce73bbb51e91"
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
        "x": 86,
        "y": 48
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "b67eb288-2475-43e6-9771-037bf624d4d2",
      "parent": "f8e0a667-0239-46cb-a603-462a925cc24c",
      "z": 3,
      "embeds": [
        "1e091169-bc5d-4735-8a77-a4d6f53e8172"
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
        "x": 86,
        "y": 63
      },
      "id": "1e091169-bc5d-4735-8a77-a4d6f53e8172",
      "z": 4,
      "parent": "b67eb288-2475-43e6-9771-037bf624d4d2",
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
        "x": 73,
        "y": 107
      },
      "size": {
        "width": 208,
        "height": 302
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "4b7141ed-a359-4fb0-bf64-3e82ecaa43bd",
      "parent": "f8e0a667-0239-46cb-a603-462a925cc24c",
      "z": 5,
      "embeds": [
        "70675d40-8666-4022-ae90-641c029b97bc"
      ],
      "attrs": {
        "name": {
          "text": "A"
        },
        "specification": {
          "text": "entry / m = 1\ne / n = 1\nexit / o = 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 74,
        "y": 168
      },
      "size": {
        "width": 206,
        "height": 240
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "70675d40-8666-4022-ae90-641c029b97bc",
      "z": 6,
      "parent": "4b7141ed-a359-4fb0-bf64-3e82ecaa43bd",
      "embeds": [
        "6e0d1ca2-a571-4b99-80d2-9b5af32ec56b",
        "0a6d3538-3d3c-4a6d-b84e-9d50349db9db",
        "8e25f8e2-0c5b-4c86-a61b-5f89d171d8cb",
        "76ca553f-48e8-4f8f-92d1-6257589f9d02",
        "28a8064c-d355-481a-9cba-67e8e7001341"
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
        "x": 134,
        "y": 217
      },
      "size": {
        "width": 90,
        "height": 61
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8e25f8e2-0c5b-4c86-a61b-5f89d171d8cb",
      "parent": "70675d40-8666-4022-ae90-641c029b97bc",
      "z": 7,
      "attrs": {
        "name": {
          "text": "B"
        },
        "specification": {
          "text": "entry / m = 2\ne / n = 2\nexit / o = 2",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 92,
        "y": 240
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "76ca553f-48e8-4f8f-92d1-6257589f9d02",
      "parent": "70675d40-8666-4022-ae90-641c029b97bc",
      "z": 8,
      "embeds": [
        "37d23794-1833-4316-805c-d5fc6f9298d8"
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
        "x": 92,
        "y": 255
      },
      "id": "37d23794-1833-4316-805c-d5fc6f9298d8",
      "z": 9,
      "parent": "76ca553f-48e8-4f8f-92d1-6257589f9d02",
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
        "x": 131,
        "y": 320
      },
      "size": {
        "width": 98,
        "height": 62
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "28a8064c-d355-481a-9cba-67e8e7001341",
      "parent": "70675d40-8666-4022-ae90-641c029b97bc",
      "z": 10,
      "attrs": {
        "name": {
          "text": "C"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 336,
        "y": 111
      },
      "size": {
        "width": 40,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "b2b05fa3-4f82-41b2-9c2e-ce73bbb51e91",
      "parent": "f8e0a667-0239-46cb-a603-462a925cc24c",
      "z": 11,
      "attrs": {
        "name": {
          "text": "D"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "49.21313766596787%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "b67eb288-2475-43e6-9771-037bf624d4d2"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "9.799024350911143%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "4b7141ed-a359-4fb0-bf64-3e82ecaa43bd"
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
      "id": "c77f8a92-2e1e-41f3-870c-e4029df5713f",
      "z": 12,
      "parent": "f8e0a667-0239-46cb-a603-462a925cc24c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "96.6893424036281%",
            "dy": "42.59958071278826%",
            "rotate": true
          }
        },
        "id": "76ca553f-48e8-4f8f-92d1-6257589f9d02"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.3408919123204823%",
            "dy": "48.18022476543974%",
            "rotate": true
          }
        },
        "id": "8e25f8e2-0c5b-4c86-a61b-5f89d171d8cb"
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
      "id": "0a6d3538-3d3c-4a6d-b84e-9d50349db9db",
      "z": 13,
      "parent": "70675d40-8666-4022-ae90-641c029b97bc",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "80.15142718916304%",
            "dy": "9.597622828774393%",
            "rotate": true
          }
        },
        "id": "4b7141ed-a359-4fb0-bf64-3e82ecaa43bd"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "47.14117159037484%",
            "rotate": true
          }
        },
        "id": "b2b05fa3-4f82-41b2-9c2e-ce73bbb51e91"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "e",
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
      "id": "df33b6e4-03e6-467c-8ac3-3e33369a58c6",
      "z": 14,
      "parent": "f8e0a667-0239-46cb-a603-462a925cc24c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "58.00491629931748%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "8e25f8e2-0c5b-4c86-a61b-5f89d171d8cb"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "56.331045581005846%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "28a8064c-d355-481a-9cba-67e8e7001341"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "e",
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
      "id": "6e0d1ca2-a571-4b99-80d2-9b5af32ec56b",
      "z": 15,
      "parent": "70675d40-8666-4022-ae90-641c029b97bc",
      "attrs": {}
    }
  ]
}