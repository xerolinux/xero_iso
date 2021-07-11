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
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import org.kde.kirigami 2.4 as Kirigami

Item {
    id: unitsConfig

    property alias cfg_unitsChoice: unitsChoice.currentIndex

    Kirigami.FormLayout {
        anchors.fill: parent

        ComboBox {
            id: unitsChoice

            width: 100
            model: ["Metric", "Imperial", "Hybrid (UK)"]

            Kirigami.FormData.label: "Choose:"
        }
    }

}