class Libpst < Formula
  desc "Utilities for the PST file format"
  homepage "https://www.five-ten-sg.com/libpst/"
  url "https://www.five-ten-sg.com/libpst/packages/libpst-0.6.76.tar.gz"
  sha256 "3d291beebbdb48d2b934608bc06195b641da63d2a8f5e0d386f2e9d6d05a0b42"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://www.five-ten-sg.com/libpst/packages/"
    regex(/href=.*?libpst[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    rebuild 2
    sha256 cellar: :any, arm64_big_sur: "669e325cb32cbad435d86606d40012aee6d9101b2ffbc6efc9fa101e9bcdf97f"
    sha256 cellar: :any, big_sur:       "6f48557a8529e0bc989baaa72788c52289896194e069217bf8fe5cc771207a22"
    sha256 cellar: :any, catalina:      "cbf301e72e23ecad7be367063b933bb9ce0ea430f5af413ad44f71b04e4ccae3"
    sha256 cellar: :any, mojave:        "b5dff8dd482a5688ce97bc7407ad7a18d620dc264ba1962e155e862ae2973d2b"
  end

  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "gettext"
  depends_on "libgsf"

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --disable-python
    ]

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    system bin/"lspst", "-V"
  end
end
