#include "statechartwrapper.h"

StatechartWrapper::StatechartWrapper(QObject *parent):
    QObject(parent),
    lightswitch(new Sct_lightswitch()),
    timer(new QTimer(this))
{
    lightswitch->init();
    lightswitch->enter();
    connect(timer, &QTimer::timeout, this, &StatechartWrapper::runCycle);
    timer->start(20);
}

void StatechartWrapper::runCycle()
{
    lightswitch->runCycle();
    if(lightswitch->isRaised_light()) {
        emit light(QVariant::fromValue(lightswitch->get_light_value()));
    }
}

void StatechartWrapper::button_evt()
{
    lightswitch->raise_button_evt();
}

