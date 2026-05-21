cask "planbooq" do
  arch arm: "arm64", intel: "x64"

  version "0.1.481"
  sha256 arm:   "74fbb6466e0bd3937a21b22ca4cbfb54f2d6a12522807d5ac10eb7508ed6b4ef",
         intel: "fb73522826e3efab58fa1072544613ffbd6dfd459b7074dece84d6629817295f"

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
