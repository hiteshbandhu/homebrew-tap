class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.3/hallmonitor_0.5.3_darwin_arm64.tar.gz"
      sha256 "964c61d98739869a6398bb85535de0263290c49f124035b4a994bf414672f873"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.3/hallmonitor_0.5.3_darwin_amd64.tar.gz"
      sha256 "6fb7d28c8cd0e6b93f8984b478580b5d975586e7430e33239f8ab9439328a621"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.3/hallmonitor_0.5.3_linux_arm64.tar.gz"
      sha256 "ae1338d41aeaa78904e6b609dd30b924b648cd69acaedb40bd4a88497adbb3a2"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.3/hallmonitor_0.5.3_linux_amd64.tar.gz"
      sha256 "cdb9d796ac9dfbaff5b8a930db71715c8d45e586a37b6cefaf503d39d35c041f"
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
