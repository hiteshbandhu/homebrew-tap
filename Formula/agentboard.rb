class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.1/agentboard_0.1.1_darwin_arm64.tar.gz"
      sha256 "0fd92a2664d1f12a993b044a851d8825f7d3c17a1cd1a49517fae3cf14f7b8ea"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.1/agentboard_0.1.1_darwin_amd64.tar.gz"
      sha256 "cc7c6d82c805320a1ae7a9ddd5629c8045054c43c8b0bf665d12b9a36bb8a0af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.1/agentboard_0.1.1_linux_arm64.tar.gz"
      sha256 "97763de52034b78f910cbeebfc046b688a4b483689636eb69f03e16df03e869b"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.1/agentboard_0.1.1_linux_amd64.tar.gz"
      sha256 "6730fd9caa6ca9f1bcd3cddd94246750576903e15eb382fec78825e7283e3452"
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
