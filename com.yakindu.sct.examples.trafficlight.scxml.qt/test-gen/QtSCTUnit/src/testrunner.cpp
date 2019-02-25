#include <QtTest/QtTest>
#include "abstractqtunittest.h"
#include "trafficlightstatemachineteststest.h"

int main(int argc, char *argv[])
{
    TrafficLightStateMachineTestsTest trafficLightStateMachineTestsTest;
    QCoreApplication a(argc, argv);


    int status = 0;
    auto test = [&status, argc, argv](QObject *obj) {
        status |= QTest::qExec(obj, argc, argv);
        if(status != 0)
            QFAIL(QString("Error while executing tests in %1").arg(obj->objectName()).toStdString().c_str());
    };

    auto &suite = AbstractQtUnitTest::suite();
    for (auto it = suite.begin(); it != suite.end(); ++it) {
        test(*it);
    }
    return status;
}
