import QtQuick
import org.kde.plasma.core as PlasmaCore

Item {
    id: root

    property string sourceId: ""
    property var weatherData: ({})
    property bool hasWeather: false

    PlasmaCore.DataSource {
        id: weatherSource
        engine: "weather"

        onSourceAdded: {
            if (!root.sourceId) {
                root.setSource(source)
            }
        }

        onSourceRemoved: {
            if (source === root.sourceId) {
                root.hasWeather = false
                root.weatherData = ({})
                root.sourceId = ""
            }
        }

        onDataChanged: {
            if (sourceName === root.sourceId) {
                root.weatherData = data
                root.hasWeather = true
            }
        }
    }

    function setSource(newSource) {
        if (root.sourceId) {
            weatherSource.disconnectSource(root.sourceId)
        }
        root.sourceId = newSource
        if (root.sourceId) {
            weatherSource.connectSource(root.sourceId)
        }
    }

    Component.onCompleted: {
        const existingSources = weatherSource.sources
        if (!root.sourceId && existingSources.length > 0) {
            root.setSource(existingSources[0])
        }
    }
}
