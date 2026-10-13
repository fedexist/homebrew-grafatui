class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.15"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.15/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "93ee5a3209224b74d6e9f708c7adde72881f882109eeda058b68cb51cc224875"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.15/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "ad3958f0b2ef8b861646af4c6b2214094e477059b45f8f7569e03c70a478ff32"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.15/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3645d0201653aa6d229a5f08a702e20e93717355e324a7b046b460598598d51"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.15/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e2534f548c790457d37c3a36b22f3fd0a6b1db827e76e683d2a7eb0fdecf51d"
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
