class Cage < Formula
  desc "Run Claude Code inside an isolated Linux VM"
  homepage "https://github.com/sschlesier/cage"
  url "https://github.com/sschlesier/cage/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0968049e3f39c0dee3bef6a674df3f7c40dba174069486b72f80837b94ee5a03"
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
