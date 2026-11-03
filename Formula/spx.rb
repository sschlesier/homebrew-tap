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
      url "https://github.com/sschlesier/spx/releases/download/v1.1.0/spx-macos-arm64"
      sha256 "756c974c269a0cb18b1cee52fda41a10535f5d8e0bd3e79ce80c831cf789a526"
    else
      url "https://github.com/sschlesier/spx/releases/download/v1.1.0/spx-macos-amd64"
      sha256 "b4563ca6b2fc016022a68707452b0e3633a87980b5115bdb928843f9c3c14ebb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v1.1.0/spx-linux-arm64"
      sha256 "27be5a69d22145a30746bde2ac8a684d1e49abac4ca561789d74e05c6323a425"
    else
      url "https://github.com/sschlesier/spx/releases/download/v1.1.0/spx-linux-amd64"
      sha256 "2c5709ae91751ed6c607c2b3d0565f9ae3fdead48734173f5259a705c5a93ec6"
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
