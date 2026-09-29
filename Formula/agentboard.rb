class Agentboard < Formula
  desc "Live board for your coding agents: Claude Code and Codex, local and over SSH"
  homepage "https://github.com/hiteshbandhu/agentboard"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.2/agentboard_0.1.2_darwin_arm64.tar.gz"
      sha256 "7b850497355e90fd09ee30feee1ac8faee1c2f405b43658b08c1bac7cb5e7729"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.2/agentboard_0.1.2_darwin_amd64.tar.gz"
      sha256 "819dc41ab13c071301457d2a4cc66fe99e5ed3e8e66274e1776be4833d6a9043"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.2/agentboard_0.1.2_linux_arm64.tar.gz"
      sha256 "c060dc6fe3902b7d7338d7b482bd5ed66701a5aa01d51481ab8e92fdaf89c3f8"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/agentboard/releases/download/v0.1.2/agentboard_0.1.2_linux_amd64.tar.gz"
      sha256 "adf5204318d2e20769c7d257f7c8b1cc534114d2b48d2dc30a3778d196db3207"
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
