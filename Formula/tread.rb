class Tread < Formula
  desc "A fast, keyboard-driven TUI RSS reader"
  homepage "https://github.com/quietworks/tread"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-arm64"
      sha256 "7cb084efa7a89114c86800d27c231336180b09a4da5f2cbe3ec4442a11885593"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-x64"
      sha256 "16379d1c37024eccb5a5d65f221d9ea78d0f49ec3c0f8cd09df118fa5f503549"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-arm64"
      sha256 "1f189984f8548c17e9d1211ed733844cd9c323405fecb1c6961d7d9932f24b94"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-x64"
      sha256 "51f6d1c35103b9c72d3d2d6f3e055650360a0b08f268e429b32e10c17257185d"
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
