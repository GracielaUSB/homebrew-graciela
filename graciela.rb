
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/homebrew-graciela/releases/download/v1.0/graciela.bottle.tar.gz"
  version "0.2.0.0"
  sha256 "08493d152c3d903ab993790bd4d93025547180321e27121e4e16045b3d46f0fd"

  
  depends_on "GracielaUSB/graciela/clang35"

  def install
    
    ## Install llvm dylib
    lib.install "./lib/libLLVM-3.5.dylib"

    ## Compile and install C external library for Graciela
    
    system "clang", "-lm", "-lstdc++", "-fPIC", "-shared", "./src/C/libgraciela-abstract/libgraciela-abstract.cpp", "./src/C/libgraciela.c", "-o", "libgraciela.so"
    lib.install "libgraciela.so"
    
    ## Install graciela
    bin.install "./bin/graciela"
    bin.install "./bin/rungraciela"
    
  end 

  test do
    system "false"
  end
end
