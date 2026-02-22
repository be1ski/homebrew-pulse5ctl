cask "pulse5ctl" do
  version "1.12.4"
  sha256 "11ac87967691aac228a2c3949eb7c7d81cf6e152903397f5b8ace7b6a6b80980"

  url "https://github.com/be1ski/pulse5ctl/releases/download/v#{version}/pulse5ctl-v#{version}.zip"
  name "pulse5ctl"
  desc "Pulse 5 speaker controller — macOS menu bar app"
  homepage "https://github.com/be1ski/pulse5ctl"

  depends_on macos: ">= :ventura"

  app "pulse5ctl.app"

  postflight do
    system "xattr", "-cr", "#{appdir}/pulse5ctl.app"
  end

  zap trash: [
    "~/Library/Preferences/space.be1ski.pulse5ctl.plist",
  ]
end
