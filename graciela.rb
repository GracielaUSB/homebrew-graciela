
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/homebrew-graciela/raw/master/graciela.bottle.tar.gz"
  version "0.2.0.0"
  sha256 "0722c14fdf2f922b975dc94d0d33e35a3ddef003a18bc29abcc1c3723641a796"

  depends_on "GracielaUSB/graciela/clang35"

  def install
    
    ## Install llvm dylib
    lib.install "./lib/libLLVM-3.5.dylib"

    ## Compile and install C external library for Graciela
    system "clang", "-lstdc++", "-fPIC", "-shared", "./src/C/libgraciela-abstract/libgraciela-abstract.cpp", "-o", "./src/C/libgraciela-abstract.so"
    system "clang", "-fPIC", "-shared", "./src/C/libgraciela.c", "./src/C/libgraciela-abstract.so", "-o", "./src/C/libgraciela.so"
    lib.install "./src/C/libgraciela.so"
    lib.install "./src/C/libgraciela-abstract.so"
    
    ## Install graciela
    bin.install "./bin/graciela"
    bin.install "./bin/rungraciela"
    
  end 

  test do
    system "false"
  end
end
