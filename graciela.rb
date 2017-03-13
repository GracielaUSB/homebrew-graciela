
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/homebrew-graciela/releases/download/v1.0/graciela.bottle.tar.gz"
  version "0.2.0.0"
  sha256 "22a548a158264fd052d187b7d1abd25fcc136dedb9392957a791183ac536026c"

  
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
