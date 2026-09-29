cask "agentboard-app" do
  version "0.1.2"
  sha256 "de20e135a0a329d6ddf200881710187e80903f55640dc6e10ac35182e24e3227"

  url "https://github.com/hiteshbandhu/agentboard/releases/download/v#{version}/AgentBoard-#{version}.zip"
  name "AgentBoard"
  desc "Menu bar and notch app for your coding agents"
  homepage "https://github.com/hiteshbandhu/agentboard"

  depends_on macos: :sonoma

  app "AgentBoard.app"

  # The app is ad-hoc signed, not notarized; without this macOS refuses to
  # open it after download.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/AgentBoard.app"]
  end

  uninstall quit: "dev.agentboard.bar"

  zap trash: "~/Library/Preferences/dev.agentboard.bar.plist"
end
