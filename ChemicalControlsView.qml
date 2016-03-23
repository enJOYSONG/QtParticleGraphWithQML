import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    property alias chemiView: chemicalView

    width : 320
    height: parent.parent.height
    color:"#00FFFFFF"
    //    ComboBox {
    //        width: parent.parent.width
    //        height: (parent.parent.height / 10)
    //        model: [ "all", "red", "blue", "green", "silver", "gold" ]
    //    }
    ListView {
        id: chemicalView
        anchors.fill: parent
        spacing: 1
        header: Rectangle {
            width: parent.width
            height: 50
            color:"#262930" //진행중 정혜진

            Text {
                text: "화학 조성물"
                color: "#1ca8dd"
                font.bold:true
                font.family: "Helvetica"
                anchors.centerIn: parent
                font.pixelSize: 20
            }
        }
        delegate: ChemicalController {
            //chemicalName: name; index: index;
            //sliderValue: value;
            controllerWidth: parent.parent.width; controllerHeight: 50;
        }


        model: graphmodel

    }
}
