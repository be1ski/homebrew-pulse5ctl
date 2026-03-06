cask "vibits" do
  version "1.3.11"
  sha256 "3a7f093e21ba65616729dfb20477a942b4fc37d0c358ff62ab8b0a9abc1a63d6"

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
