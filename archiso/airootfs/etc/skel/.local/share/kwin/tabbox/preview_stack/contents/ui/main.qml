import QtQuick 2.0
import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.kquickcontrolsaddons 2.0
import org.kde.kwin 2.0 as KWin


KWin.Switcher {
    id: winSwitcher
    // currentIndex: itemsView.currentIndex

    PlasmaCore.Dialog {
        id: dialog
        location: PlasmaCore.Types.Floating
        visible: winSwitcher.visible
        flags: Qt.X11BypassWindowManagerHint
        x: winSwitcher.screenGeometry.x + winSwitcher.screenGeometry.width * 0.5 - mainItem.width * 0.5
        y: winSwitcher.screenGeometry.y + winSwitcher.screenGeometry.height * 0.5 - mainItem.height * 0.5

        mainItem: Item {
            id: mainItem
            property int max_w: winSwitcher.screenGeometry.width * 0.75
            property int max_h: winSwitcher.screenGeometry.height * 0.9
            property real screen_factor: winSwitcher.screenGeometry.width / winSwitcher.screenGeometry.height
            property int default_spacing: 4
            width: itemsView.width + 100
            height: itemsView.height

            PathView {
                id: itemsView
                model: winSwitcher.model
                property int titlebar_h: 40
                property int preview_w: mainItem.max_w
                property int preview_h: preview_w * (1.0/mainItem.screen_factor)
                property int deleg_h: itemsView.height - (35 * (itemsView.count ))
                // width: mainItem.default_spacing + preview_w + mainItem.default_spacing
                width: preview_w
                height: mainItem.max_h
                path: Path {
                    startX: mainItem.width/2
                    startY: -20
                    PathLine { x: mainItem.width/2 ; relativeY: (itemsView.deleg_h / 2) - 15 }
                    PathPercent { value: 0; }
                    PathAttribute { name: "itemZ"; value: 0 }
                    PathAttribute { name: "iconScale"; value: 0.9 }
                    PathLine { x: mainItem.width/2; relativeY: (35 * (itemsView.count )) + 15 }
                    PathAttribute { name: "itemZ"; value: 100 }
                    PathAttribute { name: "iconScale"; value: 1 }
                    PathPercent { value: 1; }
                    // PathLine { x: mainItem.width/2 + 50; relativeY: itemsView.deleg_h / 2  }

                }
                // pathItemCount: 8

                preferredHighlightBegin: 0.99
                preferredHighlightEnd: 1

                delegate: Item {
                    id: theDelegate
                    width: itemsView.width
                    z: PathView.itemZ
                    height: itemsView.deleg_h
                    scale: PathView.iconScale

                    states: State {
                        name: "OnTop"
                        PropertyChanges { target: winPreview; visible: true}
                        PropertyChanges { target: previewContainer; color: "whitesmoke"}
                        // PropertyChanges { target: itemsView.currentItem; height: itemsView.height/2}
                    }
                    transitions: [
                      Transition {
                          from: ""; to: "OnTop"
                          PropertyAnimation { property: "color";
                                              duration: 50 }
                      },
                      Transition {
                          from: "OnTop"; to: ""
                          PropertyAnimation { property: "color";
                                              duration: 500 }
                      } ]
                      Component.onCompleted: {
                        showThumbTimer.start()
                      }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            parent.select_relative(0)
                            if (itemsView.currentIndex == index) {
                                winSwitcher.model.activate(itemsView.currentIndex)
                            }
                        }
                        onWheel: {
                            if (wheel.angleDelta.x > 0) {
                                parent.select_relative(1)
                            } else {
                                parent.select_relative(-1)
                            }

                        }
                    }

                    function select_relative(x) {
                        itemsView.currentIndex = (index + itemsView.count + x) % itemsView.count;
                        // itemsView.currentIndexChanged(itemsView.currentIndex);
                    }



                    Rectangle {
                        id: "previewContainer"
                        // color: "white"
                        color: "lightgrey"
                        radius: 5
                        border.color: "silver"
                        border.width: 1
                        anchors.fill: parent
                        anchors.leftMargin: mainItem.default_spacing
                        anchors.topMargin: mainItem.default_spacing
                        anchors.rightMargin: mainItem.default_spacing
                        anchors.bottomMargin: mainItem.default_spacing


                        RowLayout {
                            // rotation: 5
                            id: titleBar
                            anchors.top: parent.top
                            anchors.right: parent.right
                            height: itemsView.titlebar_h
                            spacing: 4



                            PlasmaComponents.Label {
                                text: model.caption
                                height: parent.height
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                            }
                            QIconItem {
                                id: iconItem
                                icon: model.icon
                                width: parent.height
                                height: parent.height
                                state: index == itemsView.currentIndex ? QIconItem.ActiveState : QIconItem.DefaultState
                            }
                            PlasmaComponents.Label {
                                text: model.desktopName
                                color: "green"
                                height: parent.height
                                Layout.fillWidth: true
                                elide: Text.ElideRight
                            }

                            PlasmaComponents.ToolButton {
                                visible: model.closeable && typeof winSwitcher.model.close !== 'undefined' || false
                                iconSource: 'window-close-symbolic'
                                onClicked: {
                                    console.log(winSwitcher.model, index, model.closeable, winSwitcher.model.close)
                                    winSwitcher.model.close(index)
                                    itemsView.currentIndexChanged(itemsView.currentIndex)
                                    console.log('calling timer')
                                    showThumbTimer.start()
                                }
                            }
                        }

                        // Cannot draw icon on top of thumbnail.
                        KWin.ThumbnailItem {
                            id: winPreview
                            wId: windowId
                            clip: true
                            clipTo: parent
                            anchors.fill: parent
                            anchors.topMargin: titleBar.height
                            // visible: theDelegate.PathView.isCurrentItem
                            visible: false
                            // saturation: 0.1
                        }
                    }
                }
                // highlight: PlasmaCore.FrameSvgItem {
                //     id: highlightItem
                //     imagePath: "widgets/viewitem"
                //     prefix: "hover"
                //     width: itemsView.width
                //     height: itemsView.deleg_h
                // }
                highlightMoveDuration: 100
                Timer {
                    id: showThumbTimer
                    interval: itemsView.highlightMoveDuration; running: false; repeat: false
                    onTriggered: {
                        itemsView.currentItem.state = "OnTop";
                    }
                }
                Connections {
                    target: winSwitcher
                    onCurrentIndexChanged: {
                        if (itemsView.currentItem) {
                            itemsView.currentItem.state = ""
                        }
                        itemsView.currentIndex = winSwitcher.currentIndex
                        showThumbTimer.start()
                    }
                }
            }
        }
    }
}