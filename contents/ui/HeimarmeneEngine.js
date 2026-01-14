.pragma library

/**
 * HeimarmeneEngine.js
 *
 * This module handles the core chronological logic for the Magnetar Heimarmene project.
 * It strictly separates logic from the view (Event Horizon).
 *
 * @module HeimarmeneEngine
 */

/**
 * Parses a date string into a Date object.
 * Currently supports ISO 8601 format.
 *
 * @param {string} dateString - The date string to parse.
 * @returns {Date|null} The parsed Date object or null if invalid.
 */
function parseDate(dateString) {
    if (!dateString) {
        console.warn("HeimarmeneEngine: parseDate: Empty date string provided.");
        return null;
    }

    const date = new Date(dateString);
    if (isNaN(date.getTime())) {
        console.warn("HeimarmeneEngine: parseDate: Invalid date string:", dateString);
        return null;
    }
    return date;
}

/**
 * Detects conflicts between events.
 * A conflict is defined as two events overlapping in time.
 *
 * @param {Array} events - List of event objects. Each object must have 'start' and 'end' Date properties.
 * @returns {Array} List of conflicting event pairs. Each item is an object { event1, event2 }.
 */
function detectConflicts(events) {
    if (!events || !Array.isArray(events)) {
        console.warn("HeimarmeneEngine: detectConflicts: Invalid events array.");
        return [];
    }

    const conflicts = [];

    // Sort events by start time to simplify comparison
    // We create a shallow copy to avoid mutating the original array
    const sortedEvents = events.slice().sort(function(a, b) {
        return a.start - b.start;
    });

    for (let i = 0; i < sortedEvents.length; i++) {
        const eventA = sortedEvents[i];

        // Ensure event has valid start/end
        if (!eventA.start || !eventA.end) {
             console.warn("HeimarmeneEngine: detectConflicts: Event missing start or end date.", eventA);
             continue;
        }

        for (let j = i + 1; j < sortedEvents.length; j++) {
            const eventB = sortedEvents[j];

            if (!eventB.start || !eventB.end) {
                 continue;
            }

            // If eventB starts after or at the same time as eventA ends,
            // there is no conflict with this eventA, and since events are sorted,
            // no subsequent event will conflict with eventA.
            if (eventB.start >= eventA.end) {
                break;
            }

            // Conflict detected
            // We push an object describing the conflict
            conflicts.push({
                event1: eventA,
                event2: eventB
            });
        }
    }

    return conflicts;
}
