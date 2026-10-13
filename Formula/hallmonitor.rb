class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.2/hallmonitor_0.5.2_darwin_arm64.tar.gz"
      sha256 "1e8c4dd0e2ae0002460b78a790193068082a81bd3ad0ffdcad6b44e52019f6c7"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.2/hallmonitor_0.5.2_darwin_amd64.tar.gz"
      sha256 "6be04cfe2de06d58c04d122684e7dedbfb6a32b41ca2aee0a908123319d64f01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.2/hallmonitor_0.5.2_linux_arm64.tar.gz"
      sha256 "1b07f856a4f648e7ed778e9510ed3c030c05184b8d014dc83ae07804d3d4cf64"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.2/hallmonitor_0.5.2_linux_amd64.tar.gz"
      sha256 "9d91097e16483b1518c0a0cfe5eba6f752e0fc6b3ba6675009d43fe24fbc227c"
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
