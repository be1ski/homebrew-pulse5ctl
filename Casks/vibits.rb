cask "vibits" do
  version "1.2.0"
  sha256 "b7ae0b9d891de0b2ff6e1e4e305858fc54a741d3c6f3385192ee53ea73055b9e"

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
