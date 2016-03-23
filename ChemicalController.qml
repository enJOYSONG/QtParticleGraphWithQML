import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id: chemical
    property int controllerWidth
    property int controllerHeight


    width: controllerWidth
    height: controllerHeight
    //height: (value > 0)?controllerHeight:0 진행중0303송승희

    Rectangle{
        id: chemidelegate
        width: parent.width
        height: parent.height
        color:"#f3f3f3"
        border.color: "#dddddd"
        border.width: 3

    }

    Row{
        anchors.centerIn: chemidelegate
        Rectangle{
            width: 70
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            color: "#00ffffff"
            Text{
                text:name
                width: parent.width
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.bold: true
                color: "#79797d"
            }
        }
        Rectangle{
            width: 40
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            color: "#00ffffff"
            Text{
                id: chemicalPersentText
                text:value + "%"
                anchors.centerIn: parent
                font.bold: true
                color:"#0a7de2"
            }
        }
        Rectangle{
            width: 130
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            color: "#dddddd"//Qt.lighter(chemidelegate.color)
            //gradient: Gradient {
            //    GradientStop { position: 0.0; color: "#ffffff" }
           //     GradientStop { position: 0.49; color: "#f1f1f1" }
           //     GradientStop { position: 0.50; color: "#e1e1e1" }
            //    GradientStop { position: 1.00; color: "#f6f6f6" }
            //}
            Rectangle{
                id: graphrec
                width: parent.width* value * 0.01
                height: parent.height-10
                anchors.verticalCenter: parent.verticalCenter
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#007be0" }
                    GradientStop { position: 1.0; color: "#4b369c" }
                }
            }
        }
        Rectangle{
            width: 50
            height: 50
            anchors.verticalCenter: parent.verticalCenter
            color:"#00FFFFFF"
            Row {
                anchors.verticalCenter: parent.verticalCenter
                Button {
                    id: minusBtn
                    width: 30
                    height: 30
                    text: "-"
                    onClicked: {
                        if(value > 0) {
                            graphmodel.setProperty(index, "value", value - 1)
                            if(starview.getTotalChemical() < 100){
                                starview.bounceAnimation.start()
                            }
                        }
                    }
                    style: ButtonStyle {
                        background: Rectangle {
                            border.width: 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: control.hovered ? "darkgrey" : "#ffffff" }
                                GradientStop { position: 0.49;color: control.hovered ? "darkgrey" : "#f1f1f1" }
                                GradientStop { position: 0.50;color: control.hovered ? "darkgrey" : "#e1e1e1" }
                                GradientStop { position: 1.00; color: control.hovered ? "darkgrey" : "#f6f6f6" }
                            }
                        }
                    }
                }
                Button {
                    id: plusBtn
                    width: 30
                    height: 30
                    text: "+"
                    onClicked: {
                        //if(starview.getTotalChemical() < 100) {
                        graphmodel.setProperty(index, "value", value + 1)

                        if(starview.getTotalChemical() < 100){
                            starview.bounceAnimation.start()
                        }
                        // }
                    }
                    style: ButtonStyle {
                        background: Rectangle {
                            border.width: 1
                            border.color: "#888"
                            radius: 4
                            gradient: Gradient {
                                GradientStop { position: 0.0; color: control.hovered ? "darkgrey" : "#ffffff" }
                                GradientStop { position: 0.49;color: control.hovered ? "darkgrey" : "#f1f1f1" }
                                GradientStop { position: 0.50;color: control.hovered ? "darkgrey" : "#e1e1e1" }
                                GradientStop { position: 1.00; color: control.hovered ? "darkgrey" : "#f6f6f6" }
                            }
                        }
                    }
                    onHoveredChanged: {

                    }
                }
            }
        }
    }

    Timer {
        id:timer
        interval: 80; running: true; repeat: true
        onTriggered: {
            if(starview.getTotalChemical() > 100) { //진행중 정혜진
                piechartview.opacityAnimation.start()
            }
            else {
                piechartview.opacityAnimation.stop()
                piechartview.chemicalTextRec.opacity = 100;
            }

            if(minusBtn.pressed) {
                if(value > 0) {
                    graphmodel.setProperty(index, "value", value - 1)
                }
            }
            else if(plusBtn.pressed) {
                //if(starview.getTotalChemical() < 100) {
                graphmodel.setProperty(index, "value", value + 1)
                //}
            }
        }
    }
}
