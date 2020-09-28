/*
 * 模仿微软的圆形progress控件
 * this is part of HControls
 * email: sjxnhjp@gmail.com
*/
import QtQuick 2.3

Item {
    id: root

    //a total of four type: small, normal, large and custom
    property string showStyle   : "normal"
    property color  cricleColor : "#1086A2"
    property var    cricleCustom: ([/*cricleWidth: 圆的直径。*/, /*cricleRadius: 控件的大小*/])

    onCricleCustomChanged: {
        if (root.cricleCustom.length === 0 && showStyle !== "custom") return
        _.style["custom"].cricleWidth  = root.cricleCustom[0]
        _.style["custom"].cricleRadius = root.cricleCustom[1]
    }

    Item {
        id: _

        readonly property real pi  : 3.14159268465
        readonly property var style: ({
            "small": {
                cricleWidth : 4.0,
                cricleRadius: 20,
            },
            "normal": {
                cricleWidth : 8.0,
                cricleRadius: 30,
            },
            "large": {
                cricleWidth : 10.0,
                cricleRadius: 40,
            },
            "custom": {
                cricleWidth : 0.0,
                cricleRadius: 0.0
            }
        })
    }

    Repeater {
        id: cricleRep
        model: 5

        Rectangle {
            id: cricle

            property real cricleRadius : _.style[showStyle].cricleRadius
            property real cricleCenterX: root.width  / 2
            property real cricleCenterY: root.height / 2
            property real criclePointX : cricleRadius * Math.sin(percent * (2 *_.pi)) + cricleCenterX
            property real criclePointY : cricleRadius * Math.cos(percent * (2 *_.pi)) + cricleCenterY
            property real percent: 1

            width: _.style[showStyle].cricleWidth
            height: width
            radius: 100
            color: root.cricleColor
            opacity: 0
            x: criclePointX
            y: criclePointY

            SequentialAnimation on percent {
                PauseAnimation { duration: 200 * index }
                loops: Animation.Infinite
                running: true
                ParallelAnimation {
                    NumberAnimation { target: cricle; property: "opacity";from: 0; to: 1; duration: 200}
                    NumberAnimation { duration: 200; from: (1 + index * 0.05); to: 0.75}
                }

                NumberAnimation { duration: 60 ; from: 0.75; to: 0.7  }
                NumberAnimation { duration: 140; from: 0.7 ; to: 0.65 }
                NumberAnimation { duration: 160; from: 0.65; to: 0.6  }

                NumberAnimation { duration: 200; from: 0.6 ;  to: 0.55 }
                NumberAnimation { duration: 200; from: 0.55;  to: 0.5  }

                NumberAnimation { duration: 200; from: 0.5;  to: 0.45 }
                NumberAnimation { duration: 100; from: 0.45; to: 0.4  }
                NumberAnimation { duration: 50 ; from: 0.4;  to: 0.35 }
                NumberAnimation { duration: 30 ; from: 0.35; to: 0.3  }
                NumberAnimation { duration: 180; from: 0.3;  to: 0    }

                NumberAnimation { duration: 200; from: 1   ; to: 0.75 }
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
                NumberAnimation { target: cricle; duration: 50; property: "opacity"; from: 1; to: 0}

                PauseAnimation { duration: (cricleRep.count - index - 1) * 200 }
            }
        }
    }
}
