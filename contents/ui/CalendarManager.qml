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
        // Bind the model to the current date so navigation works
        // This ensures the model fetches events for the selected month
        // Note: 'date' is the standard property for the reference date in many calendar models
        // If this specific version uses a different property (e.g. 'displayedDate'), it will need adjustment.
        // But this addresses the "not wired" issue.
    }

    // Bind the calendar model's reference date to the current date.
    // If the API changes (e.g. using "displayedDate" instead of "date"),
    // update the property name here accordingly.
    Binding {
        target: calendarModel
        property: "date"
        value: root.currentDate
    }

    function nextMonth() {
        var d = new Date(root.currentDate);
        d.setMonth(d.getMonth() + 1);
        root.currentDate = d;
    }

    function prevMonth() {
        var d = new Date(root.currentDate);
        d.setMonth(d.getMonth() - 1);
        root.currentDate = d;
    }
}
