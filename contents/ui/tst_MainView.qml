import QtQuick
import QtTest
import org.kde.plasma.components 3.0 as PlasmaComponents

/**
 * tst_MainView.qml
 *
 * Unit test for main.qml.
 * Verifies that the main view can be instantiated without component errors.
 * This ensures that deprecated components (like PlasmaComponents.Panel) are not used.
 */
TestCase {
    name: "MainViewTests"

    function test_mainQmlLoads() {
        // Attempt to create the component from the file
        var component = Qt.createComponent("main.qml");

        // Check for immediate loading errors (syntax, imports)
        if (component.status === Component.Error) {
            console.warn("Error loading main.qml: " + component.errorString());
        }
        verify(component.status === Component.Ready, "main.qml should load successfully: " + component.errorString());

        // We do not instantiate the object (createObject) because PlasmoidItem depends on
        // the 'plasmoid' context property which is not easily mocked in a pure qmltestrunner environment
        // without a specific test shell. However, Component.Ready proves that all types
        // (like PlasmaComponents.Frame vs Panel) are resolved.
    }
}
