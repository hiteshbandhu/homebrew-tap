cask "hallmonitor-app" do
  version "0.5.4"
  sha256 "de606e182aa9aab6579d79e010b4a102cae25642d55bbe47021e35e6b892fb0f"

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
