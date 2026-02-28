class Bkup < Formula
  desc "Backup directories to a restic repository on Backblaze B2"
  homepage "https://github.com/sschlesier/bkup"
  url "https://github.com/sschlesier/bkup/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "dfebe94584972d9794c574c235692cb0dbe353c385e77c6246d746b6dee8a47c"
  license "MIT"

  depends_on "restic"
  depends_on "jq"

  def install
    bin.install "bin/bkup"
    bin.install "bin/bkup-init"
    bin.install "bin/bkup-status"
  end

  service do
    run [opt_bin/"bkup"]
    cron "33 2 * * *"
    process_type :background
    log_path var/"log/bkup.log"
    error_log_path var/"log/bkup.log"
  end

  def caveats
    <<~EOS
      Before starting bkup, run the setup wizard to configure credentials and
      directories:

        bkup init

      Then start the daily backup service:

        brew services start bkup

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
