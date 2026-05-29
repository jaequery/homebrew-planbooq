cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.604"
  sha256 arm:   "c347dae73161c61e2d21c33aa00f57690c9ce927f6d488ddc42695e4ee9db0ac",
         intel: "6340de74117fdff9ba98475ee2374f275aceae7d0a0e26c03dc1c10ba24e0aea"

  url "https://github.com/jaequery/planbooq/releases/download/v#{version}/Planbooq-#{version}-#{arch}.dmg",
      verified: "github.com/jaequery/planbooq/"
  name "Planbooq"
  desc "Desktop kanban for vibe coding in the age of parallel AI code generation"
  homepage "https://app.planbooq.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Planbooq.app"

  # Strip Gatekeeper quarantine + provenance attrs that macOS Sequoia
  # re-applies even after Homebrew's default unquarantine pass.
  # Without this users hit a "damaged / Move to Trash" dialog on
  # first launch because the app is only ad-hoc signed (no Apple
  # Developer ID yet).
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Planbooq.app"]
  end

  zap trash: [
    "~/Library/Application Support/Planbooq",
    "~/Library/Caches/com.planbooq.desktop",
    "~/Library/Logs/Planbooq",
    "~/Library/Preferences/com.planbooq.desktop.plist",
    "~/Library/Saved Application State/com.planbooq.desktop.savedState",
  ]
end
