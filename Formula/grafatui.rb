class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.13"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.13/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "a207cd6e6b2a7661d2567c617eaf1a5316a6aa9beb3ef9f73afccda25cd3f273"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.13/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "e5d2a4dad5018ca6e327e5414328d3c96b90bf1c5d9afce746250377e813e19b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.13/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2e504fec7c502b4c840f90863a60dd656458b6d42c6b479f1e7227e4d3b8abb"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.13/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f0085df78b953bb67dfac2012f7e9e3f98fe36db7d42e9004954dce4a2e2be6"
    end
  end

  def install
    bin.install "grafatui"
    generate_completions_from_executable(bin/"grafatui", "completions")
    
    # Generate and install man page
    system "#{bin}/grafatui", "man", ">", "grafatui.1"
    man1.install "grafatui.1"
  end

  test do
    system "#{bin}/grafatui", "--help"
  end
end
