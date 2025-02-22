#ifndef LIGHTCONTROL_H
#define LIGHTCONTROL_H

#include <QObject>

class LightControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool lightToggle READ lightToggle WRITE setLightToggle NOTIFY lightToggleChanged FINAL)
public:
    explicit LightControl(QObject *parent = nullptr);

    bool lightToggle() const;
    Q_INVOKABLE void setLightToggle(bool newLightToggle);

signals:
    void lightToggleChanged();
private:
    bool m_lightToggle;
    void writeToFile(const QString &path, const QString &value);

};

#endif // LIGHTCONTROL_H
