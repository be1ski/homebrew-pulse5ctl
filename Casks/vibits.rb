cask "vibits" do
  version "1.3.7"
  sha256 "84ae1a4c4fc8a30a1bf752c9a1d32353a2f2c2ea33554e4adf39aaf80459c90b"

  url "https://github.com/be1ski/vibits/releases/download/v#{version}/Vibits-#{version}.dmg"
  name "Vibits"
  desc "Habit tracker powered by Memos"
  homepage "https://be1ski.github.io/vibits/"

  depends_on macos: ">= :ventura"

  app "Vibits.app"

  postflight do
    system "xattr", "-cr", "#{appdir}/Vibits.app"
  end

  zap trash: [
    "~/Library/Application Support/Vibits",
    "~/Library/Preferences/space.be1ski.vibits.plist",
  ]
end
