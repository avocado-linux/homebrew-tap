class AvocadoCli < Formula
  desc "Command-line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.0.0/avocado-1.0.0_aarch64-apple-darwin.tar.gz"
      sha256 "56465006d6648180d3a8422dd6ce8dbcfac600474dec99883ed2ec325802a914"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.0.0/avocado-1.0.0_x86_64-apple-darwin.tar.gz"
      sha256 "ec8799bc68479111cb8b6678b818e897c3feb7a5a866487069c515468ca581eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.0.0/avocado-1.0.0_aarch64-unknown-linux-musl.tar.gz"
      sha256 "b766031173c20465291c177604d372fec77ea008650c31120519bedbeeafe07e"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/1.0.0/avocado-1.0.0_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "356889db3e9257805373e2d36af758ef8f1f52b68867462d2a53b415d9a8aa3a"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
