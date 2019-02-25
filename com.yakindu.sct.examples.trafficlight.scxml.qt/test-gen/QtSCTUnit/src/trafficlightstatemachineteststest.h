#include <QtTest/QtTest>
			
#include "abstractqtunittest.h"
#include "TrafficLightStateMachine.h"

class TrafficLightStateMachineTestsTest : public AbstractQtUnitTest
{
	Q_OBJECT
	
public:
	
	TrafficLightStateMachineTestsTest(QObject* parent = 0) : AbstractQtUnitTest(parent),sm() {}
	~TrafficLightStateMachineTestsTest() {}
	
private Q_SLOTS:
	void shouldOperateNormal();
	void shouldBlink();
	void shouldBeRepaired();
	
private:

	QSharedPointer<TrafficLightStateMachine> sm;
	void init();
};
