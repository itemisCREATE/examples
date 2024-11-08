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
      "id": "077d5dce-b015-472d-bd9e-a2ec84218edb",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "Orthogonality"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninterface:\n\tin event proceed\n\tin event pa\n\tin event pb"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 26,
        "y": 0
      },
      "size": {
        "width": 779,
        "height": 399
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "506092c3-a7ab-404a-9cef-c36045692229",
      "z": 2,
      "embeds": [
        "dc0cb22d-b59e-42c0-b868-8c70285aa50c",
        "07be1acc-7057-47c3-800c-d8f1bca5a7fb",
        "309cf5e7-69fb-4da7-a2c5-f71f07a9aab6",
        "8bd0ae9f-a4d4-4667-9e26-508d11147703",
        "79ecbdce-0c1d-4f45-87e6-69c8834e1195",
        "7fb872e6-be4b-42f9-a7e2-0962e848fcb9",
        "1de89ab5-9f30-4b41-8d79-7e1cfe7e96a0",
        "f59338fa-537c-4f4d-8425-58588a9c77b1",
        "dbecd0ec-4779-4c1f-a6e6-685e89bdaa0b",
        "3c641471-981b-4194-a329-e83dd46dd9d6",
        "4ea50919-c6fc-4e28-b193-20b053a54048",
        "5aadbaad-0964-4c58-a1dc-684dd7636654",
        "2aed92ec-30f6-4972-8fc3-f4a267cef1b7",
        "8cce5025-d59a-4f66-b066-c663e67a9619",
        "fefa31b7-72bf-4ea0-924e-9506ddbb1ad1"
      ],
      "attrs": {
        "priority": {
          "text": 1
        },
        "name": {
          "fontSize": 9,
          "text": "main region"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 228.31005999509676,
        "y": 26
      },
      "size": {
        "width": 424,
        "height": 257
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "dbecd0ec-4779-4c1f-a6e6-685e89bdaa0b",
      "z": 99,
      "embeds": [
        "4e0afd31-5f82-4681-9af6-521de78a8a36",
        "857e6d13-2334-4b3f-9f11-db862f34a40f"
      ],
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Process"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 229.31005999509676,
        "y": 66
      },
      "size": {
        "width": 210.61263030293762,
        "height": 216
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "4e0afd31-5f82-4681-9af6-521de78a8a36",
      "z": 100,
      "embeds": [
        "5e514f70-1c97-4e8f-a537-2e54823e6d5b",
        "6972e023-04ee-4e68-a30e-84c90253cf8c",
        "60625f66-5293-45aa-a88f-957b029bb888"
      ],
      "parent": "dbecd0ec-4779-4c1f-a6e6-685e89bdaa0b",
      "attrs": {
        "name": {
          "fontSize": 9,
          "text": "r1"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 439.92269029803435,
        "y": 66
      },
      "size": {
        "width": 211.3873696970624,
        "height": 216
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "857e6d13-2334-4b3f-9f11-db862f34a40f",
      "z": 101,
      "embeds": [
        "fe8ef8bd-6904-4c4e-a6db-987d8962ba44",
        "f1a1d37a-564b-4f89-9f25-c6b8250729fc",
        "5d21453b-bd97-4ca5-8fcb-5ee6b1116dfe"
      ],
      "parent": "dbecd0ec-4779-4c1f-a6e6-685e89bdaa0b",
      "attrs": {
        "name": {
          "fontSize": 9,
          "text": "r2"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 256.31005999509676,
        "y": 87
      },
      "size": {
        "width": 63,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "6972e023-04ee-4e68-a30e-84c90253cf8c",
      "parent": "4e0afd31-5f82-4681-9af6-521de78a8a36",
      "z": 103,
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Line A 1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 366.31005999509676,
        "y": 87
      },
      "size": {
        "width": 63,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "60625f66-5293-45aa-a88f-957b029bb888",
      "parent": "4e0afd31-5f82-4681-9af6-521de78a8a36",
      "z": 104,
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Line A 2"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "92.80338397985462%",
            "dy": "54.08805031446544%",
            "rotate": true
          }
        },
        "id": "6972e023-04ee-4e68-a30e-84c90253cf8c"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "7.396089749030875%",
            "dy": "54.08805031446544%",
            "rotate": true
          }
        },
        "id": "60625f66-5293-45aa-a88f-957b029bb888"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pa",
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
      "id": "5e514f70-1c97-4e8f-a537-2e54823e6d5b",
      "z": 108,
      "parent": "4e0afd31-5f82-4681-9af6-521de78a8a36",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 461.267660300486,
        "y": 180
      },
      "size": {
        "width": 63,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "f1a1d37a-564b-4f89-9f25-c6b8250729fc",
      "z": 117,
      "parent": "857e6d13-2334-4b3f-9f11-db862f34a40f",
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Line B 1"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 564.7025331370806,
        "y": 180
      },
      "size": {
        "width": 63,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "5d21453b-bd97-4ca5-8fcb-5ee6b1116dfe",
      "z": 119,
      "parent": "857e6d13-2334-4b3f-9f11-db862f34a40f",
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Line B 2"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "99.7354497354498%",
            "dy": "40.56603773584906%",
            "rotate": true
          }
        },
        "id": "f1a1d37a-564b-4f89-9f25-c6b8250729fc"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "40.56603773584906%",
            "rotate": true
          }
        },
        "id": "5d21453b-bd97-4ca5-8fcb-5ee6b1116dfe"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "pb",
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
      "id": "fe8ef8bd-6904-4c4e-a6db-987d8962ba44",
      "z": 120,
      "parent": "857e6d13-2334-4b3f-9f11-db862f34a40f",
      "attrs": {}
    },
    {
      "type": "Synchronization",
      "position": {
        "x": 176,
        "y": 97
      },
      "size": {
        "width": 8,
        "height": 47
      },
      "angle": 0,
      "fillOpacity": 1,
      "embedable": false,
      "linkable": true,
      "id": "3c641471-981b-4194-a329-e83dd46dd9d6",
      "z": 121,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "3c641471-981b-4194-a329-e83dd46dd9d6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "20%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "6972e023-04ee-4e68-a30e-84c90253cf8c",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "44%",
            "dy": "37%",
            "rotate": true
          }
        }
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
      "id": "1de89ab5-9f30-4b41-8d79-7e1cfe7e96a0",
      "z": 122,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "vertices": [],
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "3c641471-981b-4194-a329-e83dd46dd9d6",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "79%",
            "rotate": true
          }
        }
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
        "id": "f1a1d37a-564b-4f89-9f25-c6b8250729fc"
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
              "text": "2"
            }
          }
        }
      ],
      "id": "f59338fa-537c-4f4d-8425-58588a9c77b1",
      "z": 122,
      "vertices": [
        {
          "x": 212,
          "y": 134.13
        },
        {
          "x": 212,
          "y": 206.5
        }
      ],
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 47,
        "y": 91
      },
      "size": {
        "width": 72,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "4ea50919-c6fc-4e28-b193-20b053a54048",
      "z": 123,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Initialize"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "id": "4ea50919-c6fc-4e28-b193-20b053a54048",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "64%",
            "dy": "46%",
            "rotate": true
          }
        }
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "39.007092198581574%",
            "rotate": true
          }
        },
        "id": "3c641471-981b-4194-a329-e83dd46dd9d6"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "proceed",
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
      "id": "7fb872e6-be4b-42f9-a7e2-0962e848fcb9",
      "z": 124,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Entry",
      "position": {
        "x": 75.5,
        "y": 39
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "5aadbaad-0964-4c58-a1dc-684dd7636654",
      "z": 125,
      "embeds": [
        "a9ea2df1-e931-4a8b-a668-1e30bf7c1e5d"
      ],
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
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
        "x": 75.5,
        "y": 54
      },
      "id": "a9ea2df1-e931-4a8b-a668-1e30bf7c1e5d",
      "z": 126,
      "parent": "5aadbaad-0964-4c58-a1dc-684dd7636654",
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
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "56.666666666666664%",
            "rotate": true
          }
        },
        "id": "5aadbaad-0964-4c58-a1dc-684dd7636654"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "46.22641509433962%",
            "rotate": true
          }
        },
        "id": "4ea50919-c6fc-4e28-b193-20b053a54048"
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
      "id": "79ecbdce-0c1d-4f45-87e6-69c8834e1195",
      "z": 127,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Synchronization",
      "position": {
        "x": 683,
        "y": 225
      },
      "size": {
        "width": 81,
        "height": 8
      },
      "angle": 0,
      "fillOpacity": 1,
      "embedable": false,
      "linkable": true,
      "id": "2aed92ec-30f6-4972-8fc3-f4a267cef1b7",
      "z": 136,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "60625f66-5293-45aa-a88f-957b029bb888",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "55.42452830188679%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "2aed92ec-30f6-4972-8fc3-f4a267cef1b7",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "79%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "always",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.582426387126928,
            "offset": -9.379999999999995,
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
      "id": "309cf5e7-69fb-4da7-a2c5-f71f07a9aab6",
      "z": 137,
      "vertices": [
        {
          "x": 747,
          "y": 116.38
        }
      ],
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "5d21453b-bd97-4ca5-8fcb-5ee6b1116dfe",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "48.603623839472846%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "target": {
        "id": "2aed92ec-30f6-4972-8fc3-f4a267cef1b7",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "17%",
            "dy": "50%",
            "rotate": true
          }
        }
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "always",
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
      "id": "8bd0ae9f-a4d4-4667-9e26-508d11147703",
      "z": 137,
      "vertices": [
        {
          "x": 697,
          "y": 206.5
        }
      ],
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "State",
      "position": {
        "x": 685.5,
        "y": 259
      },
      "size": {
        "width": 76,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "8cce5025-d59a-4f66-b066-c663e67a9619",
      "z": 138,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {
        "body": {
          "oldFill": "#CEDCEA",
          "oldStroke": "#F2F2F2"
        },
        "name": {
          "text": "Cleanup"
        }
      }
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.49794238683132%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "2aed92ec-30f6-4972-8fc3-f4a267cef1b7"
      },
      "target": {
        "id": "8cce5025-d59a-4f66-b066-c663e67a9619",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "54%",
            "dy": "10%",
            "rotate": true
          }
        }
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
      "id": "07be1acc-7057-47c3-800c-d8f1bca5a7fb",
      "z": 139,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Final",
      "position": {
        "x": 716,
        "y": 370
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "fefa31b7-72bf-4ea0-924e-9506ddbb1ad1",
      "z": 140,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "id": "8cce5025-d59a-4f66-b066-c663e67a9619",
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "47%",
            "rotate": true
          }
        }
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "47.77777777777828%",
            "dy": "3.3333333333333335%",
            "rotate": true
          }
        },
        "id": "fefa31b7-72bf-4ea0-924e-9506ddbb1ad1"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "proceed",
              "fontSize": "9"
            }
          },
          "position": {
            "distance": 0.4480474731506966,
            "offset": -24.659566396809534,
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
      "id": "dc0cb22d-b59e-42c0-b868-8c70285aa50c",
      "z": 141,
      "parent": "506092c3-a7ab-404a-9cef-c36045692229",
      "attrs": {}
    }
  ]
}