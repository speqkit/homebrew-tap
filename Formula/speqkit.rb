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
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.3.0/speqkit-v0.3.0-darwin-arm64.tar.gz"
      sha256 "29827a7ec7adf590c51c63d584474e86603fd95086fd0250c6510756268c2e26"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.3.0/speqkit-v0.3.0-darwin-x64.tar.gz"
      sha256 "cfa60047c5e1666f49c85971e0ab9afad2beecca1962ef3c630adbfdcd952f8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.3.0/speqkit-v0.3.0-linux-arm64.tar.gz"
      sha256 "20e599dae90aae56812015747286f86eb6779c836c57a1ee6def2bdcef957c64"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.3.0/speqkit-v0.3.0-linux-x64.tar.gz"
      sha256 "97255d28ff8bf787be8101b728629851afddea43049d3800e689957f3aaa6b3f"
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
