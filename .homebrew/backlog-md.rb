class BacklogMd < Formula
  desc "Markdown-native Task Manager & Kanban visualizer for any Git repository"
  homepage "https://github.com/mosugi/Backlog.md"
  version "1.47.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mosugi/Backlog.md/releases/download/v#{version}/backlog-bun-darwin-arm64"
      sha256 "PLACEHOLDER_DARWIN_ARM64"
    else
      url "https://github.com/mosugi/Backlog.md/releases/download/v#{version}/backlog-bun-darwin-x64"
      sha256 "PLACEHOLDER_DARWIN_X64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mosugi/Backlog.md/releases/download/v#{version}/backlog-bun-linux-arm64"
      sha256 "PLACEHOLDER_LINUX_ARM64"
    else
      url "https://github.com/mosugi/Backlog.md/releases/download/v#{version}/backlog-bun-linux-x64-baseline"
      sha256 "PLACEHOLDER_LINUX_X64"
    end
  end

  def install
    binary = if OS.mac?
      Hardware::CPU.arm? ? "backlog-bun-darwin-arm64" : "backlog-bun-darwin-x64"
    else
      Hardware::CPU.arm? ? "backlog-bun-linux-arm64" : "backlog-bun-linux-x64-baseline"
    end
    bin.install binary => "backlog"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/backlog --version")
  end
end
