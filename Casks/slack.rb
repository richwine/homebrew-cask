cask "slack" do
  version "4.13.0"

  if Hardware::CPU.intel?
    sha256 "ee945d5c8ea66690988a06787e7f1663dcd0b51fb25322c6f11dd7b69e2b25b8"

    url "https://downloads.slack-edge.com/releases/macos/#{version}/prod/x64/Slack-#{version}-macOS.dmg",
        verified: "downloads.slack-edge.com/"
  else
    sha256 "fc1b5c1968d57b9388863c2314450fe8d761e2052ae8d367a0e85b3fc9370604"

    url "https://downloads.slack-edge.com/releases/macos/#{version}/prod/arm64/Slack-#{version}-macOS.dmg",
        verified: "downloads.slack-edge.com/"
  end

  name "Slack"
  desc "Team communication and collaboration software"
  homepage "https://slack.com/"

  livecheck do
    url "https://slack.com/ssb/download-osx"
    strategy :header_match
  end

  auto_updates true
  conflicts_with cask: "homebrew/cask-versions/slack-beta"

  app "Slack.app"

  uninstall quit: "com.tinyspeck.slackmacgap"

  zap trash: [
    "~/Library/Application Scripts/com.tinyspeck.slackmacgap",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.tinyspeck.slackmacgap.sfl*",
    "~/Library/Application Support/Slack",
    "~/Library/Caches/com.tinyspeck.slackmacgap",
    "~/Library/Caches/com.tinyspeck.slackmacgap.ShipIt",
    "~/Library/Containers/com.tinyspeck.slackmacgap",
    "~/Library/Containers/com.tinyspeck.slackmacgap.SlackCallsService",
    "~/Library/Cookies/com.tinyspeck.slackmacgap.binarycookies",
    "~/Library/Group Containers/*.com.tinyspeck.slackmacgap",
    "~/Library/Group Containers/*.slack",
    "~/Library/Logs/Slack",
    "~/Library/Preferences/ByHost/com.tinyspeck.slackmacgap.ShipIt.*.plist",
    "~/Library/Preferences/com.tinyspeck.slackmacgap.helper.plist",
    "~/Library/Preferences/com.tinyspeck.slackmacgap.plist",
    "~/Library/Saved Application State/com.tinyspeck.slackmacgap.savedState",
    "~/Library/WebKit/com.tinyspeck.slackmacgap",
  ]
end
