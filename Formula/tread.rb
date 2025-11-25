class Tread < Formula
  desc "A fast, keyboard-driven TUI RSS reader"
  homepage "https://github.com/quietworks/tread"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-arm64"
      sha256 "f347cef0fdb8940ff50040dded86835f5c7ba9048094b3b37e7f828050b3bae9"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-darwin-x64"
      sha256 "2300b58f4752f8b31d5508e53f18e993e9b9637a94f5845b51a2940d48a161a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-arm64"
      sha256 "c15d6a4a9ec52f560152a5ba27424c792e0feda7386fd51e1e2963f140dadd82"
    end
    on_intel do
      url "https://github.com/quietworks/tread/releases/download/v#{version}/tread-linux-x64"
      sha256 "2b733e88f52194a578b69740d0ab606d1ec7360192cc6e59228230926d6d445c"
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
