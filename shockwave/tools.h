#ifndef TOOLS_H
#define TOOLS_H

#include <QObject>

class Tools : public QObject
{
    Q_OBJECT

public:
    Tools(QObject *parent = 0);

public:
    Q_INVOKABLE QString readFile(const QString &fileName) const;
};

#endif // TOOLS_H
