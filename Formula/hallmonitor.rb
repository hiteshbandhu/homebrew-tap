class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.2.0/hallmonitor_0.2.0_darwin_arm64.tar.gz"
      sha256 "9e613f06383f3aeac8eb1eb5551c3496a546b90413df92f4244857303b7352b0"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.2.0/hallmonitor_0.2.0_darwin_amd64.tar.gz"
      sha256 "050b9e8ad53521fc2945764844399b25765f6ba397054cc0ef8f75838a993bc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.2.0/hallmonitor_0.2.0_linux_arm64.tar.gz"
      sha256 "3e269e23bfbc3cc879786b92614eec9c7e1fa79900e8daca0111c92413a77b05"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.2.0/hallmonitor_0.2.0_linux_amd64.tar.gz"
      sha256 "36e5fa2755c28e1322b4ceff4bf2dcfa568509b7055b2c578a4760f59acfbd46"
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
