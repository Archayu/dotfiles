import QtQuick
import Quickshell
import qs.theme

Rectangle {
    width: 34
    height: 34
    radius: 10
    color: Theme.surface_container

    Text {
        anchors.centerIn: parent
        text: "⏻"
        font.pixelSize: 25
        color: Theme.primary
    }

    MouseArea {
        anchors.fill: parent
        onClicked: Quickshell.execDetached(["wlogout"])
    }
}