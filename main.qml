import QtQuick 2.3
import QtQuick.Controls 1.4

ApplicationWindow {
    width: 1270
    height: 768
    visible: true
    property alias graphmodel: graphmodel
    property alias chemicalElement: chemicalelement.caArray
    property int total: starview.getTotalChemical()
    Image {
        id: bg_image
        anchors.fill: parent;
        source: "images/galaxy_starfield.png"
    }

    ChemicalElement {
        id: chemicalelement
    }

    //Row {
    //id: row
    LoadedStarView {
        id: loadedstarview
        width: 1
        anchors.left: parent.left
        visible: false
    }

    ChemicalControlsView {
        id: chemicalcontrolsView
        anchors.right: parent.right
    }


    BarChartView {
        id: barchartview
        height: 200
        anchors.bottom: parent.bottom
        anchors.left: loadedstarview.right
        anchors.right: chemicalcontrolsView.left
    }

    Column{
        id: topColumn
        anchors.top: parent.top
        anchors.left: loadedstarview.right
        anchors.right: chemicalcontrolsView.left
        anchors.leftMargin: 10
        spacing: 3
        StarSizeSelector {
            id: starsizeselector
            height: 60
        }
        ColorButtonView {
            id: colorbuttonview

            height: 60
        }
    }
    Row{
        anchors.top:topColumn.bottom
        anchors.bottom: barchartview.top
        anchors.horizontalCenter: topColumn.horizontalCenter
        //anchors.centerIn: parent
        StarView {
            id: starview
            width: {
                if(parent.height > barchartview.width / 2)
                    return barchartview.width / 2
                else
                    return parent.height
            }
            height: width
            anchors.verticalCenter: parent.verticalCenter
        }

        PieChartView {
            id: piechartview
            width: {
                if(parent.height > barchartview.width / 2)
                    return barchartview.width / 2
                else
                    return parent.height
            }
            height: width
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    //        }

    ListModel {
        id: graphmodel
    }

    Component.onCompleted: {
        for(var i = 0 ; i < chemicalelement.caArray.length ; i++) {
            graphmodel.append({"name":chemicalelement.caArray[i].Name,"value":0})
        }
    }

    onTotalChanged: {
        piechartview.pievalue = total
        piechartview.piechart.requestPaint()

    }

    //}
}
