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
      url "https://github.com/sschlesier/spx/releases/download/v2.0.0/spx-macos-arm64"
      sha256 "4bfc8be2507cdc679e29f098e58382e15efea06804d990c330f9cf5ae458dc83"
    else
      url "https://github.com/sschlesier/spx/releases/download/v2.0.0/spx-macos-amd64"
      sha256 "0aa3ee6bee3f14adcea77a5ee9e42759cf20841dc4dd702b5fea43451dc37f95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v2.0.0/spx-linux-arm64"
      sha256 "7287606562c45084db183fe4b2be1dc614f0f5c724499a0ecafaf347d877e065"
    else
      url "https://github.com/sschlesier/spx/releases/download/v2.0.0/spx-linux-amd64"
      sha256 "98d2c16bdf796d95bba681b15dfab92971016b43a470d1cb794c657ca6aa1a91"
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
