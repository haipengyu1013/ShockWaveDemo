#include <QGuiApplication>
#include <QQuickView>
#include <QQmlContext>

#include "tools.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view;
    view.rootContext()->setContextProperty("tools", new Tools);
    view.setSource(QUrl("qrc:/qml/main.qml"));
    view.show();

    return app.exec();
}
