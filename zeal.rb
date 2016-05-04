class Zeal < Formula
  desc "Offline documentation browser inspired by Dash"
  homepage "https://zealdocs.org/"
  url "https://github.com/zealdocs/zeal/archive/v0.2.1.tar.gz"
  sha256 "994c5fad079cb34952fc05b0663920118489ed7f00f8e5a5887ff2e2bd05861d"
  patch do
    url "https://github.com/zealdocs/zeal/commit/b26d655a7ab2c1ba4fc6212b8a1e019e98e1398b.patch"
    sha256 "c8a95f5de7ebf997031ce09fc8cfd33631e37f27f0824b3a62225136a2c318b6"
  end
  patch :DATA

  depends_on "qt5"
  depends_on "libarchive"

  def install
    system "echo \"macx:INCLUDEPATH += #{HOMEBREW_PREFIX}/opt/libarchive/include\" >> src/src.pro"
    system "echo \"macx:LIBS += -L#{HOMEBREW_PREFIX}/opt/libarchive/lib -larchive\" >> src/src.pro"
    system "qmake"
    system "make"
    prefix.install "bin/Zeal.app"
  end

  test do
    system "false"
  end
end
__END__
diff --git a/src/src.pro b/src/src.pro
index 3dc66ac..f7ff023 100644
--- a/src/src.pro
+++ b/src/src.pro
@@ -4,7 +4,7 @@ QT += gui widgets sql
 CONFIG += c++11 silent
 
 # Build features
-webengine {
+greaterThan(QT_VERSION, 5.5) {
     QT += webenginewidgets
     DEFINES += USE_WEBENGINE
 } else {
