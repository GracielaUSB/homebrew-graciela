
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/homebrew-graciela/raw/master/graciela.bottle.tar.gz"
  version "0.2.0.0"
  sha256 "4d1451ccdf41890c25a2c9b3bc152ec0947fc67184812f2630e561290a5603d2"

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
    
  end 

  test do
    system "false"
  end
end
