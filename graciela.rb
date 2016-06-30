
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://raw.githubusercontent.com/adgalad/homebrew-graciela/master/graciela.tar.gz"
  version "0.1.0.0"
  sha256 "9294a3f0161520512610fe786299908f95e4efb85fb954ee3987db184e0d9a26"

  def install

    system "clang", "-fPIC", "-shared", "./graciela-lib.c", "-o", "./graciela-lib.so"
    lib.install "./graciela-lib.so"
    bin.install "./bin/graciela"
  end 

  test do
    system "false"
  end
end
