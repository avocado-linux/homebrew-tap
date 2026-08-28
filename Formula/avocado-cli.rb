class AvocadoCli < Formula
  desc "Command line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  version "1.0.0-rc.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-apple-darwin.tar.gz"
      sha256 "13fc7061a9f7b0c3fb759380f731b662fe73b92893aa3084bddf4f481b8ce329"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-apple-darwin.tar.gz"
      sha256 "e1240d9446e4f93e3bb81d0bd14e6c27bc1a5bc834e2f2567c2321476d2f2e46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-unknown-linux-musl.tar.gz"
      sha256 "f95821dbe161d6e298b1d12d6d76139a63f0272da6a4d7d25651004cb95a8ba1"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55a5a9449ad5dd9d0c42173c3758e2efbfe35463e2366ee1f338e5926295ca6a"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
