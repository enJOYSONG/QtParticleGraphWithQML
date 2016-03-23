import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle {
    color:"#00FFFFFF"

    Rectangle{
        id:graphText
        height: parent.height
        color:"#00FFFFFF"
        anchors.right: bargraph.left
        anchors.bottom: bargraph.bottom
            Text {
                id: graphText100
                font.pixelSize: 14
                color:"white"
                text: "100%"
                anchors.bottom: graphText80.top
                anchors.right: parent.right
                anchors.margins: 18
            }
            Text {
                id: graphText80
                font.pixelSize: 14
                color:"white"
                text: "80%"
                anchors.bottom: graphText60.top
                anchors.right: parent.right
                anchors.margins: 18

            }
            Text {
                id: graphText60
                font.pixelSize: 14
                color:"white"
                text: "60%"
                anchors.bottom: graphText40.top
                anchors.right: parent.right
                anchors.margins: 18

            }
            Text {
                id: graphText40
                font.pixelSize: 14
                color:"white"
                text: "40%"
                anchors.bottom: graphText20.top
                anchors.right: parent.right
                anchors.margins: 18

            }
            Text {
                id: graphText20
                font.pixelSize: 14
                color:"white"
                text: "20%"
                anchors.bottom: graphText0.top
                anchors.right: parent.right
                anchors.margins: 16

            }
            Text {
                id: graphText0
                font.pixelSize: 14
                color:"white"
                text: "0%   "
                anchors.bottom: graphText.bottom
                anchors.right: parent.right
            }
    }


    ListView {
        id: bargraph
        anchors.fill: parent
        anchors.bottomMargin: 100
        anchors.leftMargin: 100
        orientation: ListView.Horizontal
        delegate: BarChartViewAdapter{
            controllerWidth: 50; controllerHeight: parent.parent.height;

        }
        spacing: 10

        Rectangle {
            id:graphBottomBar
            width: 350
            height: 2
            color:"#4b369c"
            anchors.bottom: bargraph.bottom
            anchors.left: bargraph.left
        }

        model: graphmodel

    }

//    Rectangle {
//        id:graphBottomBar
//        width: (graphrec.width+20)
//        height: 1
//        color:"white"
//        anchors.bottom: bargraph.bottom
//        anchors.left: bargraph.left
//    }

}//진행중0303송승희

