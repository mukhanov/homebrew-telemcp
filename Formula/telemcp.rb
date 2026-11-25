class Telemcp < Formula
  desc "Local Telegram archive with live sync and read-only MCP server"
  homepage "https://github.com/mukhanov/telemcp"
  url "https://github.com/mukhanov/telemcp/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "49955b1c6fa521960acc16041f14aaa2ca865269a633a86927cc797b1692834a"
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
