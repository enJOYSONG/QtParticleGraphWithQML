import QtQuick 2.0

Rectangle {
    width : 160
    height: parent.parent.height
    color:"#00FFFFFF"

    ListView {
        id: starView
        anchors.fill: parent;
        model: starmodel
        delegate:StarViewAdapter{}
        spacing: 1
        header: Rectangle {
            width: parent.width
            height: 20
            Text {
                text: "스타"
                color: "black"
                anchors.centerIn: parent
            }
        }
        highlight: Rectangle {
            color: 'grey'
            Text {
                anchors.centerIn: parent
                //text: 'Hello ' + starmodel.get(starView.currentIndex).name
                color: 'white'
            }
        }
    }

    ListModel {
       id: starmodel
       ListElement { name: "1.star"; index: 0
       }
       ListElement { name: "2.star"; index: 1
       }
       ListElement { name: "3.star"; index: 2
       }
       ListElement { name: "4.star"; index: 3
       }
    }

}


