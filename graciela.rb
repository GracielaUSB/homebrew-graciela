
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/homebrew-graciela/raw/master/graciela.bottle.tar.gz"
  version "0.2.0.0"
  sha256 "a6b8620f10199e9a5a3455783d03669f623784b0f42a3bda2b5ceac75b226005"

  
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
