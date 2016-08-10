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
    
    SplashScreen{
        id:splashScreen
        onTimeout: Qt.quit()
    }
    
    
    /* Check responsive Startup */
    Component.onCompleted: {
        console.log(qsTr("+------------------+"))
        console.log(qsTr("+ Application Runs +"))
        console.log(qsTr("+------------------+"))
        Responsive.responsiveStartUp(Qt,Screen,applicationWindow,9,16)
        applicationWindow.x = Screen.width/2 - Window.width/2        
        applicationWindow.y = 0
    }
    
}
