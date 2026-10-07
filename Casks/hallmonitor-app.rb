cask "hallmonitor-app" do
  version "0.4.1"
  sha256 "6c001587457f233e1a7c98141fe793289ca373768e043b641aba6693d62a80b8"

  url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v#{version}/HallMonitor-#{version}.zip"
  name "Hall Monitor"
  desc "Menu bar and notch app for your coding agents"
  homepage "https://github.com/hiteshbandhu/hallmonitor"

  depends_on macos: :sonoma

  app "HallMonitor.app"

  # The app is ad-hoc signed, not notarized; without this macOS refuses to
  # open it after download.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/HallMonitor.app"]
  end

  uninstall quit: ["dev.hallmonitor.app", "dev.agentboard.bar"]

  zap trash: [
    "~/Library/Preferences/dev.hallmonitor.app.plist",
    "~/Library/Preferences/dev.agentboard.bar.plist",
  ]
end
