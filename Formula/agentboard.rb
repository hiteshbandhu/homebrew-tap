class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.3/agentboard_0.1.3_darwin_arm64.tar.gz"
      sha256 "49c0a402be4867f057346227b7b7d460593a8f4c1ec740b723f70ac8f29ca55b"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.3/agentboard_0.1.3_darwin_amd64.tar.gz"
      sha256 "f40353c644e976a3acfe4f6043552bca987aaf70a2d68590f9b9e9fd95fbdec3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.3/agentboard_0.1.3_linux_arm64.tar.gz"
      sha256 "2b8cf1ca0b0907fc2a4b89a8b5e5e59358a5a767198676526e00e90bbc47359a"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.3/agentboard_0.1.3_linux_amd64.tar.gz"
      sha256 "33855a2fd1dec8fec0c92bae874799689fa1415cb13f1514472a9b050fc93147"
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
