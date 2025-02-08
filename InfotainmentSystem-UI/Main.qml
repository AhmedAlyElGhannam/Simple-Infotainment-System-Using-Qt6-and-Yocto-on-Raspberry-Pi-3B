import QtQuick
import QtQuick.VirtualKeyboard
import QtLocation
import QtPositioning

Window {
    id: window
    width: 1920
    height: 1080
    visible: true
    title: qsTr("InteriorLightControl_InfotainmentSystem")

    // array to hold images
    property var imageAssetArr: [
        "qrc:/Images/car-model-1.jpg",
        "qrc:/Images/car-model-2.jpg",
        "qrc:/Images/car-icon.png",
        "qrc:/Images/lock.png",
        "qrc:/Images/unlock.png",
        "qrc:/Images/user.png",
        "qrc:/Images/search.png"
    ]

    // bottom bar
    Rectangle {
        id: bottomBar
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: "black"
        height: parent.height / 12

        Image {
            id: carSettingsIcon
            anchors {
                left: parent.left
                leftMargin: 30
                verticalCenter: parent.verticalCenter
            }
            height: parent.height * 0.85
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[2]
        }

        Rectangle {
            id: passangerHVACControl
            anchors {
                top: parent.top
                bottom: parent.bottom
                left: carSettingsIcon.right
                leftMargin: 150
            }

        }
    }

    // right screen (Map + MP3 + info)
    Rectangle {
        id: rightScreen
        anchors {
            top: parent.top
            bottom: bottomBar.top
            right: parent.right
        }

        // indicates that open-source map component will be used
        Plugin {
            id: mapPlugin
            name: "osm"
        }

        // Map GUI component
        Map {
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(30.076667, 31.018889) // iti smart village coordinates
            zoomLevel: 15
        }

        Image {
            id: lockIcon
            anchors {
                left: parent.left
                top: parent.top
                margins: 20
            }

            width: parent.width / 50
            fillMode: Image.PreserveAspectFit
            source: (systemHandler.carLocked ? imageAssetArr[3] : imageAssetArr[4])
            MouseArea {
                anchors.fill: parent
                onClicked: systemHandler.carLocked = !systemHandler.carLocked
            }
        }

        Text {
            id: dateTimeDisplay
            anchors {
                left: lockIcon.right
                leftMargin: 40
                bottom: lockIcon.bottom
            }
            font.pixelSize: 12
            font.bold: true
            color: "black"
            text: systemHandler.currentTime
        }

        Text {
            id: outdoorTempDisplay
            anchors {
                left: dateTimeDisplay.right
                leftMargin: 40
                bottom: lockIcon.bottom
            }
            font.pixelSize: 12
            font.bold: true
            color: "black"
            text: systemHandler.outdoorTemp + "°C"
        }

        Image {
            id: userIcon
            anchors {
                left: outdoorTempDisplay.right
                leftMargin: 40
                bottom: lockIcon.bottom
            }

            width: parent.width / 50
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[5]
        }

        Text {
            id: userName
            anchors {
                left: userIcon.right
                leftMargin: 10
                bottom: lockIcon.bottom
            }
            font.pixelSize: 12
            font.bold: true
            color: "black"
            text: systemHandler.userName
        }

        // search bar
        Rectangle {
            id: navSearchBar
            color: "#ede9e8"
            radius: 5
            anchors {
                left: lockIcon.left
                top: lockIcon.bottom
                topMargin: 15
            }
            Image {
                id: searchIcon
                anchors {
                    left: parent.left
                    leftMargin: 25
                    verticalCenter: parent.verticalCenter
                }
                height: parent.height * 0.5
                width: 30
                source: imageAssetArr[6]

            }

            Text {
                id: searchBarTxt
                visible: searchBarTxtInput.text === ""
                color: "#ABA5A5"
                text: "Navigate"
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: searchIcon.right
                    leftMargin: 20
                }
            }

            TextInput{
                id: searchBarTxtInput
                clip: true
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    right: parent.right
                    left: searchIcon.right
                    leftMargin: 20
                    rightMargin: 20
                }
                verticalAlignment: Text.AlignVCenter
            }
            width: parent.width * (1/3)
            height: parent.height * (1/12)
        }

        width: parent.width * (2/3)
    }
    // left screen (Car UI + LED Control)
    Rectangle {
        id: leftScreen
        anchors {
            top: parent.top
            bottom: bottomBar.top
            right: rightScreen.left
            left: parent.left
        }

        Image {
            id: carRender
            anchors.centerIn: parent
            width: parent.width * 0.85
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[1]
        }
    }

}
