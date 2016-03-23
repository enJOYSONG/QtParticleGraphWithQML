import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: verticaladapter
    property int controllerWidth
    property int controllerHeight

    width: {
        if(value > 0) {
            visible=true
            return controllerWidth
        }
        else {
            visible=false
            return 0
        }
        //console.log(name + "" + value)
    }
    height: controllerHeight
    anchors.rightMargin: 10

    //height: (value > 0)?controllerHeight:0 진행중0303송승희

//    Rectangle{
//        id: chemidelegate
//        width: parent.width
//        height: parent.height
//        radius: 5
//        color: Qt.rgba(28, 42, 57, 0.5)

//        Row{
//            visible: (parent.width <= 0)?false:true
//            anchors.centerIn: chemidelegate
//            spacing: 2
//            Rectangle{
//                width: 30
//                height: 130
//                anchors.verticalCenter: parent.verticalCenter
//                color: "white"
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: "#1C3A49" }
//                    GradientStop { position: 1.0; color: "#2C2A39" }
//                }

                Text {
                    id: graphPersent
                    anchors.bottom: graphrec.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 10

                    text: value + "%"
                    font.pixelSize: 14
                    color:"white"
                    horizontalAlignment: Text.AlignHCenter
                    visible:false
                }
                Rectangle{
                    id: graphrec
                    width: 30
                    height: { //진행중 정혜진
                        if(value>100) {
                            graphMAX.visible = true
                            return 170
                        }
                        else {
                            graphMAX.visible = false
                            return 170 * value * 0.01
                        }
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom:parent.bottom
                    gradient: Gradient { //1da8db
                        GradientStop { position: 0.0; color: "#007be0" }
                        GradientStop { position: 1.0; color: "#4b369c" }
                    }

                    Text {
                        id:graphMAX
                        visible: false
                        text:"MAX"
                        color:"white"
                        font.pixelSize: 12
                        anchors.horizontalCenter: graphrec.horizontalCenter
                    }

                }
                Text {
                    fontSizeMode: Text.VerticalFit
                    anchors.top: graphrec.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: 10
                    text: name
                    font.pixelSize: 11
                    color:"white"
                    horizontalAlignment: Text.AlignHCenter
                }
                Rectangle {
                    width: graphrec.width+80
                    height: 2
                    color:"#4b369c"
                    anchors.bottom: graphrec.bottom
                 //   anchors.horizontalCenter: graphrec.horizontalCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onEntered: {
                        graphrec.color = Qt.darker(graphrec.color)
                        graphPersent.visible = true
                    }
                    onExited: {
                        graphPersent.visible = false
                    }
                    hoverEnabled: true
                }
//            }
//        }
//    }

}
