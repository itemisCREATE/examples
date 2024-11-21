QT += widgets scxml

SOURCES += trafficlight.cpp \
    trafficlight-main.cpp
HEADERS = trafficlight.h

# install
target.path = .
INSTALLS += target
TARGET = "itemis CREATE SCXML Example"

RESOURCES += \
    trafficlight-project.qrc

STATECHARTS += ../src-gen/TrafficLightStateMachine.scxml




