
#ifndef SCQT_TIMERSERVICE_H_
#define SCQT_TIMERSERVICE_H_


#include <QObject>
#include <QTimer>
#include <QMap>
#include <QPair>

#include "TimerInterface.h"
#include "TimedStatemachineInterface.h"


namespace ysc
{

    class SCTimer : public QTimer
    {
        Q_OBJECT

    public:
        explicit SCTimer(QObject * parent, TimedStatemachineInterface* machine, const sc_eventid id);

    signals:
        void fireTimeEvent(TimedStatemachineInterface *machine, sc_eventid event);

    public slots:
        void triggerTimeEvent();

    protected:
        TimedStatemachineInterface *machine;
        sc_eventid eventId;
    };



    class SCTimerService : public QObject, public TimerInterface
    {
        Q_OBJECT

    public:
        explicit SCTimerService(QObject *parent);

        virtual void setTimer(TimedStatemachineInterface* statemachine, sc_eventid event, sc_integer time_ms, sc_boolean isPeriodic);
        virtual void unsetTimer(TimedStatemachineInterface* statemachine, sc_eventid event);
        virtual void cancel();

    signals:

    public slots:
        void raiseTimeEvent(TimedStatemachineInterface *machine, sc_eventid event);

    protected:
        QMap<TimedStatemachineInterface*,QMap<sc_eventid, SCTimer*>*> machineTimerMapMap;
        SCTimer* getTimer(TimedStatemachineInterface *machine, sc_eventid event);

    };


}
#endif // SCQT_TIMERSERVICE_H_


