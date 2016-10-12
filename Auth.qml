import QtQuick 2.7
import QtQuick.Controls 1.5
import QtQuick.Window 2.0


Rectangle {
    visible: true
    anchors.fill:parent    
    //Application General    
    property color borderColor : "#561429"
    property color bgColor: "#222222"
    property color bgTextColor: "#666666"
    property color fgTextColor: "#A22244"
    property int fontSize: 48
    property string fontfamily: "Helvetica"
    property real unitW: width / 5
    
    
    
    
    //Dialogue
    property int authButtonWidth: 1
    property int userNameWidth : 3
    property int passwordWidth : 1
    
    property string userNameString : "autoformax.com"
    property string portString : "8989"
    property string authButtonString : qsTr("Log In")
    
    color:bgColor
    signal connect(var userName, var port)
    Rectangle {
        id:centerAnchor
        color:bgColor
        width:parent.width
        height:tiUserName.contentHeight
        anchors.centerIn: parent
    }
    Rectangle {
        id:password
        width: passwordWidth*unitW
        height: tiPassword.contentHeight*1.45
        anchors.top: centerAnchor.bottom
        anchors.horizontalCenter: centerAnchor.horizontalCenter
        color: bgColor
        clip: true
        TextInput {
            id: tiPassword
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
        id:userName 
        width: userNameWidth*unitW
        height: tiUserName.contentHeight*1.45
        anchors.bottom: centerAnchor.top
        anchors.horizontalCenter: centerAnchor.horizontalCenter
        color:bgColor
        clip:true
        TextInput {
            id:tiUserName
            anchors.fill:parent
            color: fgTextColor
            font.pixelSize: fontSize
            font.family: fontfamily
            text:userNameString
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
        color: bgColor
        width: parent.width
        height: tiUserName.contentHeight
        anchors.top: password.bottom
    }
    
    Rectangle {
        id:authButton
        anchors.top:centerBottomAnchor.bottom
        anchors.horizontalCenter: centerBottomAnchor.horizontalCenter
        width: authButtonWidth*unitW
        height: tiAuthButton.contentHeight*1.45
        radius: tiAuthButton.contentHeight*.25
        border.color: borderColor
        border.width: 2
        color:bgColor
        clip: true
        PropertyAnimation  {
            id: buttonClickColorAnimation
            target: authButton
            properties: "color"
            to: fgTextColor
            duration: 500
        }
        PropertyAnimation {
            id: buttonTextClickColorAnimation
            target: tiAuthButton
            properties: "color"
            to: bgColor
            duration: 750
        }

        MouseArea{
            anchors.fill:parent
            onClicked: {
                console.log("Clicked")
                buttonClickColorAnimation.start()
                buttonTextClickColorAnimation.start()
                
            }
        }
        Text {
            id:tiAuthButton
            anchors.fill: parent
            color: fgTextColor
            font.pixelSize: fontSize / 2
            font.italic: true
            font.family: fontfamily
            text: authButtonString
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            
        }
        
    }
    
}
