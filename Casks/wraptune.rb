cask "wraptune" do
  version "2.0.1"
  sha256 "26fac773d448ca78054456973dbc5755b0c4057bbe56cd3c1962e8240e71f5fc"

  url "https://github.com/thefinder808/WrapTune-MacOS/releases/download/v#{version}/WrapTuneMacOS-#{version}-osx-arm64.dmg"
  name "wraptune"
  desc "Build Intune .intunewin packages from a Mac w/o a Windows VM, Wine, or official tooling"
  homepage "https://github.com/thefinder808/WrapTune-MacOS"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://github.com/thefinder808/WrapTune-MacOS.git"
    # strategy ""
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "WrapTune.app"

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: "~/Library/Application Support/WrapTuneMacOS/settings.json"
end
