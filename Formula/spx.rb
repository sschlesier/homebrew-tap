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
      url "https://github.com/sschlesier/spx/releases/download/v0.3.0/spx-macos-arm64"
      sha256 "2ae6ecbd8187698b0dfe9f2319cb1fea3c8f0a5939cd6d6ffefd50a33fb10d83"
    else
      url "https://github.com/sschlesier/spx/releases/download/v0.3.0/spx-macos-amd64"
      sha256 "87644f120b4bd620ffd4cb22da49d513b131f03a1767b008f6f0467950724378"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v0.3.0/spx-linux-arm64"
      sha256 "be2b9cd10e1a105bd056b82b63a4db2b0e510a0a349de0f170ff69f49deab0c2"
    else
      url "https://github.com/sschlesier/spx/releases/download/v0.3.0/spx-linux-amd64"
      sha256 "02ac86a68a1a08f84459b9b75bcb18b02f9b1d13edf48215293d9b0910bebcf4"
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
