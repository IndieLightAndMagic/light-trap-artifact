TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    ../../uld-filter/uld-filter-project/uldfilterproject.cpp \
    ../../uld-filter/uld-filter-project/uldhelper.cpp \
    ../../uld-filter/uld-filter-project/uldsocket.cpp

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    ../../uld-filter/uld-filter-project/qobject__.h \
    ../../uld-filter/uld-filter-project/uldfilterproject.h \
    ../../uld-filter/uld-filter-project/uldhelper.h \
    ../../uld-filter/uld-filter-project/uldsocket.h

INCLUDEPATH += ../../uld-filter/uld-filter-project

#macx: LIBS += -L$$PWD/../../uld-filter/build-uld-filter-project-Desktop_Qt_5_7_0_clang_64bit-Debug/ -luld-filter-project.1.0.0

#INCLUDEPATH += $$PWD/../../uld-filter/uld-filter-project
#DEPENDPATH += $$PWD/../../uld-filter/uld-filter-project

