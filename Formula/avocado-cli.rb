class AvocadoCli < Formula
  desc "Command line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  version "1.0.0-rc.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-apple-darwin.tar.gz"
      sha256 "74b652e7cf0eb10e4aa71cff081c34cab5f4b5bb3f8d55cdf0132af7d50df9ef"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-apple-darwin.tar.gz"
      sha256 "68c74854efd38ecd8f3e8d813cf0351b4f4c3878d84ea5e6aa1e0de2b3673407"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-unknown-linux-musl.tar.gz"
      sha256 "f32a51ecd806fa29e93e3dafd60870f8d3bb7ff28ed0315c03a01c0ef8cd3fe2"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efed946b4020e192e7b8230c2708de41d7c10848266e24bfac7c38d3fc022cfa"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
