class Grafatui < Formula
  desc "A Grafana-like Terminal User Interface for Prometheus"
  homepage "https://github.com/fedexist/grafatui"
  version "0.1.12"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.12/grafatui-x86_64-apple-darwin.tar.gz"
      sha256 "ee539efc6ae43acff25f00c74bac3b3bb1e788c2a8feea65e75f8a475dab6a96"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.12/grafatui-aarch64-apple-darwin.tar.gz"
      sha256 "46b697d7e8bb0a90572be2fb2772752ab9002ea81e1d7c21056090039d090f33"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.12/grafatui-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d0e8d9e27db4d54003567606621ab1f414b2e6eaf17f69eaaae2a251a4a976a"
    elsif Hardware::CPU.arm?
      url "https://github.com/fedexist/grafatui/releases/download/v0.1.12/grafatui-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87ab44b34d864de2aab16a1086dd2e2da89f93afb10459b2e90eb8df87030dfa"
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
