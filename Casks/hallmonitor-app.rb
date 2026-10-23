cask "hallmonitor-app" do
  version "0.5.5"
  sha256 "ce1997eefee908a635fb2c5a3567eb2ed066041320810a0f7e1e8c0ef0472c22"

  url "https://github.com/hiteshbandhu/hallmonitor/releases/download/v#{version}/HallMonitor-#{version}.zip"
  name "Hall Monitor"
  desc "Menu bar and notch app for your coding agents"
  homepage "https://github.com/hiteshbandhu/hallmonitor"

  depends_on macos: :sonoma

  app "HallMonitor.app"

  # The app is ad-hoc signed, not notarized; without this macOS refuses to
  # open it after download.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/HallMonitor.app"],
        writable_paths: ["HallMonitor.app"],
        writable_base:  :appdir
  end

  uninstall quit: ["dev.hallmonitor.app", "dev.agentboard.bar"]

  zap trash: [
    "~/Library/Preferences/dev.agentboard.bar.plist",
    "~/Library/Preferences/dev.hallmonitor.app.plist",
  ]
end
