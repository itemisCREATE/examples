#ifndef ABSTRACTQTUNITTEST_H
#define ABSTRACTQTUNITTEST_H

#include <QString>
#include <QtTest>
#include <QDebug>
#include <QCoreApplication>
#include <vector>
#include "QtScxml/qscxmlstatemachine.h"


class AbstractQtUnitTest : public QObject {
    Q_OBJECT
public:
	
	AbstractQtUnitTest(QObject *parent = 0);
	
	virtual ~AbstractQtUnitTest(){}
	virtual void initializeStatemachine(QSharedPointer<QScxmlStateMachine> statemachine);

    virtual QStringList getActiveStateNames(QSharedPointer<QScxmlStateMachine> statemachine);
    virtual void assertStatemachinePropertyValue(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, int expected);

    virtual bool isStateActive(QSharedPointer<QScxmlStateMachine> sm, const QString& stateName);
    virtual bool isFinal(QSharedPointer<QScxmlStateMachine> sm);
    
    virtual void assertStateNotActive(QSharedPointer<QScxmlStateMachine> sm, const QString& stateName);
    virtual void assertActiveStates(QSharedPointer<QScxmlStateMachine> sm, const QStringList expectedStates);
    virtual void assertTrue(bool condition);
    virtual void assertFalse(bool condition);
    virtual void assertStateActive(QSharedPointer<QScxmlStateMachine> sm, const QString& stateName);

    virtual void runCycle();
    virtual void proceedTime(long ms);

    virtual void raiseEvent(QSharedPointer<QScxmlStateMachine> statemachine, QScxmlEvent *event);
    virtual void raiseEvent(QSharedPointer<QScxmlStateMachine> statemachine, const QString &eventName);
    virtual void raiseEvent(QSharedPointer<QScxmlStateMachine> statemachine, const QString &eventName, const QVariant &payload);

    int getInteger(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property);
    bool getBoolean(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property);
    double getDouble(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property);
    QString getString(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property);

    void setInteger(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, int value, const QString& context);
    void setBoolean(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, bool value, const QString& context);
    void setDouble(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, double value, const QString& context);
    void setString(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, const QString& value, const QString& context);
    
    static std::vector<QObject*> & suite();
protected:
    QVariant getPropertyValue(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property);
};

#endif // ABSTRACTQTUNITTEST_H
