class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.5/agentboard_0.1.5_darwin_arm64.tar.gz"
      sha256 "c459427abb59c6957c483306209d13d3d2124bd7dc61c139e71b3bba78db6a44"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.5/agentboard_0.1.5_darwin_amd64.tar.gz"
      sha256 "899b4e8eb8aa65508a63857cabf3cb0f4f40a585a8cd5e1019cfda82823cd829"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.5/agentboard_0.1.5_linux_arm64.tar.gz"
      sha256 "f0137e9d42c7dc457f69b9b943b35536397866a8b68f98e4de0765348986e987"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.5/agentboard_0.1.5_linux_amd64.tar.gz"
      sha256 "50dc42f27b25011141d91c3dd00bbbad1c76a97258eb188dcbf2443777d0c191"
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
