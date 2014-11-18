QT -= core

TARGET = wear
TEMPLATE = lib

CONFIG += staticlib warn_on

isEmpty(RHODES_ROOT) {
  RHODES_ROOT = ../../../../../../rhodes
}

INCLUDEPATH += \
$$RHODES_ROOT/lib/commonAPI/coreapi/ext/shared\
$$RHODES_ROOT/platform/shared/common\
$$RHODES_ROOT/platform/shared/rubyext\
$$RHODES_ROOT/platform/shared/ruby/include\
$$RHODES_ROOT/platform/shared\
../../shared

macx {
  DESTDIR = $$RHODES_ROOT/platform/osx/bin/extensions
  OBJECTS_DIR = $$RHODES_ROOT/platform/osx/bin/extensions/wear
  INCLUDEPATH += $$RHODES_ROOT/platform/shared/ruby/iphone
}
win32 {
  DESTDIR = $$RHODES_ROOT/platform/win32/bin/extensions
  OBJECTS_DIR = $$RHODES_ROOT/platform/win32/bin/extensions/wear
  DEFINES += WIN32 _WINDOWS _LIB _UNICODE UNICODE
  debug {
    DEFINES += _DEBUG DEBUG
  }
  release {
    DEFINES += _NDEBUG NDEBUG
  }
  INCLUDEPATH += $$RHODES_ROOT/platform/shared/ruby/win32
}

DEFINES += RHODES_QT_PLATFORM _XOPEN_SOURCE _DARWIN_C_SOURCE

!isEmpty(RHOSIMULATOR_BUILD) {
  DEFINES += RHODES_EMULATOR
}

!win32 {
  QMAKE_CFLAGS_WARN_ON += -Wno-extra -Wno-unused -Wno-sign-compare -Wno-format -Wno-parentheses
  QMAKE_CXXFLAGS_WARN_ON += -Wno-extra -Wno-unused -Wno-sign-compare -Wno-format -Wno-parentheses
}
win32 {
  QMAKE_CFLAGS_WARN_ON += /wd4996 /wd4100 /wd4005
  QMAKE_CXXFLAGS_WARN_ON += /wd4996 /wd4100 /wd4005
  QMAKE_CFLAGS_RELEASE += /O2
  QMAKE_CXXFLAGS_RELEASE += /O2
}

HEADERS += \
..\..\shared\generated\cpp\IWear.h\
..\..\shared\generated\cpp\WearBase.h

SOURCES += \
..\..\shared\generated\cpp\Wear_js_wrap.cpp\
..\..\shared\generated\cpp\Wear_ruby_wrap.cpp\
..\..\shared\generated\cpp\WearBase.cpp\
..\..\shared\generated\wear_api_init.cpp\
..\..\shared\generated\wear_js_api.cpp\
..\..\shared\generated\wear_ruby_api.c\
src\Wear_impl.cpp
