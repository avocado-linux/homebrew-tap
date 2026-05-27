cask "avocado-desktop" do
  version "0.4.4"
  sha256 "f4cabd8144d7ff8a9b84e5dc49ec3533f87f8dab0eb09485f2b65f5f53531115"

  url "https://repo.avocadolinux.org/releases/desktop/stable/Avocado-#{version}.dmg",
      verified: "repo.avocadolinux.org/releases/desktop/"
  name "Avocado Desktop"
  desc "Host-side helper for the Avocado Linux development VM"
  homepage "https://github.com/avocado-linux/avocado-desktop"

  # `brew livecheck` reads our published latest.json so users see
  # "outdated" badges (and brew upgrade --greedy works) without us
  # having to scrape S3 directory listings.
  livecheck do
    url "https://repo.avocadolinux.org/releases/desktop-tauri/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # The app owns its own updates via tauri-plugin-updater, which polls
  # repo.avocadolinux.org/releases/desktop-tauri/latest.json and atomic-
  # swaps the bundle when a new minisign-signed release lands.
  # `auto_updates true` tells Homebrew "don't try to `brew upgrade` me";
  # users on the prior Sparkle-based 0.3.x line need to run
  # `brew upgrade --cask --greedy avocado-desktop` ONCE to pick up
  # 0.4.0, after which the in-app updater takes over.
  auto_updates true
  depends_on macos: :sonoma

  app "Avocado.app"

  # Bundle ID lookup for `brew uninstall --cask` cleanup.
  uninstall launchctl: "com.peridio.avocadodesktop",
            quit:      "com.peridio.avocadodesktop"

  # `zap` is the explicit "delete every trace of this app" path users
  # invoke with `brew uninstall --cask --zap avocado-desktop`. Includes
  # the app's own logs/state + leftover Sparkle/tauri-updater caches
  # (Sparkle from the pre-0.4.0 SwiftUI builds; the Tauri updater
  # writes its staging area under the same Caches dir).
  zap trash: [
    "~/Library/Application Support/Avocado",
    "~/Library/Caches/com.peridio.avocadodesktop",
    "~/Library/Caches/Sparkle",
    "~/Library/Logs/Avocado",
    "~/Library/Preferences/com.peridio.avocadodesktop.plist",
    "~/Library/Saved Application State/com.peridio.avocadodesktop.savedState",
  ]

  caveats <<~EOS
    Avocado Desktop ships its USB/IP helper bundled inside Avocado.app.
    Some USB device classes (Mass Storage, NCM, HID) require the helper
    to run as root — handled by an in-app first-launch elevation prompt.

    To use Avocado you'll also need the avocado CLI:

      brew install avocado-linux/tap/avocado-cli

    See https://github.com/avocado-linux/avocado-desktop for the full
    setup walkthrough.
  EOS
end
