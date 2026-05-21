cask "avocado-desktop" do
  version "0.2.0"
  sha256 "a483169338d155ab5f0a3f01ef3073784997706d58db03a5ce6df11d661dd3dc"

  url "https://repo.avocadolinux.org/releases/desktop/stable/Avocado-#{version}.dmg"
  name "Avocado Desktop"
  desc "Host-side helper for the Avocado Linux development VM"
  homepage "https://github.com/avocado-linux/avocado-desktop"

  # Sparkle owns updates. `auto_updates true` tells Homebrew "don't try to
  # `brew upgrade` me" — the app's in-process Sparkle integration polls
  # repo.avocadolinux.org/releases/desktop/appcast.xml on its own cadence
  # and atomic-swaps the bundle when a new EdDSA-signed release lands.
  auto_updates true

  depends_on macos: ">= :sonoma"

  app "Avocado.app"

  # Bundle ID lookup for `brew uninstall --cask` cleanup.
  uninstall quit:      "com.peridio.avocadodesktop",
            launchctl: "com.peridio.avocadodesktop"

  # `zap` is the explicit "delete every trace of this app" path users
  # invoke with `brew uninstall --cask --zap avocado-desktop`. Includes
  # the Sparkle update cache + the app's own logs/state.
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
