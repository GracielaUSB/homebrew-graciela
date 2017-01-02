

class Clang35 < Formula
  desc "Clang C/C++ Compiler"
  homepage "http://llvm.org/"
  url "https://github.com/GracielaUSB/homebrew-graciela/raw/master/clang-3.5.tar.gz"
  sha256 "ebbcc24f770911dd7a1d2f1d8017f3cbab74a23cb33ede7ec3b8cbfb22c3e26a"

  def install    
    bin.install "./clang-3.5"
  end

end
