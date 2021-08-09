#include <QObject>
#include <QQuickItem>
#include <QQuickView>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "machine/TrafficLightStateMachine.h"
#include "machine/sc_qt_timerservice.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;


    TrafficLightStateMachine *machine = new TrafficLightStateMachine(nullptr);
    sc::qt::SCTimerService *timerService = new sc::qt::SCTimerService(machine);
    machine->setTimerService(timerService);

    QObject *root = engine.rootObjects().at(0);
    QObject *control = root->findChild<QObject*>(QString("control"));
    QObject::connect(control, SIGNAL(pause()), machine, SLOT(standby()));
    QObject::connect(control, SIGNAL(play()), machine, SLOT(operate()));

    QObject *trafficLight = root->findChild<QObject*>(QString("trafficLight"));
    QObject::connect(machine, SIGNAL(redOn()), trafficLight, SLOT(redOn()));
    QObject::connect(machine, SIGNAL(redOff()), trafficLight, SLOT(redOff()));
    QObject::connect(machine, SIGNAL(yellowOn()), trafficLight, SLOT(yellowOn()));
    QObject::connect(machine, SIGNAL(yellowOff()), trafficLight, SLOT(yellowOff()));
    QObject::connect(machine, SIGNAL(greenOn()), trafficLight, SLOT(greenOn()));
    QObject::connect(machine, SIGNAL(greenOff()), trafficLight, SLOT(greenOff()));

    machine->enter();

    return app.exec();
}
