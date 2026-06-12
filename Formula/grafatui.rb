class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.9"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.9/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "19b8b4c3216d4228d3428ea4d3950cae398f52a5b816ec29a45fdea886c7ae24"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.9/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "c89bd4f306abb98392e29faeb83209a34ad0b6ded3c46abc07172dd01ee82f3b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.9/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b36536853de49493e8388ac173672f04ee883b8633f61a77d96a4074c5ab7ab6"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.9/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5523d31708ed5d185ffe2925dba6b3178ac5fc79af4f21169fa6aef96d84cfc9"
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
