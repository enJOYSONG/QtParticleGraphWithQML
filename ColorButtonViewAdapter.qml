import QtQuick 2.0

Item {
    property int itemwidth
    property int itemheight
    width: itemwidth
    height: itemheight
    Rectangle{
        id: colorbutton
        width: parent.width
        height: parent.height
    //    color: Qt.rgba(28, 42, 57, 0.5)
        color:"#90262930"
        radius: 5
    }

    Text{
        text: colorname
        color: "white"
        font.bold: true
        font.pixelSize: 10
        anchors.centerIn: colorbutton
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            colorListview.currentIndex = index
            changeStarColor()
            console.log(chemicalElement[0].XmlName)
            graphmodel.setProperty(0, "value", KCIO4)
            graphmodel.setProperty(1, "value", KNO3)
            graphmodel.setProperty(2, "value", C3)
            graphmodel.setProperty(3, "value", Rubber)
            graphmodel.setProperty(4, "value", Na2CO3)
            graphmodel.setProperty(5, "value", Sr)
            graphmodel.setProperty(6, "value", Al)
            graphmodel.setProperty(7, "value", S)
            graphmodel.setProperty(8, "value", H3BO3)
            graphmodel.setProperty(9, "value", C6H2N4)
            graphmodel.setProperty(10, "value", Fe2O3)
            graphmodel.setProperty(11, "value", Dextrin)
            graphmodel.setProperty(12, "value", BaNO32)

        }
        hoverEnabled: true
        onEntered: {
            colorbutton.color = Qt.darker(colorbutton.color)
        }
        onExited: {
            colorbutton.color = "#90262930"
        }
    }
}

