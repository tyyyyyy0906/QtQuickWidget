/*
 * this is part of HControls
 * email: sjxnhjp@gmail.com
*/
import QtQuick 2.3

Item {
    id: root

    /*
     * @param: Used to set the size of the circle.There are four levels: large, medium, small and custom.
               The default is medium.
    */
    property string showStyle  : "medium"
    property color  cricleColor: "#1086A2"

    function customStyle(cricleWidth, cricleRadius) {
        if (root.showStyle !== custom) {
            console.error("must be custom style");
            return
        }
        _.style("custom").cricleWidth  = cricleWidth
        _.style("custom").cricleRadius = cricleRadius
    }

    Item {
        id: _

        readonly property real pi  : 3.14159268465
        readonly property var style: ({
            "small": {
                cricleWidth : 4.0,
                cricleRadius: 20
            },
            "medium": {
                cricleWidth : 8.0,
                cricleRadius: 30
            },
            "large": {
                cricleWidth : 10.0,
                cricleRadius: 40
            },
            "custom": {}
        })
    }

    Repeater {
        id: activeX
        model: 5

        Rectangle {
            id: cricle

            property real cricleRadius : _.style(showStyle).cricleRadius
            property real cricleCenterX: root.width / 2
            property real cricleCenterY: root.height / 2
            property real criclePointX : cricleRadius * Math.sin(criclePacent * (2 * _.pi)) + cricleCenterX
            property real criclePointY : cricleRadius * Math.cos(criclePacent * (2 * _.pi)) + cricleCenterY
            property real criclePacent : 1

            width: _.style(showStyle).cricleWidth
            height: width
            radius: 100
            color: root.cricleColor
            x: cricleCenterX
            y: cricleCenterY

            SequentialAnimation on criclePacent {
                PauseAnimation { duration: 200 * index }
                loops: Animation.Infinite
                ParallelAnimation {
                    NumberAnimation { target: cricle; property: "opacity"; from: 0; to: 1; duration: 200 }
                    NumberAnimation { duration: 200; from: (1 + index * 0.05); to: 0.75 }
                }
                NumberAnimation { duration: 60 ; from: 0.75; to: 0.7  }
                NumberAnimation { duration: 140; from: 0.7 ; to: 0.65 }
                NumberAnimation { duration: 160; from: 0.65; to: 0.6  }

                NumberAnimation { duration: 200; from: 0.6 ;  to: 0.55 }
                NumberAnimation { duration: 200; from: 0.55;  to: 0.5  }

                NumberAnimation { duration: 200; from: 0.5 ;  to: 0.45 }
                NumberAnimation { duration: 100; from: 0.45;  to: 0.4  }
                NumberAnimation { duration: 50 ; from: 0.4 ;  to: 0.35 }
                NumberAnimation { duration: 30 ; from: 0.35;  to: 0.3  }
                NumberAnimation { duration: 180; from: 0.3 ;  to: 0    }
                NumberAnimation { duration: 200; from: 1   ;  to: 0.75 }

                NumberAnimation { duration: 60 ; from: 0.75; to: 0.7  }
                NumberAnimation { duration: 140; from: 0.7 ; to: 0.65 }
                NumberAnimation { duration: 160; from: 0.65; to: 0.6  }

                NumberAnimation { duration: 200; from: 0.6 ;  to: 0.55 }
                NumberAnimation { duration: 200; from: 0.55;  to: 0.5  }
                NumberAnimation { duration: 200; from: 0.5 ;  to: 0.45 }
                NumberAnimation { duration: 100; from: 0.45;  to: 0.4  }
                NumberAnimation { duration: 50 ; from: 0.4 ;  to: 0.35 }
                NumberAnimation { duration: 30 ; from: 0.35;  to: 0.3  }
                NumberAnimation { duration: 180; from: 0.3 ;  to: 0    }
                NumberAnimation { target: cricle; duration: 50; property: "opacity"; from: 1; to: 0 }
                PauseAnimation  { duration: (activeX.count - index - 1) * 200 }
            }
        }
    }
}
