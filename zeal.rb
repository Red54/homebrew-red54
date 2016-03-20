class Zeal < Formula
  desc "Offline documentation browser inspired by Dash"
  homepage "https://zealdocs.org/"
  url "https://github.com/zealdocs/zeal/archive/v0.2.1.tar.gz"
  sha256 "994c5fad079cb34952fc05b0663920118489ed7f00f8e5a5887ff2e2bd05861d"

  depends_on "qt5"
  depends_on "libarchive"

  def install
    system "echo", "\"macx:INCLUDEPATH += #{HOMEBREW_PREFIX}/opt/libarchive/include\" >> src/src.pro"
    system "echo", "\"macx:LIBS += -L#{HOMEBREW_PREFIX}/opt/libarchive/lib -larchive\" >> src/src.pro"
    system "qmake"
    system "make"
    prefix.install "bin/Zeal.app"
  end

  test do
    system "false"
  end
end
