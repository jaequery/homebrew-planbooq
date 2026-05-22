cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.504"
  sha256 arm:   "8ad5f62187e030c464389afdb8bcb18f30a9c184b9d06c0abc648cfbe5819879",
         intel: "893302ea1f818675a4c18140fd2ac99bc68143855bd6129b1c021bdb608ac16f"

  url "https://github.com/jaequery/planbooq/releases/download/v#{version}/Planbooq-#{arch}.dmg",
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
