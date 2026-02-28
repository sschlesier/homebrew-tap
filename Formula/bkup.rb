class Bkup < Formula
  desc "Backup directories to a restic repository on Backblaze B2"
  homepage "https://github.com/sschlesier/bkup"
  url "https://github.com/sschlesier/bkup/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "121bff0a16db6e90df6e42c6b1d00a9f8951fb75176bf7cdff3b0ea2fd971ac1"
  license "MIT"

  depends_on "restic"
  depends_on "jq"

  def install
    bin.install "bin/bkup"
    bin.install "bin/bkup-init"
    bin.install "bin/bkup-status"
  end

  def caveats
    <<~EOS
      Run the setup wizard to configure credentials, directories, and install
      the launchd service (which wakes the machine for nightly backups):

        bkup init

      Per-machine config is stored in ~/.config/bkup/:
        env   - credentials (chmod 600, never committed)
        dirs  - list of directories to back up
    EOS
  end

  test do
    assert_match "Usage: bkup", shell_output("#{bin}/bkup --help")
    assert_match "Usage: bkup-status", shell_output("#{bin}/bkup-status --help")
  end
end
