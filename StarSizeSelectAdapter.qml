import QtQuick 2.0



Item {
    property int itemwidth
    property int itemheight
    width: itemwidth
    height: itemheight
    Rectangle{
        id: sizebutton
        width: parent.width
        height: parent.height
        color: "#90262930"
        radius: 5
        Canvas {
            width: parent.width
            height: parent.width
            anchors.centerIn: parent.Center
            onPaint: {
                // Get drawing context
                var context = getContext("2d")

                // Draw a circle
                context.beginPath()
                context.fillStyle = "white"
                context.strokeStyle = "white"

                switch(sizevalue) {
                case "1":
                    context.arc(width/2, height/2, width/8, 0, 2*Math.PI, true)
                    break;

                case "2":
                    context.arc(width/2, height/2, width/7, 0, 2*Math.PI, true)
                    break;
                case "3":
                    context.arc(width/2, height/2, width/6, 0, 2*Math.PI, true)
                    break;
                case "4":
                    context.arc(width/2, height/2, width/5, 0, 2*Math.PI, true)
                    break;
                case "5":
                    context.arc(width/2, height/2, width/4, 0, 2*Math.PI, true)
                    break;
                default:
                    break;
                }
                context.fill();
                context.stroke();
            }
        }

    }

    //    Text{
    //        text: sizevalue
    //        color: "white"
    //        font.family: "aria"
    //        font.bold: true
    //        font.pixelSize: 10
    //        anchors.centerIn: sizebutton
    //    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            starsizeview.currentIndex = index
            changeStarSize()
        }
        hoverEnabled: true
        onEntered: {
            sizebutton.color = Qt.darker(sizebutton.color)
        }
        onExited: {
            sizebutton.color = "#90262930"
        }
    }
}

