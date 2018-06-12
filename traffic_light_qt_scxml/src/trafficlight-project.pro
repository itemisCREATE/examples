QT += widgets scxml

SOURCES += trafficlight.cpp \
    trafficlight-main.cpp
HEADERS = trafficlight.h

# install
target.path = .
INSTALLS += target
TARGET = "YAKINDU Statechart Tools SCXML Example"

RESOURCES += \
    trafficlight-project.qrc

STATECHARTS += ../src-gen/TrafficLightStateMachine.scxml




