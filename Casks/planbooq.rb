cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.623"
  sha256 arm:   "50165dd286e47cfd0b39f4c756f6b9aaff9a915432baf18b67e467998c2981ad",
         intel: "dcc094a3c618a936faccac19a6b8f5e4172102aece8bcc96412c2865b967c630"

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
