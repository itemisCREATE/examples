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

STATECHARTS += TrafficLightStateMachine.scxml

# Uncomment the following lines to build the test project
# Please note: make sure to run the following before:
#           (1) model.sgen and
#           (2) QtSCXMLTests.sgen

#TEMPLATE = subdirs
#SUBDIRS = test-gen/QtSCTUnit/SCTUnitTests.pro




