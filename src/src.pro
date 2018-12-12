TARGET = nemosocial
PLUGIN_IMPORT_PATH = org/nemomobile/social

TEMPLATE = lib
CONFIG += qt plugin hide_symbols

equals(QT_MAJOR_VERSION, 4): target.path = $$[QT_INSTALL_IMPORTS]/$$PLUGIN_IMPORT_PATH
equals(QT_MAJOR_VERSION, 5): target.path = $$[QT_INSTALL_QML]/$$PLUGIN_IMPORT_PATH
INSTALLS += target

qmldir.files += qmldir plugins.qmltypes
qmldir.path +=  $$target.path
INSTALLS += qmldir

qmltypes.commands = qmlplugindump -nonrelocatable org.nemomobile.social 1.0 > $$PWD/plugins.qmltypes
QMAKE_EXTRA_TARGETS += qmltypes

equals(QT_MAJOR_VERSION, 4): QT += declarative network
equals(QT_MAJOR_VERSION, 5): QT = core qml network

lessThan(QT_MAJOR_VERSION, 5) {
    CONFIG += link_pkgconfig
    PKGCONFIG += QJson
}

equals(QT_MAJOR_VERSION, 5): DEFINES += QT_VERSION_5

SOURCES += \
    $$PWD/plugin.cpp \
    $$PWD/contentiteminterface.cpp \
    $$PWD/filterinterface.cpp \
    $$PWD/contentitemtypefilterinterface.cpp \
    $$PWD/identifiablecontentiteminterface.cpp \
    $$PWD/socialnetworkinterface.cpp \
    $$PWD/sorterinterface.cpp \
    $$PWD/socialnetworkmodelinterface.cpp

HEADERS += \
    $$PWD/contentiteminterface.h \
    $$PWD/contentiteminterface_p.h \
    $$PWD/contentitemtypefilterinterface.h \
    $$PWD/filterinterface.h \
    $$PWD/identifiablecontentiteminterface.h \
    $$PWD/identifiablecontentiteminterface_p.h \
    $$PWD/socialnetworkinterface.h \
    $$PWD/socialnetworkinterface_p.h \
    $$PWD/sorterinterface.h \
    $$PWD/util_p.h \
    $$PWD/socialnetworkmodelinterface.h \
    $$PWD/socialnetworkmodelinterface_p.h

include(facebook/facebook.pri)
include(twitter/twitter.pri)

OTHER_FILES += qmldir social.qdoc social.qdocconf caching.qdoc
