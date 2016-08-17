import QtQuick 2.5
import "js/responsive.js" as Responsive

Rectangle {
    id: root
    anchors.fill: parent
    
    
    property var windowFactor: Qt.vector2d(1.0,1.0);
    
    
    signal exitPressed
    signal capturePressed
    signal templatePressed
    
    Image {
        id: image1
        width:parent.width
        height:parent.height
        source:"qrc:/images/AutoFormaxLogoBack.png"
        fillMode: Image.Stretch
    }

    CustomArea{
        
        id:headerArea
        factor_rheight: .05
        debugging:false
        anchors.top:parent.top
    }
    CustomArea{
        
        id:topArea
        factor_rheight: .75
        debugging:false
    
    }
    CustomArea{
        
        id:bottomAreaLeft
        factor_rheight: .2
        factor_rwidth: .333
        debugging:false
        anchors.top:topArea.bottom
    
    }
    CustomArea{
        
        id:bottomAreaCenter
        factor_rheight: .2
        factor_rwidth: .333
        debugging:false
        anchors.top:topArea.bottom
        anchors.left:bottomAreaLeft.right
        
    }
    CustomArea{
        
        id:bottomAreaRight
        factor_rheight: .2
        factor_rwidth: .333
        debugging:false
        anchors.top:topArea.bottom
        anchors.left:bottomAreaCenter.right
    
    }
    CustomArea{
        
        id:footerArea
        factor_rheight: .05
        debugging:false
        anchors.bottom:parent.bottom
    }
    
    Image {
        
        id: exitButton
        width: sourceSize.width * windowFactor.x  
        height: sourceSize.height * windowFactor.y
        source: "qrc:/images/ExitButton.png"
        fillMode: Image.Stretch
        anchors.centerIn: bottomAreaRight
        MouseArea{
            anchors.fill: parent
            onClicked: root.exitPressed()
        }

    }

    Image {
        
        id: captureButton
        width: sourceSize.width * windowFactor.x  
        height: sourceSize.height * windowFactor.y
        source: "qrc:/images/CaptureButton.png"
        fillMode: Image.Stretch
        anchors.centerIn: bottomAreaCenter
        MouseArea{
            anchors.fill: parent
            onClicked: root.capturePressed()
        }
    }

    Image {
        
        id: templatesButton
        width: sourceSize.width * windowFactor.x  
        height: sourceSize.height * windowFactor.y
        source: "qrc:/images/TemplatesButton.png"
        fillMode: Image.Stretch
        anchors.centerIn: bottomAreaLeft
        MouseArea{
            anchors.fill: parent
            onClicked: root.templatePressed()
        }
    }
    
}


