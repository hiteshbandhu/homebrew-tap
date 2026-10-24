class Hallmonitor < Formula
  desc "Hall monitor for your coding agents: Claude Code, Codex and opencode, local and over SSH"
  homepage "https://github.com/hiteshbandhu/hallmonitor"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.0/hallmonitor_0.6.0_darwin_arm64.tar.gz"
      sha256 "e42ef639d36463320e2ddd8e76ff342b4a88be042bcf35f89762164fb763f701"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.0/hallmonitor_0.6.0_darwin_amd64.tar.gz"
      sha256 "6528de52ffb81035b1cde9004d27c090ebb7226b2f041aaf31741a348bd53627"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.0/hallmonitor_0.6.0_linux_arm64.tar.gz"
      sha256 "a691e889d02c18e6b2167d094e87c9a1057be9f217a9fda01bd9d9a8232c764b"
    end
    on_intel do
      url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v0.6.0/hallmonitor_0.6.0_linux_amd64.tar.gz"
      sha256 "f7f143d68718397c2d393e07989779433ddb5bc73bce22f944e9a3a29e05604b"
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
