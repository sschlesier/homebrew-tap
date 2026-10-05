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
      url "https://github.com/sschlesier/spx/releases/download/v0.1.0/spx-macos-arm64"
      sha256 "c76f74476a087e9296087ddf99da7ff29b5d1e8948d649e1ebdadfaa2ac788d2"
    else
      url "https://github.com/sschlesier/spx/releases/download/v0.1.0/spx-macos-amd64"
      sha256 "494df8e4790f1e799118e018e568293a346b31c4320a96c580e3382f7dc10480"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sschlesier/spx/releases/download/v0.1.0/spx-linux-arm64"
      sha256 "4656ea9759dc2e9ef86ccec68d339a2c70474703f1cca358130f80b157bee479"
    else
      url "https://github.com/sschlesier/spx/releases/download/v0.1.0/spx-linux-amd64"
      sha256 "fd26904d24d5639f005bac41623962bd3238d1d01fa3d2375dd73dfbc4fbab53"
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
