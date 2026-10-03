class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.3.0/hallmonitor_0.3.0_darwin_arm64.tar.gz"
      sha256 "61efd9ba5328253f8dff8953532afcfaf62913964fa7de9aecc6ee1f6c17898d"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.3.0/hallmonitor_0.3.0_darwin_amd64.tar.gz"
      sha256 "9d0435db1a6e926de0f0b4bfc7ca5e6e801ca1eabf016384dfc71e507ae4a529"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.3.0/hallmonitor_0.3.0_linux_arm64.tar.gz"
      sha256 "05992eaaf93822bc8a87b08fafb89686fec45da398d45eb7292329e237ee45c4"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.3.0/hallmonitor_0.3.0_linux_amd64.tar.gz"
      sha256 "e5f13324a51f9c9bd357064c150f8fce1cc21501a332d0028db0569ad45071e2"
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
