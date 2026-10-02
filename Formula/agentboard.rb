class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.6/agentboard_0.1.6_darwin_arm64.tar.gz"
      sha256 "68cdd96f80cdf5d3f2466bca1f7300c089b5313a2bfcc2ddc3bcdf03fcbb86e2"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.6/agentboard_0.1.6_darwin_amd64.tar.gz"
      sha256 "d6579722e69a1fa781a3458663b5db51fad86f3cb457d23131ff388bdf4ef632"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.6/agentboard_0.1.6_linux_arm64.tar.gz"
      sha256 "0f33c6976252933534aad3069b3fdb2ae251a88486bde6f756fe423d3f78a1a7"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.6/agentboard_0.1.6_linux_amd64.tar.gz"
      sha256 "56fb950784d0ed8f378f32875991e06380c68606d4f969a547e4300eb1dcc157"
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
