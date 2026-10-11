class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.1/hallmonitor_0.5.1_darwin_arm64.tar.gz"
      sha256 "02096c97a3beed6b3cf1f958442f173663c2e8d73e41508b82adb5e87b6c1264"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.1/hallmonitor_0.5.1_darwin_amd64.tar.gz"
      sha256 "cbb08b968e9b9f4258ef7d49600b90c25fd0b5a2623f7ab90eba73cedbbe9fc3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.1/hallmonitor_0.5.1_linux_arm64.tar.gz"
      sha256 "a917025e621e5d8d7813082cf0660b6cbdbdffc2f6425819b36e1cbd156fa905"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.5.1/hallmonitor_0.5.1_linux_amd64.tar.gz"
      sha256 "a0d97036fc3963fd3c7932f9cebde69c33349ce39abb130b90c260d9df0bd1cf"
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
