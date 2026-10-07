class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.1/hallmonitor_0.4.1_darwin_arm64.tar.gz"
      sha256 "df35b69f3996c022c7da82b6fb0928b820bff84dd00a59967e06b5167c506abc"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.1/hallmonitor_0.4.1_darwin_amd64.tar.gz"
      sha256 "de7beceec7c28773d4f378d43107c76862291f1bf3ad3b228e5025aa98e64dab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.1/hallmonitor_0.4.1_linux_arm64.tar.gz"
      sha256 "cdcec4e10fae6bc217e3b98b1c6f68f87f5275cfe3f5048f8088ba8f19783d4a"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.4.1/hallmonitor_0.4.1_linux_amd64.tar.gz"
      sha256 "981ac3a4459483cbe0b6363d227e9beafb7c3636bc5bbc34ecd82ddaaf1876e6"
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
