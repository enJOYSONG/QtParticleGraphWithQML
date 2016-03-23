import QtQuick 2.0
import QtQuick.Particles 2.0

Rectangle {
    width : (parent.parent.parent.parent.width / 5) * 3
    height: (parent.parent.parent.parent.height / 10) * 9

    property int totalChemical: getTotalChemical()
    property alias starparticle: particles
    property alias starimgparticle: starimgparticle

    color: "#00FFFFFF"

    ParticleSystem {
        id: particles
        anchors.centerIn: parent
        width: 300
        height: 300
        ImageParticle {
            id:starimgparticle
            groups: ["center","edge"]
            anchors.fill: parent
            source: "qrc:///particleresources/glowdot.png"
            colorVariation: 0.1
            color: "#009999FF"
        }

        Emitter {
            anchors.fill: parent
            group: "center"
            emitRate: 400
            lifeSpan: 2000
            size: 20
            sizeVariation: 2
            endSize: 0
            //! [0]
            shape: EllipseShape {fill: false}
            velocity: TargetDirection {
                targetX: particles.width/2
                targetY: particles.height/2
                proportionalMagnitude: true
                magnitude: 0.5
            }
            //! [0]
        }

        Emitter {
            anchors.fill: parent
            group: "edge"
            startTime: 2000
            emitRate: 2000
            lifeSpan: 2000
            size: 28
            sizeVariation: 2
            endSize: 16
            shape: EllipseShape {fill: false}
            velocity: TargetDirection {
                targetX: particles.width/2
                targetY: particles.height/2
                proportionalMagnitude: true
                magnitude: 0.1
                magnitudeVariation: 0.1
            }
            acceleration: TargetDirection {
                targetX: particles.width/2
                targetY: particles.height/2
                targetVariation: 200
                proportionalMagnitude: true
                magnitude: 0.1
                magnitudeVariation: 0.1
            }
        }

    }

    function getTotalChemical() {
        var total = 0
        var count = graphmodel.count
        for(var i = 0; i < count ; i++) {
            total = total + graphmodel.get(i).value
        }
        return total
    }
}

