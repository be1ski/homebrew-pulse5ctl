cask "pulse5ctl" do
  version "1.12.0"
  sha256 "ac7c2d9a1d530c0f6e23959dc6ee1582ea9d4a51a8da5d1575c9a4723c518a9a"

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
