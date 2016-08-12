import QtQuick 2.0

Rectangle {
    
    color: "#00000000"
    height: parent.height*factor_rheight
    width: parent.width*factor_rwidth
    
    property real factor_rwidth: 1.0
    property real factor_rheight: 1.0
    property bool debugging: false
    onDebuggingChanged: {
        border.color = debugging == false ? "00000000" : "red" 
    }

}
