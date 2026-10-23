class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.7/hallmonitor_0.5.7_darwin_arm64.tar.gz"
      sha256 "12f065c0cb4b7f9e6b7e0be53811688dd6bb589d5fb3e96fb5e673165ad6cd43"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.7/hallmonitor_0.5.7_darwin_amd64.tar.gz"
      sha256 "33e14dd5373c1b936909dd3bcd7afa081235fc64a25347ccfd3b74e66049d9c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.7/hallmonitor_0.5.7_linux_arm64.tar.gz"
      sha256 "26d7f39f131c3115d72d4414458fcca3bdcd1feba93fd450a434c88ab0258cfb"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.7/hallmonitor_0.5.7_linux_amd64.tar.gz"
      sha256 "6611045d441a47bd3ed09a7e181aaf3234e0a06d1364ff519af36b1603848c7e"
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
