import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid
import org.kde.plasma.core as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents

PlasmoidItem {
    id: root

    // Set the preferred size for the widget
    preferredRepresentation: fullRepresentation

    // The main view when the widget is expanded
    fullRepresentation: PlasmaComponents.Panel {
        // Use gridUnit for resolution independence instead of fixed pixels
        implicitWidth: PlasmaCore.Units.gridUnit * 16
        implicitHeight: PlasmaCore.Units.gridUnit * 22

        ColumnLayout {
            anchors.centerIn: parent
            spacing: PlasmaCore.Units.smallSpacing * 2

            Text {
                text: "Magnetar Heimarmene"
                color: PlasmaCore.Theme.textColor
                font.bold: true
                font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize * 1.5
                Layout.alignment: Qt.AlignHCenter
            }

            // Status Indicator (Task 102)
            Rectangle {
                id: statusIndicator
                implicitWidth: PlasmaCore.Units.gridUnit
                implicitHeight: PlasmaCore.Units.gridUnit
                radius: width / 2
                color: PlasmaCore.Theme.positiveBackgroundColor // Green means system is nominal
                Layout.alignment: Qt.AlignHCenter

                Text {
                    anchors.centerIn: parent
                    text: "✓"
                    color: PlasmaCore.Theme.textColor
                    font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize
                }
            }

            Text {
                text: "System Nominal"
                color: PlasmaCore.Theme.complementaryTextColor
                font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize
                Layout.alignment: Qt.AlignHCenter
            }
        }
    }

    // The icon view when the widget is on the panel (compact)
    compactRepresentation: MouseArea {
        id: compactRoot

        onClicked: {
            plasmoid.expanded = !plasmoid.expanded
        }

        Text {
            anchors.centerIn: parent
            text: "MH"
            color: PlasmaCore.Theme.textColor
            font.bold: true
        }
    }
}
