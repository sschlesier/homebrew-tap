class Cage < Formula
  desc "Run Claude Code inside an isolated Linux VM"
  homepage "https://github.com/sschlesier/cage"
  url "https://github.com/sschlesier/cage/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "8e5fc9f8ff0cb41e26ab6da50906654c5116f521f8076e7c9afd9cf4c5a35566"
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
