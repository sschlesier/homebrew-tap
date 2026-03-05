class Cage < Formula
  desc "Run Claude Code inside an isolated Linux VM"
  homepage "https://github.com/sschlesier/cage"
  url "https://github.com/sschlesier/cage/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "43bf19ab050aee1df4d3f6ed00b227b84fb12b21767cca068a36531f1bd27fe3"
  license "MIT"

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
