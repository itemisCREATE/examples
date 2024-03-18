import QtQuick 2.10
import QtQuick.Window 2.10

Window {
    visible: true
    width: 400
    height: 400
    title: qsTr("CREATE Qt/C++ Traffic Light State Machine")

    Image {
        id: trafficLight
        objectName: "trafficLight"

        x: 0
        y: 0
        source: "images/background.png"

        function redOn() {
            red.visible = true;
        }

        function redOff() {
            red.visible = false;
        }

        function yellowOn() {
            yellow.visible = true;
        }

        function yellowOff() {
            yellow.visible = false;
        }

        function greenOn() {
            green.visible = true;
        }

        function greenOff() {
            green.visible = false;
        }

        Image {
            id: red
            x: 166
            y: 40
            source: "images/red.png"
        }

        Image {
            id: yellow
            x: 166
            y: 135
            source: "images/yellow.png"
        }

        Image {
            id: green
            x: 166
            y: 232
            source: "images/green.png"
        }

        MouseArea {
            id: control
            objectName: "control"

            x: 338
            y: 322
            width: 54
            height: 54


            signal pause()
            signal play()


            Image {
                id: pauseImage
                x: 0
                y: 0
                source: "images/pause.png"
            }

            Image {
                id: playImage
                x: 0
                y: 0
                source: "images/play.png"

                visible: false
            }


            onClicked: {
                if ( playImage.visible )
                {
                    playImage.visible = false;
                    pauseImage.visible = true;
                    play();
                }
                else
                {
                    pauseImage.visible = false;
                    playImage.visible = true;
                    pause();
                }
            }
        }

    }


}
