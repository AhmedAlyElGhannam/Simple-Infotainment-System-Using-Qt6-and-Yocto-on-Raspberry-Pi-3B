import QtQuick
// import QtQuick.VirtualKeyboard
// import QtLocation
// import QtPositioning

Window {
    id: window
    width: 1920
    height: 1080
    visibility: Window.FullScreen
    title: qsTr("InteriorLightControl_InfotainmentSystem")

    // array to hold images
    property var imageAssetArr: [
        "qrc:/Images/car-model-1.jpg", // 0
        "qrc:/Images/car-model-2.jpg", // 1
        "qrc:/Images/car-icon.png", // 2
        "qrc:/Images/lock.png", // 3
        "qrc:/Images/unlock.png", // 4
        "qrc:/Images/user.png", // 5
        "qrc:/Images/search.png", // 6
        "qrc:/Images/volume.png", // 7
        "qrc:/Images/iti-logo.png", // 8
        "qrc:/Images/play.png", // 9
        "qrc:/Images/next.png", // 10
        "qrc:/Images/previous.png", // 11
        "qrc:/Images/album-cover.png", // 12
        "qrc:/Images/star.png", // 13
        "qrc:/Images/playlist.png", // 14
        "qrc:/Images/tune.png", // 15
        "qrc:/Images/headlight.png", // 16
        "qrc:/Images/headlight-on.png", // 17
        "qrc:/Images/battery.png", // 18
        "qrc:/Images/location.png", // 19
        "qrc:/Images/iti-login.jpeg" // 20
    ]

    property bool loginScreenVisible: true

    Rectangle {
        id: loginScreen
        anchors.fill: parent
        color: "white"
        visible: loginScreenVisible
        z: 1 // crucial for displaying it over the entire app
        Image {
            id: itiLoginLogo
            anchors {
                verticalCenter: parent.verticalCenter
                centerIn: parent
            }
            height: parent.height * 0.85
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[20]
        }

        Timer {
            id: lockScreenTimer
            interval: 2000
            running: true
            onTriggered: loginScreenVisible = false
            repeat: false
        }
    }


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

        Image {
            id: volumeLevelIcon
            anchors {
                right: parent.right
                rightMargin: 30
                verticalCenter: parent.verticalCenter
            }
            height: parent.height * 0.7
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[7]
        }

        Image {
            id: itiLogo
            anchors {
                verticalCenter: parent.verticalCenter
                centerIn: parent
            }
            height: parent.height * 0.85
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[8]
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
        // Plugin {
        //     id: mapPlugin
        //     name: "osm"
        // }

        // // Map GUI component
        // Map {
        //     anchors.fill: parent
        //     plugin: mapPlugin
        //     center: QtPositioning.coordinate(30.076667, 31.018889) // iti smart village coordinates
        //     zoomLevel: 15
        // }
        Image {
            id: map
            anchors.fill: parent
            // width: parent.width
            // fillMode: Image.PreserveAspectFit
            source: imageAssetArr[19]
        }

        // mp3 player
        Rectangle {
            id: mp3Player
            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
            color: "#f8f5f5"
            height: parent.height / 6

            // album cover
            Image {
                id: albumCover
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    margins: 40
                }

                width: parent.width / 12
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[12]
            }
            Text {
                id: songName
                anchors {
                    top: albumCover.top
                    topMargin: 15
                    left: albumCover.right
                    leftMargin: 15
                }
                font.pixelSize: 21
                font.bold: true
                color: "#9e9d9d"
                text: "Court of The Crimson King"
            }
            Text {
                id: bandName
                anchors {
                    top: songName.bottom
                    topMargin: 5
                    left: songName.left
                }
                font.pixelSize: 14
                font.bold: true
                color: "#bebebe"
                text: "Crimson King"
            }
            Image {
                id: favIcon
                anchors {
                    top: bandName.bottom
                    topMargin: 5
                    right: songName.right
                    bottom: albumCover.bottom
                    bottomMargin: 5
                }

                width: parent.width / 40
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[13]
            }

            // controls
            Image {
                id: playIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                    centerIn: parent
                    margins: 75
                }

                width: parent.width / 50
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[9]
            }

            Image {
                id: playPreviousIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: playIcon.left
                    margins: 50
                }

                width: parent.width / 50
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[11]
            }

            Image {
                id: playNextIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: playIcon.right
                    margins: 50
                }

                width: parent.width / 50
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[10]
            }

            // rhs controls
            Image {
                id: tuneIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 40
                }

                width: parent.width / 40
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[15]
            }
            Image {
                id: musicSearchIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: tuneIcon.left
                    margins: 50
                }

                width: parent.width / 40
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[6]
            }
            Image {
                id: playlistIcon
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: musicSearchIcon.left
                    margins: 50
                }

                width: parent.width / 40
                fillMode: Image.PreserveAspectFit
                source: imageAssetArr[14]
            }

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
                leftMargin: 25
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
                leftMargin: 25
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
                leftMargin: 25
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

        // led control
        Image {
            id: lightControlIcon
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 20
                topMargin: 50
            }

            width: parent.width / 20
            fillMode: Image.PreserveAspectFit
            source: (lightControl.lightToggle ? imageAssetArr[16] : imageAssetArr[17])
            MouseArea {
                anchors.fill: parent
                onClicked: lightControl.setLightToggle(!lightControl.lightToggle)
            }
        }

        // battery indicator
        Image {
            id: batteryIndicator
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: 10
                topMargin: 10
            }
            width: parent.width / 20
            fillMode: Image.PreserveAspectFit
            source: imageAssetArr[18]
        }
        Text {
            id: batteryPercentage
            anchors {
                right: batteryIndicator.left
                top: batteryIndicator.top
                margins: 8
            }
            font.pixelSize: 12
            font.bold: true
            color: "#ABABAB"
            text: "86%"
        }
    }

}
