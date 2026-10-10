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
      url "https://github.com/sschlesier/spx/releases/download/v0.2.0/spx-macos-arm64"
      sha256 "4cc0918c651b5e4c5507178ff919fd89977cfbb49de8c9573d5ab752c6f2010f"
    else
      url "https://github.com/sschlesier/spx/releases/download/v0.2.0/spx-macos-amd64"
      sha256 "de54cd31c68569e0a9ae099d36838c3c7eba3469c98bf42a90112113748f1142"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v0.2.0/spx-linux-arm64"
      sha256 "8ee417f5ca8aeeff15ac01326bf7cba6301edbc5ee963cd9bd1483bdfbaacec2"
    else
      url "https://github.com/sschlesier/spx/releases/download/v0.2.0/spx-linux-amd64"
      sha256 "2e104dfa36b6d816ec17302cb1a1556218704ff32e954535d224933f528d825b"
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
