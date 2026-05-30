class Bkup < Formula
  desc "Backup directories to a restic repository on Backblaze B2"
  homepage "https://github.com/sschlesier/bkup"
  url "https://github.com/sschlesier/bkup/archive/refs/tags/v1.3.1.tar.gz"
  sha256 "475be5f2aa46220323e8214833b16de2add674bfc82e8d0063450f8911545d37"
  license "MIT"

  depends_on "restic"
  depends_on "jq"

  def install
    bin.install "bin/bkup"
    bin.install "bin/bkup-init"
    bin.install "bin/bkup-status"
    bin.install "bin/bkup-logs" if (buildpath / "bin/bkup-logs").exist?
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
    assert_match "Usage: bkup status", shell_output("#{bin}/bkup-status --help")
    assert_match "Usage: bkup-logs", shell_output("#{bin}/bkup-logs --help") if (bin / "bkup-logs").exist?
  end
end
