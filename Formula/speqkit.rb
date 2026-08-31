# The tap formula, rendered by scripts/render-formula.mjs at release time and
# copied into speqkit/homebrew-tap as Formula/speqkit.rb.
#
# The formula is `speqkit` and the binary is `speq`: you install the project
# and you type the command, the same split as @angular/cli installing ng.
#
# No `depends_on "node"`. The archive already contains the runtime — that is
# the whole reason this exists, and a Homebrew dependency on Node would put
# back exactly the thing a Go team came here to avoid.
class Speqkit < Formula
  desc "Test framework that is mostly plugins"
  homepage "https://github.com/speqkit/speqkit"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.2.0/speqkit-v0.2.0-darwin-arm64.tar.gz"
      sha256 "491501e96602e700cbe3926165414ede580a9d049208491c21535cf70bf4073e"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.2.0/speqkit-v0.2.0-darwin-x64.tar.gz"
      sha256 "48310cbae2745cb3df170477677efae1a593a3f362edea18db38beaa126f7c09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.2.0/speqkit-v0.2.0-linux-arm64.tar.gz"
      sha256 "06bd1516573e9aff8159903e2a56c34ca2c6033c15c4b89d08832d4834de782f"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.2.0/speqkit-v0.2.0-linux-x64.tar.gz"
      sha256 "c0749805164d9ee012e04d3b7cb5fcbeeded668a95f74fb20709246eb671cb4b"
    end
  end

  def install
    bin.install "speq"
  end

  test do
    assert_match "speq #{version}", shell_output("#{bin}/speq version")
    system bin/"speq", "init"
    assert_predicate testpath/".speq/speq.yaml", :exist?
  end
end
