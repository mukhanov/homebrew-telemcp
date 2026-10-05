class Telemcp < Formula
  desc "Local Telegram archive with live sync and read-only MCP server"
  homepage "https://github.com/mukhanov/telemcp"
  url "https://github.com/mukhanov/telemcp/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "b168cc6faddf9fe908aebf60c6ee1bf2115d5c1a3e0f8eb12e289bb6e60b447f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/telemcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/telemcp --version")
  end
end
