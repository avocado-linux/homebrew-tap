class AvocadoCli < Formula
  desc "Command line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  version "0.40.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-apple-darwin.tar.gz"
      sha256 "7bc1155edb7677ac00333366a1e0f22d86ba4243ef239a0b95dd101305882d0d"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-apple-darwin.tar.gz"
      sha256 "dc87982996b7510881bef902dda89c4d391611b450093f41cd1c5fee9217a7dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-unknown-linux-musl.tar.gz"
      sha256 "83cf9ecedf9a0076331c29308ca5d38a3c807404e42ad7df1e813b1bd20f9173"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed86ce4295a883caab6de221f638254328c167f31842e6c3dedf93cc0119abc7"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
