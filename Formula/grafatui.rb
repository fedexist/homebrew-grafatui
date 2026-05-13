class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.7"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.7/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "71dd2f8bc927a900056d689830e7cf8ad822dd99e079f59b942bcc06bc338f0b"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.7/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "da80e3c78bdd9796ec0a3bf38318e0225ee8f53406290673ad05a3f29362338b"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.7/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "033589ff1a3669010cbb272a535447c48b21c906021e9197778eb6e2a4c47e91"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.7/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a651b261d53c4428d8ed85d68b96f17b64728231973148fd98ab48eb9f108d87"
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
