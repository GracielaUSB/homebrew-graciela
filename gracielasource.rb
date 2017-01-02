
class GracielaSource < Formula
  desc ""
  homepage "https://github.com/GracielaUSB/graciela"
  url "https://github.com/GracielaUSB/graciela/tarball/master/src/"
  version "0.2.0.0"
  sha256 "204ff45385199444181c8fc23ec49a7f55d188e0dbc62dc5c29c2e022e1fd4e8"

  depends_on "GracielaUSB/graciela/llvm35"
  depends_on "GracielaUSB/graciela/clang35"
  depends_on "GracielaUSB/graciela/cabal-install"

  def install
    
    ## Install llvm dylib

    ## Compile and install external library for Graciela
    system "clang", "-lstdc++", "-fPIC", "-shared", "./src/C/libgraciela-abstract/libgraciela-abstract.cpp", "-o", "./src/C/libgraciela-abstract.so"
    system "clang", "-fPIC", "-shared", "./src/C/libgraciela.c", "./src/C/libgraciela-abstract.so", "-o", "./src/C/libgraciela.so"
    system "cabal", "update"
    system "cabal", "install", "llvm-general", "-fshared-llvm"
    system "cabal", "install", "./src/Haskell/graciela.cabal"
    lib.install "./src/C/libgraciela.so"
    lib.install "./src/C/libgraciela-abstract.so"
    
    ## Update Cabal. 
    ## Install SHARED llvm-general package
    ## Compile and install graciela and its dependencies
    
    bin.install "./src/Haskell/dist/build/graciela/graciela"
    
  end 

  test do
    system "false"
  end
end
