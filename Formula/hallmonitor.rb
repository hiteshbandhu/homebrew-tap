class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.6/hallmonitor_0.5.6_darwin_arm64.tar.gz"
      sha256 "ae7a41d239aa8785ee5db5673b6bb484603b6a73dc02cd35ec6cecb1431b76d3"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.6/hallmonitor_0.5.6_darwin_amd64.tar.gz"
      sha256 "8301a02f1209a7d9dd1ddebafeaf414f4b0f47601371508115faaf09672a92c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.6/hallmonitor_0.5.6_linux_arm64.tar.gz"
      sha256 "db143be316d20116a5ae26877066d93c550cd2efb55f839fa898eaf5382d8a53"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.6/hallmonitor_0.5.6_linux_amd64.tar.gz"
      sha256 "bd66d412c516b4e12b003b55be5b6d8bab725d507a77fa5c64cbeb881df45272"
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
