#include <QFile>
#include <QDebug>
#include "tools.h"

Tools::Tools(QObject *parent)
    : QObject(parent)
{

}

QString Tools::readFile(const QString &fileName) const
{
    QFile file(fileName);
    if (file.open(QIODevice::ReadOnly)) {
        return QString(file.readAll());
    }
    else
        return QString();
}
