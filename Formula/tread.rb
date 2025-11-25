class Tread < Formula
  desc "A fast, keyboard-driven TUI RSS reader"
  homepage "https://github.com/quietworks/tread"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-arm64"
      sha256 "SHA256_DARWIN_ARM64"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-x64"
      sha256 "SHA256_DARWIN_X64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-arm64"
      sha256 "SHA256_LINUX_ARM64"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-x64"
      sha256 "SHA256_LINUX_X64"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "tread-darwin-arm64" : "tread-darwin-x64"
    else
      Hardware::CPU.arm? ? "tread-linux-arm64" : "tread-linux-x64"
    end
    bin.install binary_name => "tread"
  end

  test do
    assert_match "tread #{version}", shell_output("#{bin}/tread --version")
  end
end
