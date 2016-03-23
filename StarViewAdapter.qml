import QtQuick 2.0
import QtQuick.Window 2.0
Item {
    width: loadedstarview.childrenRect.width
    height: loadedstarview.childrenRect.height / 10
    Rectangle{
        id: viewRec
        width: loadedstarview.childrenRect.width
        height: loadedstarview.childrenRect.height / 10
        radius: 5
        color: Qt.rgba(28, 42, 57, 0.5)
    }

    Text{
        text: name
        color: "white"
        font.bold: true
        font.pixelSize: 22
        anchors.centerIn: viewRec
    }

    MouseArea {
        anchors.fill: parent
        onClicked: starView.currentIndex = index
    }
}

