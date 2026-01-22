import QtQuick
import QtQuick.Layouts
import org.kde.kirigami as Kirigami
import org.kde.plasma.plasmoid
import org.kde.plasma.components 3.0 as PlasmaComponents

PlasmoidItem {
    id: root

    // Set the preferred size for the widget
    preferredRepresentation: fullRepresentation

    // Calendar Manager (Data Source)
    CalendarManager {
        id: calendarManager
    }

    // Weather Manager (Data Source)
    WeatherManager {
        id: weatherManager
    }

    // The main view when the widget is expanded
    // Fixed: Use Frame instead of deprecated Panel to resolve "PlasmaComponents.Panel is not a type"
    fullRepresentation: PlasmaComponents.Frame {
        // Use gridUnit for resolution independence instead of fixed pixels
        implicitWidth: Kirigami.Units.gridUnit * 20
        implicitHeight: Kirigami.Units.gridUnit * 30

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Kirigami.Units.smallSpacing

            Text {
                text: "Magnetar Heimarmene"
                color: Kirigami.Theme.textColor
                font.bold: true
                font.pixelSize: Kirigami.Theme.defaultFont.pixelSize * 1.5
                Layout.alignment: Qt.AlignHCenter
            }

            // Header for the date
            Text {
                text: Qt.formatDate(calendarManager.currentDate, "dddd, MMMM d, yyyy")
                color: Kirigami.Theme.highlightColor
                font.bold: true
                Layout.alignment: Qt.AlignHCenter
            }

            // Weather summary for the current location
            Text {
                text: weatherManager.hasWeather
                    ? ("Weather: " + weatherManager.temperatureDisplay())
                    : "Weather: --"
                color: Kirigami.Theme.textColor
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
                            if (!calendarManager.currentDate) return false
                            return model.day === calendarManager.currentDate.getDate() &&
                                   model.month === calendarManager.currentDate.getMonth() &&
                                   model.year === calendarManager.currentDate.getFullYear()
                        }

                        visible: isSelectedDay
                        height: visible ? contentCol.height : 0
                        width: ListView.view.width

                        ColumnLayout {
                            id: contentCol
                            width: parent.width
                            spacing: Kirigami.Units.smallSpacing

                            // Iterate over the events for this day
                            // model.events is expected to be a list/array of event objects
                            Repeater {
                                model: model.events
                                delegate: RowLayout {
                                    Layout.fillWidth: true

                                    Rectangle {
                                        width: 4
                                        height: parent.height
                                        color: modelData.color ? modelData.color : Kirigami.Theme.highlightColor
                                    }

                                    ColumnLayout {
                                        Layout.fillWidth: true
                                        Text {
                                            text: modelData.title
                                            color: Kirigami.Theme.textColor
                                            font.bold: true
                                        }
                                        Text {
                                            text: modelData.description || ""
                                            color: Kirigami.Theme.disabledTextColor
                                            visible: text.length > 0
                                            font.pixelSize: Kirigami.Theme.defaultFont.pixelSize * 0.9
                                        }
                                    }
                                }
                            }

                            // Fallback if no events for this day
                            Text {
                                text: (!model.events || model.events.length === 0) ? "No events for this day" : ""
                                visible: text.length > 0
                                color: Kirigami.Theme.disabledTextColor
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }

                }
            }

            // Placeholder when list is empty
            Text {
                text: "No events found"
                visible: eventList.count === 0
                color: Kirigami.Theme.disabledTextColor
                Layout.alignment: Qt.AlignHCenter
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
            color: Kirigami.Theme.textColor
            font.bold: true
        }

        PlasmaComponents.ToolTip {
            text: Qt.formatDate(calendarManager.currentDate, "ddd d")
            visible: compactRoot.containsMouse
        }
    }
}
