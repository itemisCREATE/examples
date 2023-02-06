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
      "id": "592faad3-287e-4fe1-927e-e2c9f57ce118",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "parentfirst"
        },
        "specification": {
          "text": "@ParentFirstExecution\n@CycleBased(200)\n\ninterface:\n  in event e\n  var m : integer = 0\n  var n : integer = 0\n  var o : integer = 0"
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
      "id": "ebeaaa6d-a225-4749-9e6c-7b26a269bb4a",
      "z": 2,
      "embeds": [
        "1dc9ecb5-63c5-4b54-bbac-bbce885d94da",
        "94669889-3f41-4f7a-8285-48292e2ea73a",
        "c0cf3307-9f4f-4654-a130-b702860ce15a",
        "468565f3-02ec-47ed-b767-059ee6703538",
        "3bde80cd-6d4f-4734-b8da-29b0187366be"
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
      "id": "c0cf3307-9f4f-4654-a130-b702860ce15a",
      "parent": "ebeaaa6d-a225-4749-9e6c-7b26a269bb4a",
      "z": 3,
      "embeds": [
        "d1981b5e-d299-4175-8f0c-ba7e8b20dc41"
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
      "id": "d1981b5e-d299-4175-8f0c-ba7e8b20dc41",
      "z": 4,
      "parent": "c0cf3307-9f4f-4654-a130-b702860ce15a",
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
      "id": "468565f3-02ec-47ed-b767-059ee6703538",
      "parent": "ebeaaa6d-a225-4749-9e6c-7b26a269bb4a",
      "z": 5,
      "embeds": [
        "2e4e6a7e-3473-42ca-aa30-50c306031ab8"
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
      "id": "2e4e6a7e-3473-42ca-aa30-50c306031ab8",
      "z": 6,
      "parent": "468565f3-02ec-47ed-b767-059ee6703538",
      "embeds": [
        "fdc3becd-797f-4dbf-ad00-252f67c9e2de",
        "edd55426-622e-45b1-9b6b-a35ee984af24",
        "dd246b60-002d-43d6-93d9-44dcffd46426",
        "98b9aba7-8ba0-4802-a6bc-74533a9768d8",
        "5687f149-dc3d-4416-95a7-c8cdf1e5467d"
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
      "id": "dd246b60-002d-43d6-93d9-44dcffd46426",
      "parent": "2e4e6a7e-3473-42ca-aa30-50c306031ab8",
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
        "x": 91,
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
      "id": "98b9aba7-8ba0-4802-a6bc-74533a9768d8",
      "parent": "2e4e6a7e-3473-42ca-aa30-50c306031ab8",
      "z": 8,
      "embeds": [
        "1b13a388-e60e-4a92-9c39-85754499aec5"
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
        "x": 91,
        "y": 255
      },
      "id": "1b13a388-e60e-4a92-9c39-85754499aec5",
      "z": 9,
      "parent": "98b9aba7-8ba0-4802-a6bc-74533a9768d8",
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
      "id": "5687f149-dc3d-4416-95a7-c8cdf1e5467d",
      "parent": "2e4e6a7e-3473-42ca-aa30-50c306031ab8",
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
      "id": "3bde80cd-6d4f-4734-b8da-29b0187366be",
      "parent": "ebeaaa6d-a225-4749-9e6c-7b26a269bb4a",
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
        "id": "c0cf3307-9f4f-4654-a130-b702860ce15a"
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
        "id": "468565f3-02ec-47ed-b767-059ee6703538"
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
      "id": "94669889-3f41-4f7a-8285-48292e2ea73a",
      "z": 12,
      "parent": "ebeaaa6d-a225-4749-9e6c-7b26a269bb4a",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "98.9115646258504%",
            "dy": "42.59958071278826%",
            "rotate": true
          }
        },
        "id": "98b9aba7-8ba0-4802-a6bc-74533a9768d8"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "2.970521541950101%",
            "dy": "48.18022476543974%",
            "rotate": true
          }
        },
        "id": "dd246b60-002d-43d6-93d9-44dcffd46426"
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
      "id": "edd55426-622e-45b1-9b6b-a35ee984af24",
      "z": 13,
      "parent": "2e4e6a7e-3473-42ca-aa30-50c306031ab8",
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
        "id": "468565f3-02ec-47ed-b767-059ee6703538"
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
        "id": "3bde80cd-6d4f-4734-b8da-29b0187366be"
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
      "id": "1dc9ecb5-63c5-4b54-bbac-bbce885d94da",
      "z": 14,
      "parent": "ebeaaa6d-a225-4749-9e6c-7b26a269bb4a",
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
        "id": "dd246b60-002d-43d6-93d9-44dcffd46426"
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
        "id": "5687f149-dc3d-4416-95a7-c8cdf1e5467d"
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
      "id": "fdc3becd-797f-4dbf-ad00-252f67c9e2de",
      "z": 15,
      "parent": "2e4e6a7e-3473-42ca-aa30-50c306031ab8",
      "attrs": {}
    }
  ]
}