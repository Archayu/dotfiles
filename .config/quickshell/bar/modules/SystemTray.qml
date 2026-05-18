import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import qs.theme

Rectangle {
    id: trayContainer
    color: Theme.surface_container
    radius: 10
    implicitWidth: trayRow.width + 12
    implicitHeight: trayRow.height + 12

    Row {
        id: trayRow
        anchors.centerIn: parent
        spacing: 6

    Repeater {
        model: SystemTray.items

        delegate: Item {
            id: trayItemRoot
            width: 24
            height: 24
         

            // Function to get material design icon based on app name
            function getMaterialIcon(title) {
                const lowerTitle = title.toLowerCase()
                
                if (lowerTitle.includes("network") || lowerTitle.includes("wifi") || lowerTitle.includes("nm-")) {
                    return "󰖩"  // Material Design network icon
                } else if (lowerTitle.includes("bluetooth") || lowerTitle.includes("blue")) {
                    return "󰂯"  // Material Design bluetooth icon
                } else if (lowerTitle.includes("discord") ||  lowerTitle.includes("vesktop") || lowerTitle.includes("vencord")) {
                    return "󰙯"  // Material Design chat icon
                }
                
                // Fallback to original icon if not recognized
                return null
            }

            Text {
                id: iconText
                anchors.centerIn: parent
                font {
                    family: "Material Design Icons"
                    pixelSize: 20
                }
                color: Theme.on_surface
                text: parent.getMaterialIcon(modelData.title) || ""
                visible: parent.getMaterialIcon(modelData.title) !== null
            }

            Image {
                anchors.fill: parent
                source: modelData.icon
                fillMode: Image.PreserveAspectFit
                smooth: true
                sourceSize.width: width
                sourceSize.height: height
                visible: parent.getMaterialIcon(modelData.title) === null
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.MiddleButton | Qt.RightButton

                onClicked: function(mouse) {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate()
                    } else if (mouse.button === Qt.MiddleButton) {
                        modelData.secondaryActivate()
                    } else if (mouse.button === Qt.RightButton && modelData.hasMenu) {
                        const p = mainBar.mapFromItem(trayItemRoot, mouse.x, mouse.y)
                        modelData.display(mainBar, Math.round(p.x), Math.round(p.y))
                    }
                }
            }
        }
    }
    }
}