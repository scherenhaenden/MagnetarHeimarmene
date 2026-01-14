import QtQuick 2.15
import QtTest 1.0
import "HeimarmeneEngine.js" as HeimarmeneEngine
import "AtmosphereEngine.js" as AtmosphereEngine

/**
 * tst_Singularity.qml
 *
 * Unit tests for the Singularity logic modules (HeimarmeneEngine and AtmosphereEngine).
 * strictly separates logic from UI.
 */
TestCase {
    name: "SingularityTests"

    /**
     * Test Case: Date Parsing
     * Verifies that HeimarmeneEngine.parseDate correctly parses ISO strings.
     */
    function test_parseDate() {
        // Atomic test: Valid ISO date
        const input = "2023-10-27T10:00:00";
        const result = HeimarmeneEngine.parseDate(input);
        verify(result !== null, "Result should not be null for valid date");
        compare(result.getFullYear(), 2023, "Year should be 2023");
        compare(result.getMonth(), 9, "Month should be 9 (October)"); // Month is 0-indexed
        compare(result.getDate(), 27, "Day should be 27");

        // Atomic test: Invalid date string
        const invalidInput = "not-a-date";
        const invalidResult = HeimarmeneEngine.parseDate(invalidInput);
        compare(invalidResult, null, "Result should be null for invalid date string");

        // Atomic test: Empty input
        const emptyResult = HeimarmeneEngine.parseDate("");
        compare(emptyResult, null, "Result should be null for empty input");
    }

    /**
     * Test Case: Conflict Detection
     * Verifies that HeimarmeneEngine.detectConflicts identifies overlapping events.
     */
    function test_detectConflicts() {
        const event1 = {
            id: 1,
            title: "Event 1",
            start: new Date("2023-10-27T10:00:00"),
            end: new Date("2023-10-27T11:00:00")
        };
        const event2 = {
            id: 2,
            title: "Event 2",
            start: new Date("2023-10-27T10:30:00"), // Overlaps with Event 1
            end: new Date("2023-10-27T11:30:00")
        };
        const event3 = {
            id: 3,
            title: "Event 3",
            start: new Date("2023-10-27T12:00:00"), // No overlap
            end: new Date("2023-10-27T13:00:00")
        };

        const events = [event1, event2, event3];
        const conflicts = HeimarmeneEngine.detectConflicts(events);

        // Expect 1 conflict pair (Event 1 and Event 2)
        compare(conflicts.length, 1, "Should detect exactly one conflict");
        compare(conflicts[0].event1.id, 1, "Conflict event 1 should be Event 1");
        compare(conflicts[0].event2.id, 2, "Conflict event 2 should be Event 2");

        // Atomic test: No conflicts
        const noConflictEvents = [event1, event3];
        const noConflicts = HeimarmeneEngine.detectConflicts(noConflictEvents);
        compare(noConflicts.length, 0, "Should detect zero conflicts for non-overlapping events");

        // Atomic test: Touching events (End time = Start time)
        // Usually not considered a conflict
        const event4 = {
            id: 4,
            title: "Event 4",
            start: new Date("2023-10-27T11:00:00"), // Starts exactly when Event 1 ends
            end: new Date("2023-10-27T12:00:00")
        };
        const touchingEvents = [event1, event4];
        const touchingConflicts = HeimarmeneEngine.detectConflicts(touchingEvents);
        compare(touchingConflicts.length, 0, "Touching events should not be conflicts");
    }

    /**
     * Test Case: Weather Data Normalization
     * Verifies that AtmosphereEngine.normalizeWeatherData handles raw data correctly.
     */
    function test_normalizeWeatherData() {
        // Atomic test: Valid raw data (mocked)
        const rawData = {
            temp_c: 22.5,
            condition: { text: "Partly Cloudy" },
            humidity: 60,
            wind_kph: 15
        };

        const result = AtmosphereEngine.normalizeWeatherData(rawData);

        verify(result !== null, "Result should not be null");
        compare(result.temperature, 22.5, "Temperature should match");
        compare(result.condition, "Partly Cloudy", "Condition string should match");
        compare(result.humidity, 60, "Humidity should match");
        compare(result.windSpeed, 15, "Wind speed should match");

        // Atomic test: Missing fields
        const incompleteData = {
            temperature: 18 // Different key structure
        };
        const partialResult = AtmosphereEngine.normalizeWeatherData(incompleteData);
        compare(partialResult.temperature, 18, "Should detect 'temperature' key alternative");
        compare(partialResult.condition, "Unknown", "Should default condition to 'Unknown'");
        compare(partialResult.humidity, null, "Should default humidity to null");

        // Atomic test: Invalid input
        const invalidResult = AtmosphereEngine.normalizeWeatherData(null);
        compare(invalidResult, null, "Should return null for null input");

        // Atomic test: Data with malformed condition object
        const malformedConditionData = {
            temp_c: 10,
            condition: { some_other_prop: "value" }
        };
        const malformedResult = AtmosphereEngine.normalizeWeatherData(malformedConditionData);
        compare(malformedResult.condition, "Unknown", "Should handle malformed condition object and default to Unknown");
    }
}
