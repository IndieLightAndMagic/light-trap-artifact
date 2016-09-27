import QtQuick 2.0
import QtMultimedia 5.5
import com.autoformax.videoprocess 1.0

Rectangle {
    id: root
    color: "#00000000"
    anchors.fill: parent    
    
    property var windowFactor: Qt.vector2d(1.0,1.0);
    
    signal backPressed
    
    Camera {
        id: camera
        
        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash
        
        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }
        
        flash.mode: Camera.FlashRedEyeReduction
        
        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
                console.log(preview)
            }
        }
    }
    VideoCapture{
        id:videoCaptureFilter
    }

    VideoOutput {
        id:vout
        source: camera
        anchors.fill: parent
        focus : visible // to receive focus and capture key events when visible
        autoOrientation: true
        property real factor_rheight: vout.sourceRect.height * root.windowFactor.y / root.height
        property real factor_width: vout.sourceRect.width * root.windowFactor.x / root.width
    }

    Image {
        id: photoPreview
        visible: false
        onSourceChanged: {

            photoPreview.width = sourceSize.width * windowFactor.x  
            photoPreview.height =  sourceSize.height * windowFactor.y
            photoPreview.fillMode = Image.Stretch
            photoPreview.anchors.centerIn = parent
            console.log("Calling Filter")
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
                camera.start()
            }
        }
    }
}
