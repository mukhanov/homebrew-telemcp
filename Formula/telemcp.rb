class Telemcp < Formula
  desc "Local Telegram archive with live sync and read-only MCP server"
  homepage "https://github.com/mukhanov/telemcp"
  url "https://github.com/mukhanov/telemcp/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "4ac798845a5e2629085f1a7ccabf17333d002a5b4d2bc91972b372fdb10a49d7"
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
