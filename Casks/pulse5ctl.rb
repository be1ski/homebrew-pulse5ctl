cask "pulse5ctl" do
  version "1.12.2"
  sha256 "b6a280ec5e3966658d6addb239d0db7b5f468b43b37ffca694794d7472fc3ca4"

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
