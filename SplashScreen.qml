import QtQuick.Window 2.0 
import QtQuick 2.0
Image{
    id:root
    width:parent.width
    height:parent.height
    source:"qrc:/resources/AutoFormaxLogo.png"
    fillMode: Image.Stretch
    
    property int timeout_ms: 2000
    
    signal timeout
    
    MouseArea{
        anchors.fill: parent
        onClicked: Qt.quit()
    }
    Timer{
        interval: timeout_ms
        running: true
        onTriggered: {
            visible = false
            root.timeout()
        }
    }
}
