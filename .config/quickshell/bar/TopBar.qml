import Quickshell
import Quickshell.Wayland
import QtQuick
import "modules"
import qs.theme

/**
 * The primary system status bar rendered across all monitors.
 */
Variants {
    id: root
    model: Quickshell.screens

    delegate: PanelWindow {
        id: mainBar

        required property var modelData
        screen: modelData

        WlrLayershell.layer: WlrLayer.Top
        WlrLayershell.namespace: "quickshell-topbar"

        anchors {
            top: true
            left: true
            right: true
        }

        color: "transparent"
        implicitHeight: Layout.topBarHeight

        // Workspace Switcher
        Workspaces {
            id: workspaceModule
            targetMonitor: modelData.name

            anchors {
                left: parent.left
                leftMargin: 15
                verticalCenter: parent.verticalCenter
            }
        }

        // Calendar
        Calendar {
            id: calendarModule
            anchors.centerIn: parent
        }

        // System Tray
        SystemTray {
            id: trayModule

            anchors {
                right: statusModule.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }

        // System Stats
        SystemStats {
            id: statusModule

            anchors {
                right: powerModule.left
                rightMargin: 10
                verticalCenter: parent.verticalCenter
            }
        }

        // Power Button
        PowerMenu {
            id: powerModule

            anchors {
                right: parent.right
                rightMargin: 15
                verticalCenter: parent.verticalCenter
            }
        }
    }
}