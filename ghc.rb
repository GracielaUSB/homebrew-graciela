class Ghc < Formula
  desc "Glorious Glasgow Haskell Compilation System"
  homepage "https://haskell.org/ghc/"
  url "http://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3b-x86_64-apple-darwin.tar.xz"
  sha256 "b7cad2ea7badb7006621105fbf24b4bd364d2e51c1a75661978d9280d68e83a8"

  def install
    system "./configure", "--prefix=#{prefix}"

    ENV.deparallelize { system "make", "install" }
  end

  test do
    (testpath/"hello.hs").write('main = putStrLn "Hello Homebrew"')
    system "runghc", testpath/"hello.hs"
  end
end
