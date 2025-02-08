#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <Controllers/system.h>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QGuiApplication app(argc, argv);

    qmlRegisterType<System>("Controllers", 1, 0, "System");
    // defining a system object
    System m_systemHandler;

    QQmlApplicationEngine engine;

    QQmlContext * context(engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("InfotainmentSystem-UI", "Main");


    return app.exec();
}
