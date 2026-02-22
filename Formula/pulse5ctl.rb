class Pulse5ctl < Formula
  desc "Pulse 5 speaker controller — macOS menu bar app"
  homepage "https://github.com/be1ski/pulse5ctl"
  url "https://github.com/be1ski/pulse5ctl/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "8cb637cc4e7fcff71519ab200053c37fb99862bcd518b05a8434321f3712a9ef"
  license "MIT"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build", "-c", "release", "--product", "pulse5ctl", "--disable-sandbox"

    app = prefix/"pulse5ctl.app"
    (app/"Contents/MacOS").mkpath
    cp ".build/release/pulse5ctl", app/"Contents/MacOS/"
    cp "Sources/app/macos/Info.plist", app/"Contents/"
    cp_r ".build/release/pulse5ctl_CoreLocalization.bundle", app.to_s
    chmod 0755, app/"Contents/MacOS/pulse5ctl"
  end

  def post_install
    quiet_system "killall", "pulse5ctl"
  end

  def caveats
    <<~EOS
      Copy the app to ~/Applications (required for Bluetooth and Spotlight):
        mkdir -p ~/Applications && rm -rf ~/Applications/pulse5ctl.app
        cp -R #{opt_prefix}/pulse5ctl.app ~/Applications/
    EOS
  end

  test do
    assert_predicate prefix/"pulse5ctl.app/Contents/MacOS/pulse5ctl", :exist?
  end
end
