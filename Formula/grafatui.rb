class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.6"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.6/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "9ca1881d5a3567009c023d2fd32cfbc4540d66656700facdc9c77dab7d9818a7"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.6/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "2c4dd22d578615e85a7b66836bb5468e717b33fced07bed01d4ba17783b448ef"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.6/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3180c2a0ac0621e9046af0b0397c3fb9bf58f4d064d4e30d3174ba6a250d90ac"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.6/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "597129121b94e62cc563dc5f8ac151a0eb5917e59ddbab7d462e90c4ecb229af"
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
