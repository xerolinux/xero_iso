/*
 * SPDX-FileCopyrightText: 2018 Friedrich W. H. Kossebau <kossebau@kde.org>
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

import QtQuick 2.9

import QtQuick.Layouts 1.3

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import "../code/utils.js" as Utils

ColumnLayout {
    id: compactRoot

    readonly property bool vertical: (plasmoid.formFactor == PlasmaCore.Types.Vertical)

    function printDebug(msg) {
        if (plasmoid.configuration.logConsole) {console.log("[debug] [CompactRep.qml] " + msg)}
    }


    IconAndTextItem {
        vertical: compactRoot.vertical
        iconSource: plasmoid.file("", "icons/" + iconCode + ".svg")
        text: appState == showDATA ? Utils.currentTempUnit(weatherData["details"]["temp"]) : "---.-° X"

        Layout.fillWidth: compactRoot.vertical
        Layout.fillHeight: !compactRoot.vertical

        MouseArea {
            id: compactMouseArea
            anchors.fill: parent

            hoverEnabled: true

            onClicked: {
                plasmoid.expanded = !plasmoid.expanded;
            }
        }
    }


    // Component {
    //     id: iconComponent

    //     PlasmaCore.SvgItem {
    //         readonly property int minIconSize: Math.max((compactRoot.vertical ? compactRoot.width : compactRoot.height), units.iconSizes.small)

    //         svg: PlasmaCore.Svg {
    //             id: svg
    //             imagePath: plasmoid.file("", "icons/" + iconCode + ".svg")
    //         }

    //         // reset implicit size, so layout in free dimension does not stop at the default one
    //         implicitWidth: units.iconSizes.small
    //         implicitHeight: units.iconSizes.small
    //         Layout.minimumWidth: compactRoot.vertical ? units.iconSizes.small : minIconSize
    //         Layout.minimumHeight: compactRoot.vertical ? minIconSize : units.iconSizes.small
    //     }
    // }


    // Component {
    //     id: iconAndTextComponent

    //     IconAndTextItem {
    //         vertical: compactRoot.vertical
    //         iconSource: plasmoid.file("", "icons/" + iconCode + ".svg")
    //         text: appState == showDATA ? Utils.currentTempUnit(weatherData["details"]["temp"]) : "---.-° X"
    //     }
    // }

}
