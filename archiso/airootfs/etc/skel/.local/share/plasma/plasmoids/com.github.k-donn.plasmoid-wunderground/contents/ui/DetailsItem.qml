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
import org.kde.plasma.components 2.0 as PlasmaComponents
import "../code/utils.js" as Utils

GridLayout {
    id: detailsRoot

    columns: 3
    rows: 4

    PlasmaComponents.Label {
        id: temp
        text: Utils.currentTempUnit(weatherData["details"]["temp"])
        font {
            bold: true
            pointSize: 30
        }
        color: Utils.heatColor(weatherData["details"]["temp"])
    }
    PlasmaCore.SvgItem {
        id: topPanelIcon

        svg: PlasmaCore.Svg {
            id: svg
            imagePath: plasmoid.file("", "icons/wind-barbs/" + Utils.getWindBarb(weatherData["details"]["windSpeed"]) + ".svg")
        }

        rotation: weatherData["winddir"] - 270

        Layout.minimumWidth: units.iconSizes.large
        Layout.minimumHeight: units.iconSizes.large
        Layout.preferredWidth: Layout.minimumWidth
        Layout.preferredHeight: Layout.minimumHeight
    }
    PlasmaComponents.Label {
        id: windLabel
        text: "WIND & GUST"
        font {
            bold: true
            pointSize: 13
        }
    }

    PlasmaComponents.Label {
        id: feelsLike
        text: "Feels like " + Utils.currentTempUnit(Utils.feelsLike(weatherData["details"]["temp"], weatherData["humidity"], weatherData["details"]["windSpeed"]))
    }
    PlasmaComponents.Label {
        id: windDirCard
        text: "Wind from: " + Utils.windDirToCard(weatherData["winddir"])
    }
    PlasmaComponents.Label {
        id: wind
        text: weatherData["details"]["windSpeed"] + " / " + Utils.currentSpeedUnit(weatherData["details"]["windGust"])
    }


    PlasmaComponents.Label {
        id: dewLabel
        text: "DEWPOINT"
        font {
            bold: true
            pointSize: 13
        }
    }
    PlasmaComponents.Label {
        id: precipRateLabel
        text: "PRECIP RATE"
        font {
            bold: true
            pointSize: 13
        }
    }
    PlasmaComponents.Label {
        id: pressureLabel
        text: "PRESSURE"
        font {
            bold: true
            pointSize: 13
        }
    }

    PlasmaComponents.Label {
        id: dew
        text: Utils.currentTempUnit(weatherData["details"]["dewpt"])
        font.pointSize: 10
    }
    PlasmaComponents.Label {
        id: precipRate
        text: Utils.currentPrecipUnit(weatherData["details"]["precipRate"], isRain) + "/hr"
        font.pointSize: 10
    }
    PlasmaComponents.Label {
        id: pressure
        text: Utils.currentPresUnit(weatherData["details"]["pressure"])
        font.pointSize: 10
    }

    PlasmaComponents.Label {
        id: humidityLabel
        text: "HUMIDITY"
        font {
            bold: true
            pointSize: 13
        }
    }
    PlasmaComponents.Label {
        id: precipAccLabel
        text: "PRECIP ACCUM"
        font {
            bold: true
            pointSize: 13
        }
    }
    PlasmaComponents.Label {
        id: uvLabel
        text: "UV"
        font {
            bold: true
            pointSize: 13
        }
    }

    PlasmaComponents.Label {
        id: humidity
        text: weatherData["humidity"] + "%"
    }
    PlasmaComponents.Label {
        id: precipAcc
        text: Utils.currentPrecipUnit(weatherData["details"]["precipTotal"], isRain)
    }
    PlasmaComponents.Label {
        id: uv
        text: weatherData["uv"]
    }
}