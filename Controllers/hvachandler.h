#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HVACHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int targetTemperature READ targetTemperature WRITE setTargetTemperature NOTIFY targetTemperatureChanged FINAL)
public:
    explicit HVACHandler(QObject *parent = nullptr);

    int targetTemperature() const;
    void setTargetTemperature(int newTargetTemperature);

    Q_INVOKABLE void incrementTargetTemperature(const int & val);

signals:
    void targetTemperatureChanged();
private:
    int m_targetTemperature;
};

#endif // HVACHANDLER_H
