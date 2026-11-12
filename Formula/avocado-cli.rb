class AvocadoCli < Formula
  desc "Command-line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.1.0/avocado-1.1.0_aarch64-apple-darwin.tar.gz"
      sha256 "5bc0431b353d38d99067a23c40c29ac843653a83a4207c2e771c3977c9a92d6f"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.1.0/avocado-1.1.0_x86_64-apple-darwin.tar.gz"
      sha256 "a4bbcd3e386862d867f5a23304322462f4a60a2b10d8877ae0d1d3e4b1b5870e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.1.0/avocado-1.1.0_aarch64-unknown-linux-musl.tar.gz"
      sha256 "8acb405c3a4225948031f3e74002cc4bfdfeceaecdb5d8899b29ca642100f595"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.1.0/avocado-1.1.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d04c8695adb95bb42a84eabbdc196d4912d1af02cafc106c881e4f25342939a"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
