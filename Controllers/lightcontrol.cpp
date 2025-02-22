#include "lightcontrol.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>

LightControl::LightControl(QObject *parent)
    : QObject{parent},
    m_lightToggle(false)
{
    writeToFile("/sys/class/gpio/export", "26");
    writeToFile("/sys/class/gpio/gpio26/direction", "out");
    // writeToFile("/home/nemesis/sys/export", "26");
    // writeToFile("/home/nemesis/sys/direction", "out");
}

bool LightControl::lightToggle() const
{
    return m_lightToggle;
}

void LightControl::setLightToggle(bool newLightToggle)
{
    if (m_lightToggle == newLightToggle)
        return;
    m_lightToggle = newLightToggle;
    emit lightToggleChanged();
    // added by me
    writeToFile("/sys/class/gpio/gpio26/value", m_lightToggle ? "1" : "0");
    // writeToFile("/home/nemesis/sys/value", m_lightToggle ? "1" : "0");
}

void LightControl::writeToFile(const QString &path, const QString &value) {
    QFile file(path);
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << value;
        file.close();
    } else {
        qWarning() << "Failed to open" << path;
    }
}
