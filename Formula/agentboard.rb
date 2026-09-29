class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.0/agentboard_0.1.0_darwin_arm64.tar.gz"
      sha256 "5efed0c67b2947d1eec41c7c7cc55f8be1daf14789ddcb5d64af9c21c84d92fd"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.0/agentboard_0.1.0_darwin_amd64.tar.gz"
      sha256 "a54fc9e592c0657c64d7ed4fd4395047ee5587f5d477e6b852ad7b671f1cb761"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.0/agentboard_0.1.0_linux_arm64.tar.gz"
      sha256 "828d0f676284e28bcb91608ce05a6c4f33f9016b936bf3b9401944bfd416334e"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.0/agentboard_0.1.0_linux_amd64.tar.gz"
      sha256 "6ba917a8723f3ac38716963540dc1a0293d1f9a772b9253761e00b9e37df8a47"
    end
  end

  def install
    bin.install "agentboard"
  end

  def caveats
    <<~EOS
      Run `agentboard` for the board, `agentboard --demo` to try it.
      To see Claude plan limits, run once: agentboard statusline --install
    EOS
  end

  test do
    assert_match "agentboard #{version}", shell_output("#{bin}/agentboard --version")
  end
end
