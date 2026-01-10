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
        // Plasma 6 CalendarModel typically needs a range or follows the system date
        // Usually it reacts to `Date` property if available, or we might need to set a range.
        // For now, let's instantiate it.
    }

    function nextMonth() {
        var d = root.currentDate;
        d.setMonth(d.getMonth() + 1);
        root.currentDate = d;
    }

    function prevMonth() {
        var d = root.currentDate;
        d.setMonth(d.getMonth() - 1);
        root.currentDate = d;
    }
}
