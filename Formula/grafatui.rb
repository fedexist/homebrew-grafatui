class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.10"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.10/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "f701c45ad726e33bfffa3a5697952b31390153b3dd5ae1dccd2b1b447350dfcb"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.10/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "4fe2f3fdc43143bf08eec8f63ab406b37b61e8f8aa339d768566fd9f05d2bda1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.10/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edd6d500b6a8267adc6895da180d2c35a701c679de5b9a2c1a78b417fbcc805a"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.10/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c91e4359bed9ae1fd5548f5a62b547fcbc021def12838b7e8380ab1d7bc2932"
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
