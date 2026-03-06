class Cage < Formula
  desc "Run Claude Code inside an isolated Linux VM"
  homepage "https://github.com/sschlesier/cage"
  url "https://github.com/sschlesier/cage/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9c8dcd3d982d0af71470892fa44913e9a4bd7e0dc08441f629d2fb9a1c74ab31"
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
