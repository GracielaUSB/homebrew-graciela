
class Graciela < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/homebrew-graciela/releases/download/v2.0.4/graciela.bottle.tar.gz"
  version "0.2.0.0"
  sha256 "2463c45b7dfade8f77d2858a0b27653941ce2570ad2d702c7af9a26b77764665"

  
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
