import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true
    objectName: "fkd"

    width: 320
    height: 320

    Item {
        id: root
        anchors.fill: parent

        function setLight(state) {
            if(state) {
                light.color = "yellow"
            } else {
                light.color = "#333333"
            }
        }

        signal button_evt()

        objectName: "fh"

        Rectangle {
            id: button
            anchors.left: parent.left
            anchors.right: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            anchors.margins: 20

            color: "grey"

            height: width

            Text {
                anchors.centerIn: parent
                text: "Button"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.button_evt()
                }
            }
        }

        Rectangle {
            id: houseContainer
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.horizontalCenter

            Rectangle {
                id: light
                anchors.centerIn: parent

                color: "#333333"

                width: 30
                height: 30

                anchors.horizontalCenterOffset: -30
                anchors.verticalCenterOffset: 35
            }

            Image {
                id: house
                source: "house-48909_1280.png"

                width: parent.width
                anchors.centerIn: parent
                fillMode: Image.PreserveAspectFit
            }
        }
    }


}

