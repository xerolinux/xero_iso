import QtQuick 2.0
import SddmComponents 2.0

Rectangle {
    id: container
    width: 1600
    height: 900

    Connections {
        target: sddm

        onLoginSucceeded: {
            errorMessage.color = "steelblue"
            errorMessage.text = qsTr("Login succeeded.")
        }

        onLoginFailed: {
            errorMessage.color = "red"
            errorMessage.text = qsTr("Login failed.")
        }
    }

    Rectangle {
        id: rectangle1
        property variant geometry: screenModel.geometry(screenModel.primary)
        color: "transparent"
        anchors.fill: parent

        Image {
            id: background
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: "images/XeroLinux.jpg"
        }

        //Text {
            //color: "#ffffff"
            //text: qsTr("Welcome to ") + sddm.hostName
            //anchors.left: parent.left
            //anchors.leftMargin: 14
            //anchors.top: parent.top
            //anchors.topMargin: 15
            //font.pixelSize: 24
        //}

        Button {
            id: shutdownButton
            color: "#0d0d0d"
            font.pixelSize: 12
            text: qsTr("Shutdown")
            borderColor: "#333333"
            activeColor: "#0088cc"
            border.color: "#333333"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10

            onClicked: sddm.powerOff()

            KeyNavigation.backtab: loginButton; KeyNavigation.tab: rebootButton
        }

        Button {
            id: rebootButton
            color: "#0d0d0d"
            font.pixelSize: 12
            text: qsTr("Reboot")
            border.color: "#333333"
            activeColor: "#0088cc"
            borderColor: "#333333"
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10

            onClicked: sddm.reboot()

            KeyNavigation.backtab: shutdownButton; KeyNavigation.tab: name
        }

        Column {
            id: column1
            width: (parent.width/1600)*500
            height: (parent.height/900)*220
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: (parent.height/900)*30

            Column {
                width: parent.width
                height: (parent.height/220)*30
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: (parent.height/220)*6
                Text {
                    id: lblName
                    width: 60
                    color: "#ffffff"
                    text: qsTr("Username")
                    font.bold: true
                    font.pixelSize: 12
                }

                TextBox {
                    id: name
                    width: parent.width
                    height: parent.height
                    text: userModel.lastUser
                    font.pixelSize: 14

                    KeyNavigation.backtab: rebootButton; KeyNavigation.tab: password

                    Keys.onPressed: {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(name.text, password.text, session.index)
                            event.accepted = true
                        }
                    }
                }
            }

            Column {
                width: parent.width
                height: (parent.height/220)*30
                anchors.horizontalCenter: parent.horizontalCenter
                spacing : (parent.height/220)*6
                Text {
                    id: lblPassword
                    width: 60
                    color: "#ffffff"
                    text: qsTr("Password")
                    font.bold: true
                    font.pixelSize: 12
                }

                TextBox {
                    id: password
                    width: parent.width
                    height: parent.height
                    font.pixelSize: 14

                    echoMode: TextInput.Password

                    KeyNavigation.backtab: name; KeyNavigation.tab: session

                    Keys.onPressed: {
                        if (event.key === Qt.Key_Return) {
                            sddm.login(name.text, password.text, session.index)
                            event.accepted = true
                        }
                    }
                }
            }

            Column {
                z: 100
                width: parent.width
                height: (parent.height/220)*30
                anchors.horizontalCenter: parent.horizontalCenter
                spacing : (parent.height/220)*6
                Text {
                    id: lblSession
                    width: 60
                    color: "#ffffff"
                    text: qsTr("Session")
                    font.bold: true
                    font.pixelSize: 12
                }

                ComboBox {
                    id: session
                    width: parent.width
                    height: parent.height
                    font.pixelSize: 14

                    arrowIcon: "images/angle-down.png"

                    model: sessionModel
                    index: sessionModel.lastIndex

                    KeyNavigation.backtab: password; KeyNavigation.tab: loginButton
                }
            }

            Column {
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                    id: errorMessage
                    color: "#0088cc"
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: qsTr("Enter your user name and password.")
                    font.pixelSize: 10
                }
            }

            Row {
                id: row1
                anchors.top: parent.bottom
                anchors.margins: (parent.height/220)*60
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 4

                Button {
                    id: loginButton
                    color: "#0088cc"
                    text: qsTr("Login")
                    activeColor: "#0088cc"
                    borderColor: "#333333"
                    border.color: "#333333"
                    opacity: 0.0
                    anchors.horizontalCenter: parent.horizontalCenter

                    onClicked: sddm.login(name.text, password.text, session.index)

                    KeyNavigation.backtab: session; KeyNavigation.tab: shutdownButton
                }
            }
        }





    }

    Component.onCompleted: {
        if (name.text == "")
            name.focus = true
        else
            password.focus = true
    }
}
