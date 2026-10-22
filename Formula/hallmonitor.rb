class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.4/hallmonitor_0.5.4_darwin_arm64.tar.gz"
      sha256 "cef9e73d8669fe9ba3e972f43faf203d711f76a9447a8245f7ca9146f9f7da5b"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.4/hallmonitor_0.5.4_darwin_amd64.tar.gz"
      sha256 "f8673d11beb8490d345905afd5e3dc0556b11cee4e8576d1457f20fa6a38be98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.4/hallmonitor_0.5.4_linux_arm64.tar.gz"
      sha256 "ec7625aa7c0b57cefa65de1f27075d625f91ef4c81c74b47bd444af79157ed34"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.4/hallmonitor_0.5.4_linux_amd64.tar.gz"
      sha256 "c65c4dda90dd993177d309a47546910622ca4e315020322df025adf1301db496"
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
