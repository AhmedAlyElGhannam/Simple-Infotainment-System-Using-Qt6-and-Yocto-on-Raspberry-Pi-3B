#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <Controllers/system.h>
#include <Controllers/hvachandler.h>
#include <Controllers/lightcontrol.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    qmlRegisterType<System>("Controllers", 1, 0, "System");
    qmlRegisterType<System>("Controllers", 1, 0, "HVACHandler");
    // defining a system object
    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passengerHVACHandler;
    LightControl m_lightControlHandler;
    QQmlApplicationEngine engine;

    QQmlContext * context(engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("driverHVAC", &m_driverHVACHandler);
    context->setContextProperty("passengerHVAC", &m_passengerHVACHandler);
    context->setContextProperty("lightControl", &m_lightControlHandler);

    qDebug() << "LightControl object pointer: " << &m_lightControlHandler;


    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("InfotainmentSystem-UI", "Main");


    return app.exec();
}
