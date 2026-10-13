class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.14"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.14/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "28eaaeadff2cd180821dd20737544d25ce5c7e3c07427d73fcea51d726cf2375"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.14/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "212cc1afeb45bc6e8062d6afd286f75a10f8222904c89a8635e3de2ddcf7e841"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.14/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bdefe8f1c7f496d05ddd9fac41ff23710d7331437b38d9789a2a39d364d2a34"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.14/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e5afe0d8c000011cda75f99a340fe6f64f2282b2500d6db4866a347e6b90a90f"
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
