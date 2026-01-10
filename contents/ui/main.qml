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

            // Header for the date
            Text {
                text: Qt.formatDate(calendarManager.currentDate, "dddd, MMMM d, yyyy")
                color: PlasmaCore.Theme.highlightColor
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }

            PlasmaComponents.ScrollView {
                Layout.fillWidth: true
                Layout.fillHeight: true

                // We want to display the events for the selected date.
                // The CalendarModel provides days for the month.
                // We will iterate over the days and only show the one matching currentDate.
                ListView {
                    id: eventList
                    model: calendarManager.model
                    clip: true

                    delegate: Item {
                        // Check if this item corresponds to the selected date
                        // CalendarModel typically provides 'day', 'month', 'year' roles
                        // We also check if 'events' are present.
                        readonly property bool isSelectedDay: {
                            return model.day === calendarManager.currentDate.getDate() &&
                                   model.month === calendarManager.currentDate.getMonth() + 1 &&
                                   model.year === calendarManager.currentDate.getFullYear()
                        }

                        visible: isSelectedDay
                        height: visible ? contentCol.height : 0
                        width: ListView.view.width

                        ColumnLayout {
                            id: contentCol
                            width: parent.width
                            spacing: PlasmaCore.Units.smallSpacing

                            // Iterate over the events for this day
                            // model.events is expected to be a list/array of event objects
                            Repeater {
                                model: model.events
                                delegate: RowLayout {
                                    Layout.fillWidth: true

                                    Rectangle {
                                        width: 4
                                        height: parent.height
                                        color: modelData.color ? modelData.color : PlasmaCore.Theme.highlightColor
                                        visible: !!modelData.color
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        Text {
                                            text: modelData.title
                                            color: PlasmaCore.Theme.textColor
                                            font.bold: true
                                        }
                                        Text {
                                            text: modelData.description || ""
                                            color: PlasmaCore.Theme.disabledTextColor
                                            visible: text.length > 0
                                            font.pixelSize: PlasmaCore.Theme.defaultFont.pixelSize * 0.9
                                        }
                                    }
                                }
                            }

                            // Fallback if no events for this day
                            Text {
                                text: (!model.events || model.events.length === 0) ? "No events for this day" : ""
                                visible: text.length > 0
                                color: PlasmaCore.Theme.disabledTextColor
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }

                    // Add a placeholder if empty
                    // Using overlay property from Flickable
                    overlay: Text {
                        anchors.centerIn: parent
                        text: "No events found"
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
        hoverEnabled: true

        onClicked: {
            plasmoid.expanded = !plasmoid.expanded
        }

        Text {
            anchors.centerIn: parent
            text: "MH"
            color: PlasmaCore.Theme.textColor
            font.bold: true
        }

        PlasmaComponents.ToolTip {
            text: Qt.formatDate(new Date(), "ddd d")
            visible: compactRoot.containsMouse
        }
    }
}
