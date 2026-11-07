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
      url "https://github.com/sschlesier/spx/releases/download/v1.2.0/spx-macos-arm64"
      sha256 "d5342d048cd73ece5a656616a9f97d83980c475b4cca28ab6d97c11862363d5b"
    else
      url "https://github.com/sschlesier/spx/releases/download/v1.2.0/spx-macos-amd64"
      sha256 "3566e1b6c05e35be1ca48bf6214aea3047c381317b9adaca6aaa6e2f504b8ff6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v1.2.0/spx-linux-arm64"
      sha256 "64ac74b7dc8f243a43d5444a0bab3b3d260327b0e79ba21b410bb96d66ff4752"
    else
      url "https://github.com/sschlesier/spx/releases/download/v1.2.0/spx-linux-amd64"
      sha256 "c8bc0bea900040ff3e37e5541b0c086221fc2001d95144db5fab02ef24532d66"
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
