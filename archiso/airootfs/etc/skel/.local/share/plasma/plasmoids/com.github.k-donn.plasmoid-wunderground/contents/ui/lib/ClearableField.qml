import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Layouts 1.0

TextField {
    id: configString
    Layout.fillWidth: true

    property alias value: configString.text

    ToolButton {
        iconName: "edit-clear"
        onClicked: configString.value = ""

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        width: height
    }
}