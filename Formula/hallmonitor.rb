class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.5/hallmonitor_0.5.5_darwin_arm64.tar.gz"
      sha256 "e0a586d6796048b360c02897d0055d957fd3609e58d6cdc2cd0e03350ea90910"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.5/hallmonitor_0.5.5_darwin_amd64.tar.gz"
      sha256 "052047677cebd95a1a2f784d9cfcd7f1b5cd30fb9455bb799daf00e720442a36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.5/hallmonitor_0.5.5_linux_arm64.tar.gz"
      sha256 "4a394cf87ea7847569c979e5b082b9d4d76d342ba01c0b337fa0727e0f43e723"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.5/hallmonitor_0.5.5_linux_amd64.tar.gz"
      sha256 "b8d8b072c228a80bd9fffb9d3651b238b3b26b53864fc6e064a991929eaa8c0b"
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
