class Zeal < Formula
  desc "Offline documentation browser inspired by Dash"
  homepage "https://zealdocs.org/"
  url "https://github.com/zealdocs/zeal/archive/v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "55f8511977818612e00ae87a4fddaa346210189531469690f2e3961bb4c2c318"

  depends_on "qt5"
  depends_on "libarchive"

  def install
    system "echo \"macx:INCLUDEPATH += #{HOMEBREW_PREFIX}/opt/libarchive/include\" >> qmake/common.pri"
    system "echo \"macx:LIBS += -L#{HOMEBREW_PREFIX}/opt/libarchive/lib -larchive\" >> qmake/common.pri"
    system "qmake"
    system "make"
    prefix.install "bin/Zeal.app"
  end

  test do
    system "false"
  end
end
