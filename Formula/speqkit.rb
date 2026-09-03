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
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.5.0/speqkit-v0.5.0-darwin-arm64.tar.gz"
      sha256 "5275719f4a4a5ef819d5bdf591a78d35a40cc740ca0297c63423b0acdc5dfbae"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.5.0/speqkit-v0.5.0-darwin-x64.tar.gz"
      sha256 "8366c91b592543fc43e326ed458f34b40fabfee27f1ad9d205db59f59859ee23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.5.0/speqkit-v0.5.0-linux-arm64.tar.gz"
      sha256 "8e1855ebc2c2091ac3281abc43143fd75968f08e45f7a94e941fc9389c1ff778"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.5.0/speqkit-v0.5.0-linux-x64.tar.gz"
      sha256 "d925eb8e108329843582601f9dc4a56ee95bf253aa965d3f64d3044ba1473710"
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
