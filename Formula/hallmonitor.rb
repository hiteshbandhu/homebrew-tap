class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.0/hallmonitor_0.4.0_darwin_arm64.tar.gz"
      sha256 "8a469a512298a811daef7b5511174c2bcf7d2e87776f1429075c73e9d2a8577b"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.0/hallmonitor_0.4.0_darwin_amd64.tar.gz"
      sha256 "2790268db3b8d13a588654e1c2fa4c1b370ecfc73fe5764ac0b343090e4f3713"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.0/hallmonitor_0.4.0_linux_arm64.tar.gz"
      sha256 "e2d82ba8ff5bf985945efbc29036ac062ddb5b41a2d224b11189fa2932d3c219"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.0/hallmonitor_0.4.0_linux_amd64.tar.gz"
      sha256 "c0dc86f0129a7d44d2771a85b6ad5c17e70328c38892a7ddba9f378d339f4069"
    end
  end

  def install
    bin.install "hallmonitor"
    bin.install_symlink "hallmonitor" => "agentboard" # its name until 0.2
  end

  def caveats
    <<~EOS
      Run `hallmonitor` for the board, `hallmonitor --demo` to try it.
      To see Claude plan limits, run once: hallmonitor statusline --install
    EOS
  end

  test do
    assert_match "hallmonitor #{version}", shell_output("#{bin}/hallmonitor --version")
  end
end
