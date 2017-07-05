


class Llvm35 < Formula
  desc "Next-gen compiler infrastructure"
  homepage "http://llvm.org/"
  url "http://releases.llvm.org/3.5.2/llvm-3.5.2.src.tar.xz"
  sha256 "44196156d5749eb4b4224fe471a29cc3984df92570a4a89fa859f7394fc0c575"

  def install
    # Apple's libstdc++ is too old to build LLVM
    system "./configure", "--prefix=#{prefix}", "--enable-assertions=no", "--enable-shared"

    
    system "make"
    system "make", "install"
  end

end
