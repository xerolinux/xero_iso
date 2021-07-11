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

RowLayout {
    id: topPanelRoot

    PlasmaCore.SvgItem {
        id: topPanelIcon

        svg: PlasmaCore.Svg {
            id: svg
            imagePath: plasmoid.file("", "icons/" + iconCode + ".svg")
        }

        Layout.minimumWidth: units.iconSizes.large
        Layout.minimumHeight: units.iconSizes.large
        Layout.preferredWidth: Layout.minimumWidth
        Layout.preferredHeight: Layout.minimumHeight
    }

    PlasmaComponents.Label {
        id: tempOverview

        text: showForecast ? "High: " + forecastModel.get(0).high + " Low: " + forecastModel.get(0).low : "loading..."

        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignHCenter

        Layout.alignment: Qt.AlignHCenter
        Layout.fillWidth: true
    }

    PlasmaComponents.Label {
        id: currStation

        text: conditionNarrative ? conditionNarrative : "loading..."

        verticalAlignment: Text.AlignBottom
        horizontalAlignment: Text.AlignRight

        Layout.alignment: Qt.AlignRight
    }
}