class AvocadoCli < Formula
  desc "Command line interface for Avocado Linux"
  homepage "https://github.com/avocado-linux/avocado-cli"
  version "0.40.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-apple-darwin.tar.gz"
      sha256 "0a197c3d887c959a9ec7edfe4ac0ee02faee60530ced10e81f7bfa19fb822a23"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-apple-darwin.tar.gz"
      sha256 "8c2da4f9c274d48bb3abeec781793ae709c77020a63cf2988b2e843d823363f5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_aarch64-unknown-linux-musl.tar.gz"
      sha256 "55a19ee3508d4653646b4344ea66dcf782f4fdf688bbb7a521a8d9041638dc06"
    end
    on_intel do
      url "https://github.com/avocado-linux/avocado-cli/releases/download/#{version}/avocado-#{version}_x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25782fd00c7aa3fd99c4b424cd937e305ac4495aa827a799ef27d77b2a7b832b"
    end
  end

  def install
    bin.install "avocado"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/avocado --version")
  end
end
