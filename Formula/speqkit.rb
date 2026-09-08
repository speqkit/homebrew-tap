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
  version "0.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.1/speqkit-v0.9.1-darwin-arm64.tar.gz"
      sha256 "e53d8326343654e5a168a04f1756d221ff90b69e113217d5c40e41a703c414b5"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.1/speqkit-v0.9.1-darwin-x64.tar.gz"
      sha256 "0c6be63a982feeb5fafac7582fadf92b41fa09be6e01ab9120d463bf0c316609"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.1/speqkit-v0.9.1-linux-arm64.tar.gz"
      sha256 "27d391f753222200c0e3d002bf08793f4f0902a4acb8d86b8fe624d7904abf02"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.9.1/speqkit-v0.9.1-linux-x64.tar.gz"
      sha256 "889bd9384288bc44b853230020236e0b9e2f8f5c5f66ea0a2d4f837c628947ff"
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
