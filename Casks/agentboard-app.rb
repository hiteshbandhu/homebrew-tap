cask "agentboard-app" do
  version "0.1.0"
  sha256 "f28a61c8f795558d0b706e1be43ef86e19af0e34a535fa9a35a19f08b41b5849"

  url "https://github.com/hiteshbandhu/agentboard/releases/download/v#{version}/AgentBoard-#{version}.zip"
  name "AgentBoard"
  desc "Menu bar and notch app for your coding agents"
  homepage "https://github.com/hiteshbandhu/agentboard"

  depends_on macos: ">= :sonoma"

  app "AgentBoard.app"

  # The app is ad-hoc signed, not notarized; without this macOS refuses to
  # open it after download.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/AgentBoard.app"]
  end

  uninstall quit: "dev.agentboard.bar"

  zap trash: [
    "~/Library/Preferences/dev.agentboard.bar.plist",
  ]
end
