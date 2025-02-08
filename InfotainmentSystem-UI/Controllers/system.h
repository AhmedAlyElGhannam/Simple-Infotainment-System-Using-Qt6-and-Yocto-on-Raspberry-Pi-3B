#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>
#include <QDateTime>

class System : public QObject
{
    Q_OBJECT
    // on Q_PROPERTY ==> write click + refactor + generate missing properties to generate setters and getters
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged FINAL)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setoutdoorTemp NOTIFY outdoorTempChanged FINAL)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged FINAL)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
public:
    explicit System(QObject *parent = nullptr);

    bool carLocked() const;
    void setCarLocked(bool newCarLocked);

    int outdoorTemp() const;
    void setoutdoorTemp(int newOutdoorTemp);

    QString userName() const;
    void setuserName(const QString &newUserName);

    QString currentTime() const;
    void setCurrentTime(const QString &newCurrentTime);

    void currentTimeTimerTimeout();

signals:
    void carLockedChanged();
    void outdoorTempChanged();

    void userNameChanged();

    void currentTimeChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
};

#endif // SYSTEM_H
