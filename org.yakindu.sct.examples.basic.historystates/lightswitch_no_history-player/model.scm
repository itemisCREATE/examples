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
      "id": "c0f7ca08-79c4-4b63-93ef-7978243da2c6",
      "linkable": false,
      "z": 1,
      "attrs": {
        "name": {
          "text": "LightSwitch_No_History"
        },
        "specification": {
          "text": "@CycleBased(200)\n\ninternal:\n\tvar brightness: integer\n\t\ninterface user:\n\tin event on_button\n\tin event off_button\n\tin event mode_button\n\t\ninterface sensor:\n\tin event motion\n\t\ninterface lum_sensor:\n \tin event bright\n \tin event dark"
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
        "width": 1258,
        "height": 625
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "z": 2,
      "embeds": [
        "c03ce275-a8dc-472f-b497-81165dbde55b",
        "cc05b9c6-8e4a-4b95-b035-22b682303fe7",
        "5c6a7c15-bfd9-4a43-9795-3f0b4a2d4803",
        "55661118-ceb1-432b-997e-dbe2e5a5fb34",
        "d18f0582-a359-477b-b1f2-759455997486",
        "dc220bfe-4a71-445d-b925-b38f7bf2fdb6",
        "e110bc12-cf68-4138-9b2a-9e64d5455676"
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
      "type": "State",
      "position": {
        "x": 533,
        "y": 491
      },
      "size": {
        "width": 142,
        "height": 62
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d18f0582-a359-477b-b1f2-759455997486",
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "z": 3,
      "attrs": {
        "name": {
          "text": "ManualMode"
        },
        "specification": {
          "text": "entry / brightness += 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 17,
        "y": 83
      },
      "size": {
        "width": 1197,
        "height": 331
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "dc220bfe-4a71-445d-b925-b38f7bf2fdb6",
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "z": 4,
      "embeds": [
        "1598b19c-1a20-4398-8dc3-885e36b5747e"
      ],
      "attrs": {
        "name": {
          "text": "AutomaticMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 18,
        "y": 123
      },
      "size": {
        "width": 1195,
        "height": 290
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "z": 5,
      "parent": "dc220bfe-4a71-445d-b925-b38f7bf2fdb6",
      "embeds": [
        "d7ef98be-16e6-4c70-aa04-5364fa29979f",
        "323aca6a-dc49-43a7-a952-e7ff75644820",
        "0b285518-4d4f-4851-8f76-1f7cf0a61927",
        "6aa2fe43-83bb-45bf-9a87-760d5dde96a4",
        "7b0b0978-50b0-4a8f-8a0b-1ce8b0176465",
        "383dc32d-04af-45d2-ba13-2c6ba1219c09"
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
        "x": 41,
        "y": 187
      },
      "size": {
        "width": 479,
        "height": 188
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "6aa2fe43-83bb-45bf-9a87-760d5dde96a4",
      "parent": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "z": 6,
      "embeds": [
        "e64f5a25-8a40-4369-ac95-676840c7d08c"
      ],
      "attrs": {
        "name": {
          "text": "TwilightDetectionMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 42,
        "y": 227
      },
      "size": {
        "width": 477,
        "height": 147
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "z": 7,
      "parent": "6aa2fe43-83bb-45bf-9a87-760d5dde96a4",
      "embeds": [
        "5ec0ad0b-ffbd-45f8-aa5b-baf8e1cf6037",
        "53e27ccd-938d-454e-8ae1-2834804b794e",
        "48d50c19-40de-4d09-afeb-ffbbf0953fa2",
        "3104eb5a-50d0-4e4f-b119-f4765ec7cd14",
        "cf29d38b-f8f2-447e-92c0-f707a2a32189",
        "3e97cea1-50aa-479a-810b-7de05d3f0d2a"
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
        "x": 102,
        "y": 276
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "3104eb5a-50d0-4e4f-b119-f4765ec7cd14",
      "parent": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "z": 8,
      "attrs": {
        "name": {
          "text": "Idle"
        },
        "specification": {
          "text": "entry / brightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 322,
        "y": 276
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "cf29d38b-f8f2-447e-92c0-f707a2a32189",
      "parent": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "z": 9,
      "attrs": {
        "name": {
          "text": "TwilightDetected"
        },
        "specification": {
          "text": "entry / brightness = 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 57,
        "y": 289
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "3e97cea1-50aa-479a-810b-7de05d3f0d2a",
      "parent": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "z": 10,
      "embeds": [
        "d93f1f71-ed92-4771-be6e-3730bfcbb5e4"
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
        "x": 57,
        "y": 304
      },
      "id": "d93f1f71-ed92-4771-be6e-3730bfcbb5e4",
      "z": 11,
      "parent": "3e97cea1-50aa-479a-810b-7de05d3f0d2a",
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
        "x": 664,
        "y": 186
      },
      "size": {
        "width": 522,
        "height": 198
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "7b0b0978-50b0-4a8f-8a0b-1ce8b0176465",
      "parent": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "z": 12,
      "embeds": [
        "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d"
      ],
      "attrs": {
        "name": {
          "text": "MotionDetectionMode"
        }
      }
    },
    {
      "type": "Region",
      "position": {
        "x": 665,
        "y": 226
      },
      "size": {
        "width": 520,
        "height": 157
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": false,
      "id": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "z": 13,
      "parent": "7b0b0978-50b0-4a8f-8a0b-1ce8b0176465",
      "embeds": [
        "053c8814-ca7f-4ccc-acc4-e98f922977fd",
        "ab85be75-887d-4dcf-bc19-dc7c985ba7c0",
        "138769b5-830d-4a05-bc2f-596e4bf99bfa",
        "46aad98b-5595-4d86-9875-5a458cfe728a",
        "2ffdf8d5-aeb8-46c3-b92d-432ac05a0e75",
        "d38f4ed6-20f5-4262-ae2f-3bfddc7ce6b6",
        "3de40ce2-550b-41d4-a79e-48e6283dbf52"
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
        "x": 725,
        "y": 275
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "2ffdf8d5-aeb8-46c3-b92d-432ac05a0e75",
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "z": 14,
      "attrs": {
        "name": {
          "text": "Idle"
        },
        "specification": {
          "text": "entry / brightness = 0",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "State",
      "position": {
        "x": 944,
        "y": 275
      },
      "size": {
        "width": 139,
        "height": 53
      },
      "angle": 0,
      "fixedRatio": false,
      "embedable": true,
      "linkable": true,
      "id": "d38f4ed6-20f5-4262-ae2f-3bfddc7ce6b6",
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "z": 15,
      "attrs": {
        "name": {
          "text": "MotionDetected"
        },
        "specification": {
          "text": "entry / brightness = 1",
          "fontSize": "9"
        }
      }
    },
    {
      "type": "Entry",
      "position": {
        "x": 686,
        "y": 288
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "3de40ce2-550b-41d4-a79e-48e6283dbf52",
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "z": 16,
      "embeds": [
        "c852cab6-d984-445f-b8dc-7df2fbbdff56"
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
        "x": 686,
        "y": 303
      },
      "id": "c852cab6-d984-445f-b8dc-7df2fbbdff56",
      "z": 17,
      "parent": "3de40ce2-550b-41d4-a79e-48e6283dbf52",
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
      "type": "Entry",
      "position": {
        "x": 697,
        "y": 149
      },
      "size": {
        "width": 15,
        "height": 15
      },
      "angle": 0,
      "fixedRatio": true,
      "embedable": false,
      "linkable": true,
      "id": "383dc32d-04af-45d2-ba13-2c6ba1219c09",
      "parent": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "z": 18,
      "embeds": [
        "91d20e2a-630c-451c-9926-88b46ad8b949"
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
        "x": 697,
        "y": 164
      },
      "id": "91d20e2a-630c-451c-9926-88b46ad8b949",
      "z": 19,
      "parent": "383dc32d-04af-45d2-ba13-2c6ba1219c09",
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
      "type": "Entry",
      "position": {
        "x": 81,
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
      "id": "e110bc12-cf68-4138-9b2a-9e64d5455676",
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "z": 20,
      "embeds": [
        "5d78a7cb-a736-4acd-ae8c-e6251969db5b"
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
        "x": 81,
        "y": 54
      },
      "id": "5d78a7cb-a736-4acd-ae8c-e6251969db5b",
      "z": 21,
      "parent": "e110bc12-cf68-4138-9b2a-9e64d5455676",
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
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "2ffdf8d5-aeb8-46c3-b92d-432ac05a0e75"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "3.3574706019888962%",
            "dy": "26.41509433962264%",
            "rotate": true
          }
        },
        "id": "d38f4ed6-20f5-4262-ae2f-3bfddc7ce6b6"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "sensor.motion",
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
      "id": "46aad98b-5595-4d86-9875-5a458cfe728a",
      "z": 22,
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "40.51122682861331%",
            "dy": "98.49056603773593%",
            "rotate": true
          }
        },
        "id": "d38f4ed6-20f5-4262-ae2f-3bfddc7ce6b6"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "43.22149877053773%",
            "dy": "99.62264150943399%",
            "rotate": true
          }
        },
        "id": "2ffdf8d5-aeb8-46c3-b92d-432ac05a0e75"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "after 30s",
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
      "id": "138769b5-830d-4a05-bc2f-596e4bf99bfa",
      "z": 23,
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "vertices": [
        {
          "x": 1000.3106052917725,
          "y": 352.4
        },
        {
          "x": 785.0778832910474,
          "y": 352.4
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
            "dx": "84.84889837218714%",
            "dy": "0.4964047760407289%",
            "rotate": true
          }
        },
        "id": "d18f0582-a359-477b-b1f2-759455997486"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "53.1733864401425%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "dc220bfe-4a71-445d-b925-b38f7bf2fdb6"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.off_button",
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
      "id": "55661118-ceb1-432b-997e-dbe2e5a5fb34",
      "z": 24,
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "74.98373599259793%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "d18f0582-a359-477b-b1f2-759455997486"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "29.913313457386657%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "d18f0582-a359-477b-b1f2-759455997486"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.on_button [brightness < 10]",
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
      "id": "5c6a7c15-bfd9-4a43-9795-3f0b4a2d4803",
      "z": 25,
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "vertices": [
        {
          "x": 639.476905109489,
          "y": 593
        },
        {
          "x": 575.476905109489,
          "y": 593
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
            "dy": "75.47169811320755%",
            "rotate": true
          }
        },
        "id": "d38f4ed6-20f5-4262-ae2f-3bfddc7ce6b6"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "96.50034810860996%",
            "dy": "92.45283018867924%",
            "rotate": true
          }
        },
        "id": "d38f4ed6-20f5-4262-ae2f-3bfddc7ce6b6"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "sensor.motion",
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
      "id": "ab85be75-887d-4dcf-bc19-dc7c985ba7c0",
      "z": 26,
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "vertices": [
        {
          "x": 1150.1354838709678,
          "y": 315
        },
        {
          "x": 1150.1354838709678,
          "y": 348
        },
        {
          "x": 1078.1354838709678,
          "y": 348
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
            "dy": "13.522012578616389%",
            "rotate": true
          }
        },
        "id": "3104eb5a-50d0-4e4f-b119-f4765ec7cd14"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "13.522012578616389%",
            "rotate": true
          }
        },
        "id": "cf29d38b-f8f2-447e-92c0-f707a2a32189"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "lum_sensor.dark",
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
      "id": "48d50c19-40de-4d09-afeb-ffbbf0953fa2",
      "z": 27,
      "parent": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "56.381402340813935%",
            "dy": "98.49056603773593%",
            "rotate": true
          }
        },
        "id": "cf29d38b-f8f2-447e-92c0-f707a2a32189"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "39.32567378932674%",
            "dy": "99.62264150943388%",
            "rotate": true
          }
        },
        "id": "3104eb5a-50d0-4e4f-b119-f4765ec7cd14"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "lum_sensor.bright",
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
      "id": "53e27ccd-938d-454e-8ae1-2834804b794e",
      "z": 28,
      "parent": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "vertices": [
        {
          "x": 400.37014925373137,
          "y": 348.4
        },
        {
          "x": 156.66268656716417,
          "y": 348.4
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
            "dy": "34.74053360872673%",
            "rotate": true
          }
        },
        "id": "6aa2fe43-83bb-45bf-9a87-760d5dde96a4"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.05083147120114929%",
            "dy": "33.49101170929609%",
            "rotate": true
          }
        },
        "id": "7b0b0978-50b0-4a8f-8a0b-1ce8b0176465"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.mode_button",
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
      "id": "0b285518-4d4f-4851-8f76-1f7cf0a61927",
      "z": 29,
      "parent": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "0.12155971484471627%",
            "dy": "19.4467047494475%",
            "rotate": true
          }
        },
        "id": "7b0b0978-50b0-4a8f-8a0b-1ce8b0176465"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "50%",
            "dy": "19.949189044630874%",
            "rotate": true
          }
        },
        "id": "6aa2fe43-83bb-45bf-9a87-760d5dde96a4"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.mode_button",
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
      "id": "323aca6a-dc49-43a7-a952-e7ff75644820",
      "z": 30,
      "parent": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "45.252024538900045%",
            "dy": "50%",
            "rotate": true
          }
        },
        "id": "dc220bfe-4a71-445d-b925-b38f7bf2fdb6"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "18.075164599037752%",
            "dy": "0.45517514347906285%",
            "rotate": true
          }
        },
        "id": "d18f0582-a359-477b-b1f2-759455997486"
      },
      "labels": [
        {
          "attrs": {
            "text": {
              "text": "user.on_button",
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
      "id": "cc05b9c6-8e4a-4b95-b035-22b682303fe7",
      "z": 31,
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "92.02321724709786%",
            "dy": "60%",
            "rotate": true
          }
        },
        "id": "3e97cea1-50aa-479a-810b-7de05d3f0d2a"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "8.710046887862847%",
            "dy": "41.509433962264154%",
            "rotate": true
          }
        },
        "id": "3104eb5a-50d0-4e4f-b119-f4765ec7cd14"
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
      "id": "5ec0ad0b-ffbd-45f8-aa5b-baf8e1cf6037",
      "z": 32,
      "parent": "e64f5a25-8a40-4369-ac95-676840c7d08c",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "98.27529021558955%",
            "dy": "53.333333333333336%",
            "rotate": true
          }
        },
        "id": "3de40ce2-550b-41d4-a79e-48e6283dbf52"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "5.02344393142204%",
            "dy": "39.62264150943396%",
            "rotate": true
          }
        },
        "id": "2ffdf8d5-aeb8-46c3-b92d-432ac05a0e75"
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
      "id": "053c8814-ca7f-4ccc-acc4-e98f922977fd",
      "z": 33,
      "parent": "0a5e80f0-2b3b-4e31-ad55-d79a52a1993d",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "57.49064952218305%",
            "dy": "88.88888888888896%",
            "rotate": true
          }
        },
        "id": "383dc32d-04af-45d2-ba13-2c6ba1219c09"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "7.973869239143191%",
            "dy": "0.08417508417509374%",
            "rotate": true
          }
        },
        "id": "7b0b0978-50b0-4a8f-8a0b-1ce8b0176465"
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
      "id": "d7ef98be-16e6-4c70-aa04-5364fa29979f",
      "z": 34,
      "parent": "1598b19c-1a20-4398-8dc3-885e36b5747e",
      "attrs": {}
    },
    {
      "type": "Transition",
      "source": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "96.29919517266026%",
            "dy": "49.29447852760736%",
            "rotate": true
          }
        },
        "id": "e110bc12-cf68-4138-9b2a-9e64d5455676"
      },
      "target": {
        "anchor": {
          "name": "topLeft",
          "args": {
            "dx": "11.728467715271352%",
            "dy": "0.05514058532426315%",
            "rotate": true
          }
        },
        "id": "dc220bfe-4a71-445d-b925-b38f7bf2fdb6"
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
      "id": "c03ce275-a8dc-472f-b497-81165dbde55b",
      "z": 35,
      "parent": "e68682aa-a5dc-40ec-925d-58e170c05bf2",
      "vertices": [
        {
          "x": 157.38975855179808,
          "y": 46.394171779141104
        }
      ],
      "attrs": {}
    }
  ]
}