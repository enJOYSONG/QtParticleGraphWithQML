import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.XmlListModel 2.0

Rectangle {
    width : parent.width
    color:"#00FFFFFF"

    ColorButtonViewAdapter { id: colorbuttonAdapter }

    ListView {
        id: colorListview
        width : parent.width
        orientation: ListView.Horizontal
        model : xmlModel
        anchors.fill: parent
        spacing: 2

        highlight: Rectangle {
            color:{
                switch(colorListview.currentIndex) {
                    case 0:
                        return "red";
                    case 1:
                        return "green";
                    case 2:
                        return "blue";
                    case 3:
                        return "silver";
                    case 4:
                        return "#f2b61d";
                    default:
                        break;
                }
            }
            Text {
                anchors.centerIn: parent
                color: 'white'
            }
        }
        delegate: ColorButtonViewAdapter{itemwidth: 60; itemheight: parent.height}
        header: Rectangle {
            width: 20
            height: 60
            color:"#1ca8dd"
            Text {
                text: "\n색\n상\n"
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 13
                font.bold: true

            }
        }
    }

    XmlListModel {
        id : xmlModel
        source : "/colordata.xml"
        query: "/root/Color"
        XmlRole { name: "colorname"; query: "@Name/string()" }
        XmlRole { name: "colorkey"; query: "@ColorKey/string()" }
        XmlRole { name: "KCIO4"; query: "@KCIO4/string()" }
        XmlRole { name: "KNO3"; query: "@KNO3/string()" }
        XmlRole { name: "C3"; query: "@C3/string()" }
        XmlRole { name: "Rubber"; query: "@Rubber/string()" }
        XmlRole { name: "Na2CO3"; query: "@Na2CO3/string()" }
        XmlRole { name: "Sr"; query: "@Sr/string()" }
        XmlRole { name: "Al"; query: "@Al/string()" }
        XmlRole { name: "S"; query: "@S/string()" }
        XmlRole { name: "H3BO3"; query: "@H3BO3/string()" }
        XmlRole { name: "C6H2N4"; query: "@C6H2N4/string()" }
        XmlRole { name: "Fe2O3"; query: "@Fe2O3/string()" }
        XmlRole { name: "Dextrin"; query: "@Dextrin/string()" }
        XmlRole { name: "BaNO32"; query: "@BaNO32/string()" }

    }

    function changeStarColor() {
        switch(colorListview.currentIndex) {
            case 0:
                starview.starimgparticle.color = "red";
                break;
            case 1:
                starview.starimgparticle.color = "green";
                break;
            case 2:
                starview.starimgparticle.color = "blue";
                break;
            case 3:
                starview.starimgparticle.color = "silver";
                break;
            case 4:
                starview.starimgparticle.color = "yellow";
                break;
            default:
                break;
        }
    }
}
