cask "agentboard-app" do
  version "0.1.1"
  sha256 "64df231b56ebd43d4d70811ae7fbb1202a5d751bbb1792dd1c7c414e5dac6a9c"

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
