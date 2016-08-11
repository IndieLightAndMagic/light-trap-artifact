import QtQuick 2.0


Rectangle {
    
    
    id: root
    x: 0
    y: 0
    width: parent.width
    height: parent.height
    color: "#ffffff"


    property real xpos :  0.3675 * root.width
    property real bwidthfactor : root.height * 0.7350
    property real bheight : root.height *  0.7350 * (16/9)
    
    
    
    function ypos(y){
        console.log(y,root.height * (y / 1920))
        return root.height * (y / 1920)
    }
    
    Image {
        id: image1
        width:bwidth
        height:bheight
        x: xpos
        y: ypos(195)
        source: "resources/Templates.png"
        fillMode: Image.Stretch
        
    }
    
    Image {
        id: image2
        width:bwidth
        height:bheight
        x: xpos
        y: ypos(788)
        source: "resources/Capture.png"
        fillMode: Image.Stretch
    }
    
    Image {
        id: image3
        width:bwidth
        height:bheight
        x: xpos
        y: ypos(1345)
        source: "resources/Exit.png"
        fillMode: Image.Stretch
    }
}


