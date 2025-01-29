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


    std::shared_ptr<TrafficLightStateMachine> machine = std::make_shared<TrafficLightStateMachine>(nullptr);
    std::shared_ptr<sc::qt::SCTimerService> timerService = std::make_shared<sc::qt::SCTimerService>(nullptr);
    machine->setTimerService(timerService);


    QObject *root = engine.rootObjects().at(0);
    QObject *control = root->findChild<QObject*>(QString("control"));
    QObject::connect(control, SIGNAL(pause()), machine.get(), SLOT(standby()));
    QObject::connect(control, SIGNAL(play()), machine.get(), SLOT(operate()));

    QObject *trafficLight = root->findChild<QObject*>(QString("trafficLight"));
    QObject::connect(machine.get(), SIGNAL(redOn()), trafficLight, SLOT(redOn()));
    QObject::connect(machine.get(), SIGNAL(redOff()), trafficLight, SLOT(redOff()));
    QObject::connect(machine.get(), SIGNAL(yellowOn()), trafficLight, SLOT(yellowOn()));
    QObject::connect(machine.get(), SIGNAL(yellowOff()), trafficLight, SLOT(yellowOff()));
    QObject::connect(machine.get(), SIGNAL(greenOn()), trafficLight, SLOT(greenOn()));
    QObject::connect(machine.get(), SIGNAL(greenOff()), trafficLight, SLOT(greenOff()));

    machine->enter();

    return app.exec();
}
