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
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.0/speqkit-v0.9.0-darwin-arm64.tar.gz"
      sha256 "e6901242e41520dc999c3557fefe931c4faef8666b3f829b53e7b667f7305f14"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.0/speqkit-v0.9.0-darwin-x64.tar.gz"
      sha256 "aa70a1776c49d7b4321921f94401c06d928fc64dd0cd3c34b1b7c04227fb2193"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.0/speqkit-v0.9.0-linux-arm64.tar.gz"
      sha256 "e778afaed17fb71d92d47a28f0b81d1b5cd9c13cc7d07fa187c54856056134b3"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.0/speqkit-v0.9.0-linux-x64.tar.gz"
      sha256 "07ba554e148a8c5af284defc68cc7526fb080ad99b3a3fef085e307fc635c959"
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
