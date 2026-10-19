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
      url "https://github.com/sschlesier/spx/releases/download/v1.0.0/spx-macos-arm64"
      sha256 "0da600a79a0c4336503db08ac09629ab7128ea3352eb5e50e9c0b147c62e5fb6"
    else
      url "https://github.com/sschlesier/spx/releases/download/v1.0.0/spx-macos-amd64"
      sha256 "90bc33dcfcb3c0ccfb3761a275ae1ae2d6899988e12dd847c505a0c8e5e6dc1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v1.0.0/spx-linux-arm64"
      sha256 "e62b7a55d76ece1e61b69067d3e0eb5ff00526e0ada27fed0c6e6d76c2d1756c"
    else
      url "https://github.com/sschlesier/spx/releases/download/v1.0.0/spx-linux-amd64"
      sha256 "62b878fa55b57d298459be250ecba62bf4171ae472fd307c321d86e187888ad9"
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
