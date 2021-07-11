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
import org.kde.plasma.components 3.0 as PlasmaComponents

ColumnLayout {
    id: switchRoot


    PlasmaComponents.TabBar {
        id: tabBar

        Layout.fillWidth: true

        PlasmaComponents.TabButton {
            id: detailsTabButton

            text: "Weather Details"
        }

        PlasmaComponents.TabButton {
            id: forecastTabButton

            text: "Forecast"
        }
    }

    SwipeView {
        id: swipeView

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        clip: true

        currentIndex: tabBar.currentIndex

        DetailsItem {
            id: weatherItem

            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height * 0.75

            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        ForecastItem {
            id: forecastItem

            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height * 0.75

            Layout.alignment: Qt.AlignTop
        }

        onCurrentIndexChanged: {
            tabBar.setCurrentIndex(currentIndex);
        }
    }
}