class Cage < Formula
  desc "Run Claude Code inside an isolated Linux VM"
  homepage "https://github.com/sschlesier/cage"
  url "https://github.com/sschlesier/cage/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "e48f96714321c11f97d2786b662e41b4419fbf2479e8885e903077de730397ab"
  license :cannot_represent

  depends_on "container"
  depends_on :macos

  def install
    bin.install "cage", "cage-shell", "cage-login", "cage-update"
    pkgshare.install "Dockerfile", "entrypoint.sh"
  end

  def caveats
    <<~EOS
      First-time setup:
        container system start
        cage-update    # build the Docker image
        cage-login     # authenticate with Anthropic
        cage           # run Claude Code in isolation
    EOS
  end

  test do
    assert_match "cage", (bin/"cage").readlink.to_s
  end
end
