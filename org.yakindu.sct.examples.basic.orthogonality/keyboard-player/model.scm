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
      "id": "2f231437-8283-45e3-8679-2a463f103676",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "keyboard"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninterface:\n\tin event pressCapsLock\n\tin event pressNumLock\n"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 8,
        "y": 0
      },
      "size": {
        "width": 278,
        "height": 221
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "z": 2,
      "embeds": [
        "47ab051c-ac93-4b20-90d4-2ce765efda2a",
        "e3b3686c-beeb-4a1b-8053-b7820c77300b",
        "49fd8005-3b8e-48df-8a58-3a25c8624be3",
        "8b558cc5-660f-4b4d-938a-6daa35360456",
        "d653b839-e17d-42c2-bd9d-f68abc323a92",
        "9809ceb9-ec98-4d94-a4bf-ac28d6a707b8"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": "9",
          "text": "CapsLock"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 36,
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
      "id": "8b558cc5-660f-4b4d-938a-6daa35360456",
      "parent": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "z": 3,
      "embeds": [
        "ecfbf5e1-fc45-434f-9341-779533934870"
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
        "x": 36,
        "y": 66
      },
      "id": "ecfbf5e1-fc45-434f-9341-779533934870",
      "z": 4,
      "parent": "8b558cc5-660f-4b4d-938a-6daa35360456",
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
        "x": 85,
        "y": 35
      },
      "size": {
        "width": 85,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d653b839-e17d-42c2-bd9d-f68abc323a92",
      "parent": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "z": 5,
      "attrs": {
        "body": {
          "fill": "#F5D82C",
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "CapsLock_OFF"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 85,
        "y": 142
      },
      "size": {
        "width": 79,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "9809ceb9-ec98-4d94-a4bf-ac28d6a707b8",
      "parent": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "z": 6,
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "CapsLock_ON"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 280,
        "y": 0
      },
      "size": {
        "width": 261,
        "height": 221
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "z": 7,
      "embeds": [
        "2429150a-158c-4893-be03-8ab6b88d62b4",
        "779432d0-1e28-45a8-8c3c-998cd1bc2d25",
        "2c6182bb-fbe2-4d8d-9b33-7cbad41cdef1",
        "04218c71-4503-48b5-8b5d-547b313b93d1",
        "f6d580f2-1ddb-4019-8cd7-3b485ce0c754",
        "f5ee293a-a675-4e15-8ea1-68ed4ba611c4"
      ],
      "attrs": {
        "priority": {
          "text": 2
        },
        "name": {
          "fontSize": "9",
          "text": "NumLock"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 303,
        "y": 52
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "04218c71-4503-48b5-8b5d-547b313b93d1",
      "parent": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "z": 8,
      "embeds": [
        "6d8cca5e-7281-4453-9d1a-e6886b7a015f"
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
        "x": 303,
        "y": 67
      },
      "id": "6d8cca5e-7281-4453-9d1a-e6886b7a015f",
      "z": 9,
      "parent": "04218c71-4503-48b5-8b5d-547b313b93d1",
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
        "x": 361,
        "y": 36
      },
      "size": {
        "width": 79,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f6d580f2-1ddb-4019-8cd7-3b485ce0c754",
      "parent": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "z": 10,
      "attrs": {
        "body": {
          "fill": "#F5D82C",
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "NumLock_OFF"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 362,
        "y": 139
      },
      "size": {
        "width": 74,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f5ee293a-a675-4e15-8ea1-68ed4ba611c4",
      "parent": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "z": 11,
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "NumLock_ON"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "72.22222222222224%",
            "dy": "50.00000000000004%",
            "rotate": true
          }
        },
        "id": "8b558cc5-660f-4b4d-938a-6daa35360456"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "44.33962264150944%",
            "rotate": true
          }
        },
        "id": "d653b839-e17d-42c2-bd9d-f68abc323a92"
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
      "id": "49fd8005-3b8e-48df-8a58-3a25c8624be3",
      "z": 12,
      "parent": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "18.62745098039217%",
            "dy": "95.28301886792453%",
            "rotate": true
          }
        },
        "id": "d653b839-e17d-42c2-bd9d-f68abc323a92"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "20.042194092827017%",
            "dy": "4.716981132075472%",
            "rotate": true
          }
        },
        "id": "9809ceb9-ec98-4d94-a4bf-ac28d6a707b8"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pressCapsLock",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.5370370370370371,
            "offset": 51.82999999999999,
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
      "id": "e3b3686c-beeb-4a1b-8053-b7820c77300b",
      "z": 13,
      "parent": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "81.28874303276554%",
            "dy": "3.7735849056603774%",
            "rotate": true
          }
        },
        "id": "9809ceb9-ec98-4d94-a4bf-ac28d6a707b8"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "75.55071411280561%",
            "dy": "96.22641509433963%",
            "rotate": true
          }
        },
        "id": "d653b839-e17d-42c2-bd9d-f68abc323a92"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pressCapsLock",
              "fontSize": "9"
            }
          },
          "position": {
            "offset": 52.78,
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
      "id": "47ab051c-ac93-4b20-90d4-2ce765efda2a",
      "z": 14,
      "parent": "5adcb244-fac9-4b05-bcbd-b513453db02e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "84.95314591700132%",
            "dy": "48.88888888888891%",
            "rotate": true
          }
        },
        "id": "04218c71-4503-48b5-8b5d-547b313b93d1"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "44.02515723270441%",
            "rotate": true
          }
        },
        "id": "f6d580f2-1ddb-4019-8cd7-3b485ce0c754"
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
      "id": "2c6182bb-fbe2-4d8d-9b33-7cbad41cdef1",
      "z": 15,
      "parent": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.77240608001628%",
            "dy": "92.45283018867924%",
            "rotate": true
          }
        },
        "id": "f6d580f2-1ddb-4019-8cd7-3b485ce0c754"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "16.55432540974711%",
            "dy": "9.433962264150944%",
            "rotate": true
          }
        },
        "id": "f5ee293a-a675-4e15-8ea1-68ed4ba611c4"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pressNumLock",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.52,
            "offset": -76.75,
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
      "id": "779432d0-1e28-45a8-8c3c-998cd1bc2d25",
      "z": 16,
      "parent": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "60.80484098556384%",
            "dy": "4.402515723270458%",
            "rotate": true
          }
        },
        "id": "f5ee293a-a675-4e15-8ea1-68ed4ba611c4"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "58.2222561130598%",
            "dy": "97.48427672955972%",
            "rotate": true
          }
        },
        "id": "f6d580f2-1ddb-4019-8cd7-3b485ce0c754"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pressNumLock",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.52,
            "offset": -81,
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
      "id": "2429150a-158c-4893-be03-8ab6b88d62b4",
      "z": 17,
      "parent": "c7f43efe-ca1f-4986-a4b8-34583c5d46c2",
      "attrs": {}
    }
  ]
}