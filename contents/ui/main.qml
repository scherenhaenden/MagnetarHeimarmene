import QtQuick
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root

    // Set the preferred size for the widget
    preferredRepresentation: fullRepresentation

    // The main view when the widget is expanded
    fullRepresentation: Item {
        width: root.availableWidth
        height: root.availableHeight

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            // Background with some opacity
            Rectangle {
                anchors.fill: parent
                color: Qt.rgba(0, 0, 0, 0.5)
                radius: 10
            }

            Column {
                anchors.centerIn: parent
                spacing: 10

                Text {
                    text: "Magnetar Heimarmene"
                    color: "white"
                    font.bold: true
                    font.pixelSize: 18
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                // Status Indicator (Task 102)
                Rectangle {
                    id: statusIndicator
                    width: 20
                    height: 20
                    radius: 10
                    color: "green" // Green means system is nominal
                    anchors.horizontalCenter: parent.horizontalCenter

                    Text {
                        anchors.centerIn: parent
                        text: "✓"
                        color: "white"
                        font.pixelSize: 12
                    }
                }

                Text {
                    text: "System Nominal"
                    color: "#aaaaaa"
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    // The icon view when the widget is on the panel (compact)
    compactRepresentation: MouseArea {
        id: compactRoot

        property bool active: false

        onClicked: {
            root.expanded = !root.expanded
        }

        Rectangle {
            anchors.fill: parent
            color: "transparent"

            Text {
                anchors.centerIn: parent
                text: "MH"
                color: "white"
                font.bold: true
            }
        }
    }
}
