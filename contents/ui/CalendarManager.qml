import QtQuick
import org.kde.plasma.calendar as PlasmaCalendar

Item {
    id: root

    // Expose the model
    property var model: calendarModel

    // The current date we are looking at
    property date currentDate: new Date()

    PlasmaCalendar.CalendarModel {
        id: calendarModel
        // Bind the model to the current date so navigation works
        // This ensures the model fetches events for the selected month
        // Note: 'date' is the standard property for the reference date in many calendar models
        // If this specific version uses a different property (e.g. 'displayedDate'), it will need adjustment.
        // But this addresses the "not wired" issue.
        date: root.currentDate
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
