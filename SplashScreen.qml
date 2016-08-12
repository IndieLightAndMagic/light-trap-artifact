import QtQuick.Window 2.0 
import QtQuick 2.7
Image{
    id:root
    width:parent.width
    height:parent.height
    source:"qrc:/images/AutoFormaxLogo.png"
    fillMode: Image.Stretch
    
    property alias fadeout_timer: fadeout_timer
    property alias invisible_timer: invisible_timer
    property int timeout_ms: 2000
    signal timeout
    
    MouseArea{
        anchors.fill: parent
        onClicked: Qt.quit()
    }
    Timer{
        id:invisible_timer
        interval: timeout_ms
        running: false
        onTriggered: {
            visible = false
            root.timeout()
        }
    }
    OpacityAnimator{
        id:fadeout_timer
        target:root
        from:1
        to:0
        duration:timeout_ms
        running:false
        onRunningChanged: {
            if (running == true)
                fadeout_timer_timer.running = true
        }
    }
    Timer {
        id: fadeout_timer_timer
        interval: 2000
        running: false
        onTriggered: {
            root.timeout()
        }            
    }

}
