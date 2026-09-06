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
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.0/speqkit-v0.6.0-darwin-arm64.tar.gz"
      sha256 "887099b081a80dca53d3da64c9f60c3c98d55a6b904c1a2af0c9a69f9f6dc9ee"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.0/speqkit-v0.6.0-darwin-x64.tar.gz"
      sha256 "1a7996578b4606bbf62a23dd37b8bc03b8c1bb6bd88e194750a1a87d524a00bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.0/speqkit-v0.6.0-linux-arm64.tar.gz"
      sha256 "f1664e817505e1b2710e751cfb038db97566e18b26aeb52861939715b6d45365"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.0/speqkit-v0.6.0-linux-x64.tar.gz"
      sha256 "c3e3c4a7fcbbcbe6435536f1f9d4443b758d91bfd181d75ab0d8d73e2f96df61"
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
