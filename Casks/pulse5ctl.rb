cask "pulse5ctl" do
  version "1.13.2"
  sha256 "c8b80054a15cc0e060fbd0622721ffec1ac1a95e5ebab5fac0a709886bb73e3e"

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
