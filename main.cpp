#include <QApplication>
#include <QQmlApplicationEngine>
#include "uldfilterproject.h"



void registerExternalType(){
    qmlRegisterType<Uldfilterproject>("com.autoformax.videoprocess",1,0,"VideoCapture");    
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    QQmlApplicationEngine engine;
    registerExternalType();
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    
    return app.exec();
}
