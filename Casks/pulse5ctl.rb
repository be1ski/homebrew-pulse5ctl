cask "pulse5ctl" do
  version "1.13.1"
  sha256 "3682e40fa456dbe64bba2e0441cee09845dc739eeb73c11f25a26d849f55df75"

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
