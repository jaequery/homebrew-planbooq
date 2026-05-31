cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.657"
  sha256 arm:   "da070f93d1921c146174704b20d48b00c6b580a4b68889f2df7c6ebd8ae7dd52",
         intel: "8cdf830bc677906d7596a4c2bce09b5d68adab650e2184d4282b0953640845b9"

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
