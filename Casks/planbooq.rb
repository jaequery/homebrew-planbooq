cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.484"
  sha256 arm:   "7303d0a77b0eec5331d0c6d19b10ece95db06bad60d13a19fac972c881ea7958",
         intel: "1d44144d950834e2aab2cbb873b6318de0b0e2044a3498a698299de67916f7dc"

  url "https://github.com/jaequery/planbooq/releases/download/v#{version}/Planbooq-#{arch}.dmg",
      verified: "github.com/jaequery/planbooq/"
  name "Planbooq"
  desc "Desktop kanban for vibe coding in the age of parallel AI code generation"
  homepage "https://app.planbooq.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Planbooq.app"

  zap trash: [
    "~/Library/Application Support/Planbooq",
    "~/Library/Caches/com.planbooq.desktop",
    "~/Library/Logs/Planbooq",
    "~/Library/Preferences/com.planbooq.desktop.plist",
    "~/Library/Saved Application State/com.planbooq.desktop.savedState",
  ]
end
