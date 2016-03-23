import QtQuick 2.0

Item {
    width: 150
    height: 40
    property alias  graphName: graphComponentName.text
    property alias graphWidth : graphBar.width
    property int index

    Column {
        Text {
            id: graphComponentName
            color: "white"
        }

        Rectangle {
            id: graphBar
            height: 20
        }
    }
}
