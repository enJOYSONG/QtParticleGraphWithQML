import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    width : (parent.parent.parent.parent.width / 5) * 3
    height: (parent.parent.parent.parent.height / 10) * 9
    color: "#00FFFFFF"
    property alias piechart:piechart
    property int pievalue:0
    property alias bounceAnimation: bounceAnimation
    property alias opacityAnimation: opacityAnimation
    property alias chemicalTextRec: chemicalTextRec

    Canvas {
        id: piechart
        width: parent.width
        height: parent.width
        anchors.centerIn: parent.Center
        rotation: -90
        onPaint: {
            var angleFactor = 2 * Math.PI / 100

            var context = getContext("2d")
            context.clearRect(0, 0, piechart.width, piechart.height)

            var gradient = context.createRadialGradient(width/2, height/2, 0, width/2, height/2, width/4)
            gradient.addColorStop(0.0, "#007be0")
            gradient.addColorStop(1.0, "#4b369c")

            context.beginPath()
            context.moveTo(width/2, height/2)
            context.arc(width/2, height/2, width/4, 0, pievalue * angleFactor, false)
            context.fillStyle = gradient
            context.fill()
        }
    }

    Rectangle{
        id: chemicalTextRec
        width: 100
        height: 100
        radius: 5
        anchors.centerIn: piechart
        color: "#00FFFFFF"
        Text{

            text:total + "%"
            color: {
                if(total>100) {
                    return "red"
                }
                else if(total==100) {
                    return "#00D8FF"
                }
                else {  //100미만
                    return "white"
                }
            }
            font.bold: true
            font.pixelSize: 22
            anchors.centerIn: parent

        }
        transform: Scale {
            id: scaleTransform
            property real scale: 1
            xScale: scale
            yScale: scale
        }

        SequentialAnimation {
            id: bounceAnimation
            loops:1
            running: false
            PropertyAnimation {
                target: scaleTransform
                properties: "scale"
                from: 1.0
                to: 1.1
                duration: 300
            }
            PropertyAnimation {
                target: scaleTransform
                properties: "scale"
                from: 1.1
                to: 1.0
                duration: 300
            }
        }

        SequentialAnimation{ //진행중 정혜진
            id:opacityAnimation
            loops: animations.Infinite
            running: false
            NumberAnimation {
                target:chemicalTextRec
                property: "opacity"
                from:1
                to:0
                duration: 500
                easing.type: Easing.InOutQuad
            }

            NumberAnimation {
                target:chemicalTextRec
                property: "opacity"
                from:0
                to:1
                duration: 500
                easing.type: Easing.InOutQuad
            }
        }

    }
}

