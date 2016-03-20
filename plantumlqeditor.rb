class Plantumlqeditor < Formula
  desc " PlantUML QEditor - A PlantUML editor written in Qt5"
  homepage "https://github.com/jalbersol/plantumlqeditor"
  url "https://github.com/jalbersol/plantumlqeditor/archive/2.0.tar.gz"
  sha256 "fb8225ac0de0a21f278d7e8a10c9f14d4e5fad73f7abd3c2e6518747f3ecf296"
  patch :DATA

  depends_on "qt5"
  depends_on "plantuml"

  def install
    system "qmake"
    system "make"
    prefix.install "plantumlqeditor.app"
  end

  test do
    system "false"
  end
end
__END__
diff --git a/thirdparty/qtsingleapplication/src/qtlocalpeer.cpp b/thirdparty/qtsingleapplication/src/qtlocalpeer.cpp
index ed19e7b..84e3be4 100644
--- a/thirdparty/qtsingleapplication/src/qtlocalpeer.cpp
+++ b/thirdparty/qtsingleapplication/src/qtlocalpeer.cpp
@@ -41,6 +41,7 @@
 #include "qtlocalpeer.h"
 #include <QtCore/QCoreApplication>
 #include <QtCore/QTime>
+#include <QDataStream>
 
 #if defined(Q_OS_WIN)
 #include <QtCore/QLibrary>
