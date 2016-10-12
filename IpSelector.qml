import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Window 2.0


Rectangle {
    id:root
    visible: true
    property color transparent: "#00000000"
    property color borderColor : "#561429"
    property color bgColor: "#222222"
    property color bgTextColor: "#666666"
    property color fgTextColor: "#A22244"
    property int fontSize: 48
    property string fontfamily: "Helvetica"
    property real unitW: width / 5
    
    
    
    
    //Dialogue
    property int connectWidth: 2
    property int hostWidth : 3
    property int tcpPortWidth : 1
    
    property string hostString : "autoformax.com"
    property string portString : "8989"
    property string connectString : qsTr("Conectar")
    
    color:bgColor
    opacity:0
    y:0
    x:-width    
    signal configureHost(var host, var port)
    state:"idleStage"
    onStateChanged: console.log("New State:",state)
    states: [ 
        State {
            name: "cameraShotState"
        },
        State {
            name: "ipSelectState"
        },
        State {
            name: "waitingForConnectionState"
        }
        
    ]
    transitions: [
        Transition {
            from:"cameraShotState"
            to:"ipSelectState"
            PropertyAnimation{ target:root; property:"x";to:0;duration:750;easing.type:Easing.OutQuart}
            PropertyAnimation {target:root; property:"opacity";to:0.8;duration:750;easing.type:Easing.OutQuart}
            PropertyAnimation {target: connectButton;properties: "color";to: bgColor;duration: 500;easing.type:Easing.OutQuart}
            PropertyAnimation {target: tiConnectButton;properties: "color";to: fgTextColor;duration: 750;easing.type:Easing.OutQuart}
        },

        Transition {
            from: "ipSelectState"
            to: "waitingForConnectionState"
            PropertyAnimation {target:root; property:"opacity";to:0.5;duration:750;easing.type:Easing.OutQuart}
            PropertyAnimation {target: connectButton;properties: "color";to: fgTextColor;duration: 500;easing.type:Easing.OutQuart}
            PropertyAnimation {target: tiConnectButton;properties: "color";to: bgColor;duration: 750;easing.type:Easing.OutQuart}
            
            SequentialAnimation{
                PauseAnimation {duration: 750}
                PropertyAnimation{ target:root; property:"x";to:-width;duration:500;easing.type:Easing.OutQuart}
            }

        },
        Transition {
            from: "ipSelectState"
            to: "cameraShotState"
            PropertyAnimation {target:root; property:"opacity";to:0.5;duration:750;easing.type:Easing.OutQuart}
            PropertyAnimation {target: connectButton;properties: "color";to: fgTextColor;duration: 500;easing.type:Easing.OutQuart}
            PropertyAnimation {target: tiConnectButton;properties: "color";to: bgColor;duration: 750;easing.type:Easing.OutQuart}
            
            SequentialAnimation{
                PauseAnimation {duration: 750}
                PropertyAnimation{ target:root; property:"x";to:-width;duration:500;easing.type:Easing.OutQuart}
            }

        },
        Transition {
            from: "waitingForConnectionState"
            to: "cameraShotState"
            PropertyAnimation {target:root; property:"opacity";to:0.5;duration:750;easing.type:Easing.OutQuart}
            PropertyAnimation {target: connectButton;properties: "color";to: fgTextColor;duration: 500;easing.type:Easing.OutQuart}
            PropertyAnimation {target: tiConnectButton;properties: "color";to: bgColor;duration: 750;easing.type:Easing.OutQuart}
            
            SequentialAnimation{
                PauseAnimation {duration: 750}
                PropertyAnimation{ target:root; property:"x";to:-width;duration:500;easing.type:Easing.OutQuart}
            }

        },
        Transition {
            from: "waitingForConnectionState"
            to: "ipSelectState"
            PropertyAnimation{ target:root; property:"x";to:0;duration:500;easing.type:Easing.OutQuart}
            
            SequentialAnimation{
                PauseAnimation {duration: 500}
                PropertyAnimation {target:root; property:"opacity";to:0.8;duration:750;easing.type:Easing.OutQuart}
                PropertyAnimation {target: connectButton;properties: "color";to: bgColor;duration: 500;easing.type:Easing.OutQuart}
                PropertyAnimation {target: tiConnectButton;properties: "color";to: fgTextColor;duration: 750;easing.type:Easing.OutQuart}
            }
        }

    ]
    
    Rectangle {
        id:centerAnchor
        color:transparent
        width:parent.width
        height:tiHost.contentHeight
        anchors.centerIn: parent
    }
    Rectangle {
        id:tcpPort
        width: tcpPortWidth*unitW
        height: tiPort.contentHeight*1.45
        anchors.top: centerAnchor.bottom
        anchors.horizontalCenter: centerAnchor.horizontalCenter
        color: transparent
        clip: true
        TextInput {
            id: tiPort
            anchors.fill : parent
            color: fgTextColor
            font.pixelSize: fontSize
            font.family: fontfamily
            text:portString
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
            
        }
        Rectangle{
            width:parent.width
            height:2
            border.color: borderColor
            anchors.bottom: parent.bottom            
        }        
    }
    
    Rectangle {
        id:host 
        width: hostWidth*unitW
        height: tiHost.contentHeight*1.45
        anchors.bottom: centerAnchor.top
        anchors.horizontalCenter: centerAnchor.horizontalCenter
        color:transparent
        clip:true
        TextInput {
            id:tiHost
            anchors.fill:parent
            color: fgTextColor
            font.pixelSize: fontSize
            font.family: fontfamily
            text:hostString
            horizontalAlignment: TextInput.AlignHCenter
            verticalAlignment: TextInput.AlignVCenter
        }
        Rectangle{
            width:parent.width
            height:2
            border.color: borderColor
            anchors.bottom: parent.bottom            
        }        
    }
    Rectangle {
        id: centerBottomAnchor
        color: transparent
        width: parent.width
        height: tiHost.contentHeight
        anchors.top: tcpPort.bottom
    }
    
    Rectangle {
        id:connectButton
        anchors.top:centerBottomAnchor.bottom
        anchors.horizontalCenter: centerBottomAnchor.horizontalCenter
        width: connectWidth*unitW
        height: tiConnectButton.contentHeight*1.45
        radius: tiConnectButton.contentHeight*.25
        border.color: borderColor
        border.width: 2
        color:bgColor
        clip: true

        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log("Clicked")
                configureHost(tiHost.text,tiPort.text)
            }
        }
        Text {
            id:tiConnectButton
            anchors.fill: parent
            color: fgTextColor
            font.pixelSize: fontSize / 2
            font.italic: true
            font.family: fontfamily
            text: connectString
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            
        }
        
    }
    
    
    
}
