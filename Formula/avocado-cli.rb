class AvocadoCli < Formula
  desc "Command line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  version "0.41.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-apple-darwin.tar.gz"
      sha256 "18faa23b636ed6e7b032d8eeab9d66ff5d9d1b761a92dde4eb9d792bcafb93ef"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-apple-darwin.tar.gz"
      sha256 "32eeda954bb355e46b1429aaca705a185862590d5afb635e7b7db437e002621d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-unknown-linux-musl.tar.gz"
      sha256 "5ab9051ba44733b0a40a788ead2aad935bc21653d5efc0970bfc137fcf85daea"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0a39770991ac27b467b6e8c2cdcf09ed75dd07dbc4b9825aec6f56a1c7e9607"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
