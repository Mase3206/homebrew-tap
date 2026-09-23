# Documentation: https://docs.brew.sh/Cask-Cookbook
#                https://docs.brew.sh/Adding-Software-to-Homebrew#cask-stanzas
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
cask "subtitleedit@beta" do
  version "5.3.0-beta10"
  sha256 "9bec6605c59683ba9862150f4473c98d999b70ea1bbd6d59993225286dd346d0"

  url "https://github.com/SubtitleEdit/subtitleedit/releases/download/v#{version}/SubtitleEdit-macOS-ARM64.dmg"
  name "SubtitleEdit (beta)"
  desc "Open source cross-platform subtitle editor"
  homepage "https://github.com/SubtitleEdit/subtitleedit"

  # Documentation: https://docs.brew.sh/Brew-Livecheck
  livecheck do
    url "https://github.com/SubtitleEdit/subtitleedit.git"
    # Only include beta versions
    regex(/([0-9]\.[0-9]\.[0-9]-(beta|rc)[0-9]{0,2})/i)
  end

  conflicts_with cask: "subtitleedit"
  depends_on macos: :monterey

  app "Subtitle Edit.app"

  # SubtitleEdit is currently unsigned.
  postflight_steps do
    # system "xattr", "-r", "-d", "com.apple.quarantine", "{{appdir}}/Subtitle Edit.app"
    # system "codesign", "--force", "--deep", "--sign", "-", "{{appdir}}/Subtitle Edit.app"

    run "xattr", args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/Subtitle Edit.app"]
    run "codesign", args: ["--force", "--deep", "--sign", "-", "{{appdir}}/Subtitle Edit.app"]
  end

  # Documentation: https://docs.brew.sh/Cask-Cookbook#stanza-zap
  zap trash: "~/Library/Application Support/Subtitle Edit"
end
