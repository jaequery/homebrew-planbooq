cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.642"
  sha256 arm:   "8725f8f2e2be07fa8e0e715e1989381193831ee8e667a4a76fb8c8f579fefd4e",
         intel: "68bf0e6d51ed50fcd51aa779e121e31f2d41fae1ce6c63ee7ab403537f4fd9b5"

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
