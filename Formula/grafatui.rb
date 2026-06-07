class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.8"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.8/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "2ea2e7f06beb083e1b27bc1b181b7cd1dfbcccff45eb7cac27fe8867a0d547c1"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.8/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "46941170a79097266c134859d0216c72b28e79695eb9efd7605cc2c2d442f9e5"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.8/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "817c70f60ee9e874bc46a54b5cd5795e40166b197cdb42ddb5bf235c98355326"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.8/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be9fef41b34cbcdeb6db1cabdd07c4294b8dfbbfad40a93f207fb0c1a7b3a8ed"
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
