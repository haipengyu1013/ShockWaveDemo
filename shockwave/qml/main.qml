import QtQuick 2.2

Rectangle {
    width: 800
    height: 600
    color: "#00ffffff"

    Image {
        id: image
        source: "../images/background.jpg"

        Text {
            anchors.centerIn: parent
            font.pixelSize: 60
            color: "white"
            text: "Shock Wave , Just Click it"
        }
    }

    ShaderEffectSource {
        id: effectSource
        sourceItem: image
//        hideSource: true
    }

    ShaderEffect {
        id: effectOutput
        anchors.fill: parent

        property variant source: effectSource
        property real dividerValue: 1
        property real granularity: 0.5 * 20
        property real weight: 0.5
        property real centerX: 0.7
        property real centerY: 0.7
//        parameters: ListModel {
//            ListElement {
//                name: "Amplitude"
//                value: 0.5
//            }
//        }

        // Transform slider values, and bind result to shader uniforms
        property real amplitude: 0.5 * 0.05

        property real frequency: 20
//        property real time: 0
//            NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 600 }
        property real time: 1
        QtObject {
            id: d
            property string fragmentShaderCommon: "
                #ifdef GL_ES
                    precision mediump float;
                #else
                #   define lowp
                #   define mediump
                #   define highp
                #endif // GL_ES
            "
        }
        Component.onCompleted: {
            fragmentShader = d.fragmentShaderCommon +  tools.readFile(":/shaders/shockwave.fsh");
        }
        NumberAnimation {
            id: animation
            target: effectOutput
            property: "time"
            from: 0
            to: 2
            duration: 2000
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                effectOutput.centerX = mouseX / parent.width
                effectOutput.centerY = mouseY / parent.height
                animation.running = true
            }
        }
    }
}
