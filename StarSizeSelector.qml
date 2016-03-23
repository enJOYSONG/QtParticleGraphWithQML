import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    width : parent.width
    color:"#00FFFFFF"
    StarSizeSelectAdapter { id: starsizeselectAdapter }
    ListView {
        id: starsizeview
        width : parent.width
        orientation: ListView.Horizontal
        anchors.fill: parent
        spacing: 2
        delegate: StarSizeSelectAdapter{itemwidth: 60; itemheight: parent.height}
        model: ListModel {
            ListElement {
                sizevalue: "1"
            }
            ListElement {
                sizevalue: "2"
            }
            ListElement {
                sizevalue: "3"
            }
            ListElement {
                sizevalue: "4"
            }
            ListElement {
                sizevalue: "5"
            }
        }
        highlight: Rectangle {
            color: 'darkgrey'
            Text {
                anchors.centerIn: parent
                color: 'white'
            }
        }
        header: Rectangle {
            width: 20
            height: 60
            color:"#1ca8dd"
            Text {
                text: "스\n타\n크\n기"
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 12
                font.bold: true
            }
        }
    }

    function changeStarSize() {
        switch(starsizeview.currentIndex) {
        case 0:
            starview.starparticle.width = 300;
            starview.starparticle.height = 300;
            break;
        case 1:
            starview.starparticle.width = 320;
            starview.starparticle.height = 320;
            break;
        case 2:
            starview.starparticle.width = 340;
            starview.starparticle.height = 340;
            break;
        case 3:
            starview.starparticle.width = 360;
            starview.starparticle.height = 360;
            break;
        case 4:
            starview.starparticle.width = 380;
            starview.starparticle.height = 380;
            break;
        default:
            break;
        }
    }
}
