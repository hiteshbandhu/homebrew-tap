class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.0/hallmonitor_0.5.0_darwin_arm64.tar.gz"
      sha256 "2f526cb7a9f47f4385625d7a7838dea0cdb054ebe60690474b649b172c2ade56"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.0/hallmonitor_0.5.0_darwin_amd64.tar.gz"
      sha256 "0e3317f71cdc8037ce2b356656d2ea1f6bc617f82e7fb797696fb8c6fcd2a242"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.0/hallmonitor_0.5.0_linux_arm64.tar.gz"
      sha256 "70f409a7ebfd16c4fd713a98bbd5b04891b4d1559314b50f36bf6b5b43b7bd7e"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.0/hallmonitor_0.5.0_linux_amd64.tar.gz"
      sha256 "1c6df301744d286f8f7f6f44b2f1c6cd5f1715a1ed36c1418c311465748dd823"
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
