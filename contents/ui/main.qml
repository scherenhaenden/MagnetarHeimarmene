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
        implicitWidth: PlasmaCore.Units.gridUnit * 20
        implicitHeight: PlasmaCore.Units.gridUnit * 30

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: PlasmaCore.Units.smallSpacing

            Text {
                text: "Magnetar Heimarmene"
                color: PlasmaCore.Theme.textColor
                font.bold: true
                font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize * 1.5
                Layout.alignment: Qt.AlignHCenter
            }

            // Calendar Manager (Data Source)
            CalendarManager {
                id: calendarManager
            }

            // Status Indicator (Task 102) - Kept for reference but smaller
            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: PlasmaCore.Units.smallSpacing

                Rectangle {
                    implicitWidth: PlasmaCore.Units.gridUnit * 0.5
                    implicitHeight: PlasmaCore.Units.gridUnit * 0.5
                    radius: width / 2
                    color: PlasmaCore.Theme.positiveBackgroundColor
                }
                Text {
                    text: "System Nominal"
                    color: PlasmaCore.Theme.complementaryTextColor
                    font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize * 0.8
                }
            }

            PlasmaComponents.ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                // Placeholder for the list of events
                ListView {
                    id: eventList
                    model: calendarManager.model
                    clip: true

                    delegate: Item {
                        width: ListView.view.width
                        height: PlasmaCore.Units.gridUnit * 2

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: PlasmaCore.Units.smallSpacing

                            // Note: We need to verify the roles provided by CalendarModel.
                            // Common roles: display, event, startDate, endDate, etc.
                            // Assuming 'display' or similar for now.
                            // Since we can't see the output, we will try to display generic info if model is empty.

                            Text {
                                text: model.display ? model.display : "Event"
                                color: PlasmaCore.Theme.textColor
                            }
                        }
                    }

                    // Add a placeholder if empty
                    Text {
                        anchors.centerIn: parent
                        text: eventList.count === 0 ? "No events found" : ""
                        visible: eventList.count === 0
                        color: PlasmaCore.Theme.disabledTextColor
                    }
                }
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
