class Spx < Formula
  desc "Terminal browser for the spec store"
  homepage "https://github.com/sschlesier/spx"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v2.1.0/spx-macos-arm64"
      sha256 "d24a571d390739269eb1c870272b91563f4b4e42fadeea01bb7a4de71ae93b97"
    else
      url "https://github.com/sschlesier/spx/releases/download/v2.1.0/spx-macos-amd64"
      sha256 "a2c77ce2102704275a60c36a95e71fb13cd9c1b0dcfd69fdd86310c01cad220e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v2.1.0/spx-linux-arm64"
      sha256 "7d30d789e0b47b86d1654f09d937538aa4d6307b7da67b3de8bc79133b058cec"
    else
      url "https://github.com/sschlesier/spx/releases/download/v2.1.0/spx-linux-amd64"
      sha256 "2be42bc9fc8fc2b13e6406ff025fa8051b376ebae9eeff9a14df9c49e689ec44"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "spx-macos-arm64" : "spx-macos-amd64"
    else
      Hardware::CPU.arm? ? "spx-linux-arm64" : "spx-linux-amd64"
    end

    bin.install binary_name => "spx"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spx --version")
  end
end
