/*
 * Copyright 2021  Kevin Donnelly
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http: //www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import "../code/utils.js" as Utils
import "../code/pws-api.js" as StationAPI

Item {
    id: root

    property var weatherData: null
    property ListModel forecastModel: ListModel {}
    property string errorStr: ""
    property string toolTipSubText: ""
    property string iconCode: "32" // 32 = sunny
    property string conditionNarrative: ""

    // TODO: add option for showFORECAST and showFORECASTERROR
    property int showCONFIG: 1
    property int showLOADING: 2
    property int showERROR: 4
    property int showDATA: 8

    property bool showForecast: false

    property int appState: showCONFIG

    property string stationID: plasmoid.configuration.stationID
    property int unitsChoice: plasmoid.configuration.unitsChoice

    property bool inTray: false
    // Metric units change based on precipitation type
    property bool isRain: true

    property Component fr: FullRepresentation {
        Layout.preferredWidth: 510
        Layout.preferredHeight: 340
        Layout.minimumWidth: 510
        Layout.minimumHeight: 340
    }

    property Component cr: CompactRepresentation {
        Layout.minimumWidth: 110
        Layout.preferredWidth: 110
    }

    function printDebug(msg) {
        if (plasmoid.configuration.logConsole) {console.log("[debug] [main.qml] " + msg)}
    }

    function printDebugJSON(json) {
        if (plasmoid.configuration.logConsole) {console.log("[debug] [main.qml] " + JSON.stringify(json))}
    }

    function updateWeatherData() {
        printDebug("Getting new weather data")

        StationAPI.getCurrentData()
        StationAPI.getForecastData()

        updatetoolTipSubText()
    }

    function updateCurrentData() {
        printDebug("Getting new current data")

        StationAPI.getCurrentData()

        updatetoolTipSubText()
    }

    function updateForecastData() {
        printDebug("Getting new forecast data")

        StationAPI.getForecastData()

        updatetoolTipSubText()
    }

    function updatetoolTipSubText() {
        var subText = ""

        subText += "<font size='4'>Temp: " + Utils.currentTempUnit(weatherData["details"]["temp"]) + "</font><br />"
        subText += "<font size='4'>Feels: " + Utils.currentTempUnit(Utils.feelsLike(weatherData["details"]["temp"], weatherData["humidity"], weatherData["details"]["windSpeed"])) + "</font><br />"
        subText += "<font size='4'>Wnd spd:" + Utils.currentSpeedUnit(weatherData["details"]["windSpeed"]) + "</font><br />"
        subText += "<font size='4'>" + weatherData["obsTimeLocal"] + "</font>"

        toolTipSubText = subText;
    }

    onUnitsChoiceChanged: {
        printDebug("Units changed")

        // A user could configure units but not station id. This would trigger improper request.
        if (stationID != "") {
            // Show loading screen after units change
            appState = showLOADING;

            updateWeatherData();
        }
    }

    onStationIDChanged: {
        printDebug("Station ID changed")

        // Show loading screen after ID change
        appState = showLOADING;

        updateWeatherData();
    }

    onWeatherDataChanged: {
        printDebug("Weather data changed")
    }

    onAppStateChanged: {
        printDebug("State is: " + appState)

        // The state could now be an error, the tooltip displays the error
        updatetoolTipSubText()
    }

    Component.onCompleted: {
        inTray = (plasmoid.parent !== null && (plasmoid.parent.pluginName === 'org.kde.plasma.private.systemtray' || plasmoid.parent.objectName === 'taskItemContainer'))

        plasmoid.configurationRequiredReason = "Set the weather station to pull data from."

        plasmoid.backgroundHints = PlasmaCore.Types.ConfigurableBackground
    }

    Timer {
        interval: plasmoid.configuration.refreshPeriod * 1000
        running: appState != showCONFIG
        repeat: true
        onTriggered: updateCurrentData()
    }

    Timer {
        interval: 60 * 60 * 1000
        running: appState != showCONFIG
        repeat: true
        onTriggered: updateForecastData()
    }

    Plasmoid.toolTipTextFormat: Text.RichText
    Plasmoid.toolTipMainText: {
        if (appState == showCONFIG) {
            return "Please Configure";
        } else if (appState == showDATA) {
            return stationID;
        } else if (appState == showLOADING) {
            return "Loading...";
        } else if (appState == showERROR) {
            return "Error..."
        }
    }
    Plasmoid.toolTipSubText: toolTipSubText

    // Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
    Plasmoid.fullRepresentation: fr
    Plasmoid.compactRepresentation: cr

}
