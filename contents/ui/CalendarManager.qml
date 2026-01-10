import QtQuick
import org.kde.plasma.calendar as PlasmaCalendar

Item {
    id: root

    // Expose the model
    property alias model: calendarModel

    // The current date we are looking at
    property date currentDate: new Date()

    PlasmaCalendar.CalendarModel {
        id: calendarModel
        // The standard Plasma CalendarModel uses 'date' property to determine the loaded range (usually month).
        // Connecting it to our currentDate ensures the model contains the data we are looking for.
    }

    // Explicit binding to ensure the C++ property is updated
    Binding {
        target: calendarModel
        property: "date"
        value: root.currentDate
        when: calendarModel.hasOwnProperty("date")
    }

    // Helper functions for navigation (can be connected to buttons in main.qml later)
    function nextDay() {
        var d = new Date(root.currentDate);
        d.setDate(d.getDate() + 1);
        root.currentDate = d;
    }

    function prevDay() {
        var d = new Date(root.currentDate);
        d.setDate(d.getDate() - 1);
        root.currentDate = d;
    }
}
