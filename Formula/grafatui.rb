class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.18"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.18/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "602a12a283ab72109910693a519894967262977a178e282f890cf8080beacefb"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.18/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "89f023b869421fb98f97b984e0ff08291d1678e5565797efbc68e448a6cf33b1"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.18/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e0c8b7ba3bb6bf76e38f5f5d5a7fb797a8671393e92b68cc38403083ece4548"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.18/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f54ef28067a97c10ce9f2c79d57106ce397ca56649c70a3fdb102d90b92c8543"
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
