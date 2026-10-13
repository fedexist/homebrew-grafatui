class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.16"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.16/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "a9e4091264000e058f172533adc86159abaf233f73534e28815ec95faf040403"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.16/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "9e1b567b0e7f280f1e9b5fd8e6e3cb57fea43b42016bb7141086a6c0340871cd"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.16/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9eb3254448c9994dd96fb1c01c3f1792198256c4d726c4cab73b0193ba6fac27"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.16/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9dffa59030a4a64a8e7d98f5d15ee9c19021d3d6839bcddadab7e393c4164c2e"
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
