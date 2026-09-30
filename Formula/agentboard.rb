class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.4/agentboard_0.1.4_darwin_arm64.tar.gz"
      sha256 "24b617a72753064135e3487474ef51296edc8a4d28c8383776d97de0aa0778f4"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.4/agentboard_0.1.4_darwin_amd64.tar.gz"
      sha256 "bd003e916a1ea613e5549b46f5f2cf718f365607888f4f7c5f8db6fc7a1b75e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.4/agentboard_0.1.4_linux_arm64.tar.gz"
      sha256 "91b01cea2dc579466c4baabc4841ca7f70174b24fa1d0ab52a3e7c36a72dcfeb"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.4/agentboard_0.1.4_linux_amd64.tar.gz"
      sha256 "211e59c0f882b0bce59bf4aed8657f9003a2c230e5a6cf55595ecfa8c2b821ec"
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
