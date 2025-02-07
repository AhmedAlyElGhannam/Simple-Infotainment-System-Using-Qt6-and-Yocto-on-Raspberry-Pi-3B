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
    }
    // right screen (Map + MP3)
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
        color: "blue"
    }

}
