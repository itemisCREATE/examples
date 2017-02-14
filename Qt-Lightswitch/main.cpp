#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQuickItem>
#include <QQuickWindow>

#include <QObject>
#include <QVariant>

#include "statechartwrapper.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QQuickItem * item;

    QQuickWindow * window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    if(!window) {
        return -1;
    }
    item = window->contentItem()->childItems().at(0);

    StatechartWrapper wrapper;

    QObject::connect(&wrapper, SIGNAL(light(QVariant)), item, SLOT(setLight(QVariant)));
    QObject::connect(item, SIGNAL(button_evt()), &wrapper, SLOT(button_evt()));

    return app.exec();
}

