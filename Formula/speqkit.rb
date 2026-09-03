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
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.4.0/speqkit-v0.4.0-darwin-arm64.tar.gz"
      sha256 "846e3bf738f387c447430707173221e8b24d208fb32cc1757594982ee0999016"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.4.0/speqkit-v0.4.0-darwin-x64.tar.gz"
      sha256 "7226ff6478453d534b3f2179d2bfbcf6fdd4d77c3ec90215f651be61481a9f95"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.4.0/speqkit-v0.4.0-linux-arm64.tar.gz"
      sha256 "018c674800b2db648c65bff951152c99dcd713ad90a5ad7eea813825252bb838"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.4.0/speqkit-v0.4.0-linux-x64.tar.gz"
      sha256 "2bb7bf6f87e4f8f6af7d3bb58f8d31bb838f4f1dde7f19d2b81d20b9ab1a886c"
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
