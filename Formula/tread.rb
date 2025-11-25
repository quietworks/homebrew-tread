class Tread < Formula
  desc "A fast, keyboard-driven TUI RSS reader"
  homepage "https://github.com/quietworks/tread"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-arm64"
      sha256 "1993218929445c2e6daf18cd46a5d6a6c7cb49bd2d367d586761e26dc595bdf7"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-x64"
      sha256 "482e34336bfa7dcd3a4ad76508135a727f14bd0e30ee19850b60f44fff8dc56b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-arm64"
      sha256 "10e1be2793fb98940cff9a19862361c2cc93737d9a6515f17302bd4da566ac2a"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-x64"
      sha256 "db4f4b81c0ddb9bb62b17b17c7b2002b79301da25d9ea552d74780419154c5d4"
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
