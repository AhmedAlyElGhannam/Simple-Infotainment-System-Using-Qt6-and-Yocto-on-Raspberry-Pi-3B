#include "system.h"

System::System(QObject *parent)
    : QObject{parent}
    , m_carLocked(true)
    , m_outdoorTemp(27)
    , m_userName("Ahmed")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);

    m_currentTimeTimer->setSingleShot(true);

    // everytime this timer timesout, it will call the function below
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();  // Ensure this is emitted
}


int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setoutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime = QDateTime::currentDateTime();
    QString currentTime = dateTime.toString("hh:mm ap");  // Fix format

    setCurrentTime(currentTime);

    m_currentTimeTimer->start();  // Ensure it restarts
}

