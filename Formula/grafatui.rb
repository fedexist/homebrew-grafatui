class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.17"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.17/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "d56f5ea68fa6759b192732f6d74f6c9d49ea5fc48082a2ab66c476a61a37e8e7"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.17/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "29a59b99f063dd5498a60b562fc65d0a9fbba24326f192eba308602dd4b66e00"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.17/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ae1d9d4a5957630962e15bc548584dda9b01840d0f5b91147a8511031319360"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.17/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a084dae64ff2caf1d72d980aa19d478844351381e2c0efab63a109cae47f41a"
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
