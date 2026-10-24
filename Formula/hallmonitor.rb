class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.1/hallmonitor_0.6.1_darwin_arm64.tar.gz"
      sha256 "f601c47d3935baf663486f744e4777f03213d8bf973904df8b663766c7216b77"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.1/hallmonitor_0.6.1_darwin_amd64.tar.gz"
      sha256 "1b7e6be240588ccf7ac4011ea1cd9d28e63cf9058e33483dc9ba780b165d2c40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.1/hallmonitor_0.6.1_linux_arm64.tar.gz"
      sha256 "4e332f92ca17f365f6dae34af91dbd403451a42e6fc70552e120fd081b2ae0bc"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.1/hallmonitor_0.6.1_linux_amd64.tar.gz"
      sha256 "5c7eb960537d08c9862f370f853ff22e90c8f744cd848b1498d96386d54c6c0e"
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
