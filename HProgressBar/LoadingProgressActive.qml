/*
 * 模仿微软的progress控件样式
 * this is part of HControls
 * email: sjxnhjp@gmail.com
*/
import QtQuick 2.3

Item {
    id: root

    property real roundSize: 5

    Repeater {
        id: roundRep
        model: 5

        Rectangle {
            id: round
            width : Math.min(root.roundSize, 10)
            height: width
            opacity: 0
            radius: 100

            SequentialAnimation {
                running: true
                loops: Animation.Infinite

                PauseAnimation { duration: 150 * index }

                ParallelAnimation {
                    NumberAnimation { target: round; property: "opacity"; from: 0; to: 1; duration: 400 }
                    NumberAnimation { target: round; property: "x"; from: 0; to: root.width / 3.0; duration: 400 }
                }
                NumberAnimation { target: round; property: "x"; to: (root.width / 2); duration: 1500 }
                ParallelAnimation {
                    NumberAnimation { target: round; property: "opacity"; from: 1; to: 0; duration: 400 }
                    NumberAnimation { target: round; property: "x"; to: root.width; duration: 400 }
                }

                PauseAnimation { duration: (roundRep.count - index - 1) * 150 }
            }
        }
    }
}
