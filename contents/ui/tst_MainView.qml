import QtQuick 2.15
import QtTest 1.0

/**
 * tst_MainView.qml
 *
 * Sanity check that the main view QML loads and instantiates.
 */
TestCase {
    name: "MainViewTests"

    function test_mainViewLoads() {
        const component = Qt.createComponent("main.qml");
        compare(component.status, Component.Ready, component.errorString());

        let instance = null;
        try {
            instance = component.createObject(null);
            verify(instance !== null, "Main view should instantiate");
        } finally {
            if (instance) {
                instance.destroy();
            }
        }
    }
}
