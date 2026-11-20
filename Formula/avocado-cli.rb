class AvocadoCli < Formula
  desc "Command-line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.2.0/avocado-1.2.0_aarch64-apple-darwin.tar.gz"
      sha256 "5ed7e42466fec4beaa4f90283ba19261d7be098fee1e870f60388073ed3d2386"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.2.0/avocado-1.2.0_x86_64-apple-darwin.tar.gz"
      sha256 "ebf51329cba22567f21bdd41407d739cdfb0c4ed685fb81acfd8a0cd6fb28a0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.2.0/avocado-1.2.0_aarch64-unknown-linux-musl.tar.gz"
      sha256 "b5eb1f7266ec0f06b1ccee0b66a1c1d9ff0f84d7fee26117476c7b2dbaefbcc1"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.2.0/avocado-1.2.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cd1b337c6300e58935ae2cdd6c3c88c2375876ac1be576f7791a771bb716bae"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
