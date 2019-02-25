#include "abstractqtunittest.h"

AbstractQtUnitTest::AbstractQtUnitTest(QObject *parent) : QObject(parent) {
	suite().push_back(this);
}

void AbstractQtUnitTest::initializeStatemachine(QSharedPointer<QScxmlStateMachine> statemachine){
    auto stateNames = statemachine->stateNames(false);
    for(QString state : stateNames){
        statemachine->connectToState(state,this,[](bool active){ return active;});
    }
    statemachine->setRunning(true);
    runCycle();
}

QStringList AbstractQtUnitTest::getActiveStateNames(QSharedPointer<QScxmlStateMachine> statemachine){
    return statemachine->activeStateNames(false);
}

void AbstractQtUnitTest::assertStatemachinePropertyValue(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, int expected){
    QCOMPARE(statemachine->dataModel()->scxmlProperty(property).toInt(),expected);
}

void AbstractQtUnitTest::assertStateNotActive(QSharedPointer<QScxmlStateMachine> sm, const QString& stateName){
    QCOMPARE(false, sm.data()->isActive(stateName));
}

bool AbstractQtUnitTest::isStateActive(QSharedPointer<QScxmlStateMachine> sm, const QString& stateName){
    return sm.data()->isActive(stateName);
}

bool AbstractQtUnitTest::isFinal(QSharedPointer<QScxmlStateMachine> sm){
 	return !sm.data()->isRunning();
}

void AbstractQtUnitTest::assertActiveStates(QSharedPointer<QScxmlStateMachine> sm, const QStringList expectedStates){
    QStringList activeStateNames = getActiveStateNames(sm);
    QCOMPARE(true, activeStateNames == expectedStates);
}

void AbstractQtUnitTest::assertStateActive(QSharedPointer<QScxmlStateMachine> sm, const QString& stateName) {
	QVERIFY(isStateActive(sm, stateName));
}

void AbstractQtUnitTest::assertTrue(bool condition){
    QVERIFY(condition);
}

void AbstractQtUnitTest::assertFalse(bool condition){
    QCOMPARE(false, condition);
}

void AbstractQtUnitTest::runCycle(){
    QApplication::processEvents(QEventLoop::AllEvents);
}

void AbstractQtUnitTest::proceedTime(long ms){
    QTest::qWait(ms);
    runCycle();
}

void AbstractQtUnitTest::raiseEvent(QSharedPointer<QScxmlStateMachine> statemachine, QScxmlEvent *event){
    statemachine->submitEvent(event);
    runCycle();
}
void AbstractQtUnitTest::raiseEvent(QSharedPointer<QScxmlStateMachine> statemachine, const QString &eventName){
    statemachine->submitEvent(eventName);
    runCycle();
}

void AbstractQtUnitTest::raiseEvent(QSharedPointer<QScxmlStateMachine> statemachine, const QString &eventName, const QVariant &payload){
	statemachine->submitEvent(eventName, payload); 
	runCycle();
}

int AbstractQtUnitTest::getInteger(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property){
    return getPropertyValue(statemachine, property).toInt();
}

bool AbstractQtUnitTest::getBoolean(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property){
    return getPropertyValue(statemachine, property).toBool();
}

double AbstractQtUnitTest::getDouble(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property){
    return getPropertyValue(statemachine, property).toDouble();
}

QString AbstractQtUnitTest::getString(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property){
    return getPropertyValue(statemachine, property).toString();
}

void AbstractQtUnitTest::setInteger(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, int value, const QString& context){
    statemachine->dataModel()->setScxmlProperty(property, QVariant::fromValue(value), context);
}

void AbstractQtUnitTest::setBoolean(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, bool value, const QString& context){
    statemachine->dataModel()->setScxmlProperty(property, QVariant::fromValue(value), context);
}

void AbstractQtUnitTest::setDouble(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, double value, const QString& context){
    statemachine->dataModel()->setScxmlProperty(property, QVariant::fromValue(value), context);
}

void AbstractQtUnitTest::setString(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property, const QString& value, const QString& context){
    statemachine->dataModel()->setScxmlProperty(property, QVariant::fromValue(value), context);
}

QVariant AbstractQtUnitTest::getPropertyValue(QSharedPointer<QScxmlStateMachine> statemachine, const QString& property){
    return statemachine->dataModel()->scxmlProperty(property);
}

std::vector<QObject*> & AbstractQtUnitTest::suite(){
	static std::vector<QObject*> objects;
	return objects;
}

