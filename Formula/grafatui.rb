class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.11"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.11/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "0af0b6cccac5eb103f3b0b2d0feb0c7bb159366f0dac099361b11958cc3916f1"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.11/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "6eaf82616d52909a70ace038ffcb7d8d8d2dce8696f30bfdd46f88eefc8312a2"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.11/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "184e4fc85d43c3d2adc48b7399ea4712f30e4157f4184aa4131bccd2fabfe2d4"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.11/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fea11e7ca061af8a4bb02d1d1a0da49306da470c55aa828e63b13d7065332b64"
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
