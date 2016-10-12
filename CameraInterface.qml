import QtQuick 2.0
import QtMultimedia 5.5
import com.autoformax.videoprocess 1.0
import QtGraphicalEffects 1.0

Rectangle {
    
    
    id: root
    color: "#00000000"
    anchors.fill: parent    
    
    
    property var windowFactor: Qt.vector2d(1.0,1.0);
    signal backPressed
    property var blurAction: PropertyAction {target:idleBlur;property:"radius";value:blurFactor}

    property int blurFactor: 4
    property string blurKeyParam: "deviation"
    
    state:"cameraShotState"
    onStateChanged: {
        ipSelectorIn.state = state
    }

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
    transitions:[
        Transition {
            from: "cameraShotState"
            to: "ipSelectState"
            PropertyAction {
                target:idleBlur; 
                property:blurKeyParam;
                value:blurFactor
            }
            
        },
        Transition {
            from: "waitingForConnectionState"
            to: "ipSelectState"
            PropertyAction {
                target:idleBlur; 
                property:blurKeyParam;
                value:blurFactor
            }
            
        },
        
        Transition {
            from: "ipSelectState"
            to: "cameraShotState"
            PropertyAction {
                target:idleBlur; 
                property:blurKeyParam;
                value:0
            }
        },
        Transition {
            from: "waitingForConnectionState"
            to: "cameraShotState"
            PropertyAction {
                target:idleBlur; 
                property:blurKeyParam;
                value:0
            }
        },
        Transition {
            from: "ipSelectState"
            to: "waitingForConnectionState"
            PropertyAction {
                target:idleBlur; 
                property:blurKeyParam;
                value:blurFactor
            }
        }
        

    ]
    
    Camera {
        id: camera
        
        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        
        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }
        
        flash.mode: Camera.FlashRedEyeReduction
        
        imageCapture {
            id:imageCaptureItem
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
                console.log(preview)
                videoCaptureFilter.retrieveImage()
            }            
        }
        
    }
    VideoCapture{
        id:videoCaptureFilter
        onConnectionRefusedError: {
            console.log("Connection was refused")
            root.state = "ipSelectState"
        }
        onConnectionSuccess: {
            console.log("Connection made")
            root.state = "cameraShotState"
        }
    }
    
    VideoOutput {
        id:vout
        source: camera
        anchors.fill: parent
        focus : visible // to receive focus and capture key events when visible
        autoOrientation: true
        property real factor_rheight: vout.sourceRect.height * root.windowFactor.y / root.height
        property real factor_width: vout.sourceRect.width * root.windowFactor.x / root.width
        filters: [videoCaptureFilter]
    }
    GaussianBlur {
           id:idleBlur
           anchors.fill: vout
           source: vout
           deviation:0
           radius: 8
           samples: 16
           transparentBorder: true
       }
    Image {
        id: photoPreview
        visible: false
        
        /* Initial Image cropped by a rectangle with the size of the viewfinder*/
        source:"qrc:/images/AutoFormaxLogo.png"
        fillMode:Image.Stretch
        anchors.centerIn:parent
        width : camera.viewfinder.resolution.width * windowFactor.x  
        height :  camera.viewfinder.resolution.height * windowFactor.y
        
        onSourceChanged: {
            
            /*photoPreview.width = sourceSize.width * windowFactor.x  
            photoPreview.height =  sourceSize.height * windowFactor.y*/
            console.log("Calling Filter:",width, height)
            videoCaptureFilter.retrieveImage(photoPreview)
            previewTimer.running = true
            
        }
        Timer {
            
            id: previewTimer
            running:false
            interval: 1000
            repeat:false
            triggeredOnStart: false
            onTriggered: running = false
            onRunningChanged: photoPreview.visible = running
            
        }
        
    }
    onVisibleChanged: {
        if (visible == true){
            camera.start()
            console.log(vout.sourceRect.width, vout.sourceRect.height)
        } else {
            console.log(vout.sourceRect.width*windowFactor.x, vout.sourceRect.height*windowFactor.y)
            camera.stop()
        }
    }
    CustomArea{
        id:topArea
        factor_rheight: 0.5 * (1 - vout.factor_rheight)
    }
    CustomArea{
        id:footerAreaLeft
        factor_rheight: topArea.factor_rheight
        factor_rwidth: .5
        anchors.bottom: parent.bottom
    }
    CustomArea{
        id:footerAreaRight
        factor_rheight: topArea.factor_rheight
        factor_rwidth: .5
        anchors.left: footerAreaLeft.right
        anchors.bottom: footerAreaLeft.bottom
    }
    Image {
        id: exitButton
        width: sourceSize.width * windowFactor.x
        height: sourceSize.height * windowFactor.y
        source: "qrc:/images/BackButton.png"
        fillMode: Image.Stretch
        anchors.centerIn: footerAreaLeft
        MouseArea{
            anchors.fill: parent
            onClicked: {
                backPressed()
            }
        }
        
    }
    Image {
        id: captureButton
        width: sourceSize.width * windowFactor.x
        height: sourceSize.height * windowFactor.y
        source: "qrc:/images/SetButtonOk.png"
        fillMode: Image.Stretch
        anchors.centerIn: footerAreaRight
        MouseArea {
            anchors.fill: parent
            onClicked: {
                camera.imageCapture.capture()
            }
        }
    }
    IpSelector{
        
        id:ipSelectorIn 
        width:parent.width
        height:parent.height
        onConfigureHost:{
            videoCaptureFilter.hostName = host
            videoCaptureFilter.tcpPort = port
            root.state="waitingForConnectionState"
        }
    }
    
}
