#ifndef STATECHARTWRAPPER_H
#define STATECHARTWRAPPER_H

#include <QObject>
#include <QTimer>
#include <QVariant>
#include "src-gen/Sct_lightswitch.h"


class StatechartWrapper : public QObject
{
    Q_OBJECT
public:
    explicit StatechartWrapper(QObject *parent = 0);
private:
    Sct_lightswitch * lightswitch;
    QTimer * timer;

signals:
    void light(QVariant on);

public slots:
    void runCycle();
    void button_evt();
};

#endif // STATECHARTWRAPPER_H
