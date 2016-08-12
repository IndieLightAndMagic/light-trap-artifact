import QtQuick 2.6
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.5
import "js/responsive.js" as Responsive


ApplicationWindow {
    
    id:applicationWindow
    visible: true
    title: qsTr("Hello World")
    
    property string authorName:"Julian Andres Guarin"
    property var windowFactor:Qt.vector2d(1.0,1.0)
    
    
    SplashScreen{
        id:splashScreen
        source:"qrc:/images/AutoFormaxLogoBackBlurred.png"
    }
    SplashScreen{
        id:splashScreenWhite
        fadeout_timer.running: true
    }
    
    MainMenu{
        id:mainMenu
        windowFactor: applicationWindow.windowFactor         
    }
    
    
    /* Check responsive Startup */
    Component.onCompleted: {
        console.log(qsTr("+------------------+"))
        console.log(qsTr("+ Application Runs +"))
        console.log(qsTr("+------------------+"))
        applicationWindow.windowFactor = Responsive.responsiveStartUp(Qt,Screen,applicationWindow,9,16)
        
    }
    
}
