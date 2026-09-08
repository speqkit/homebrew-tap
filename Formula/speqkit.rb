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
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.10.0/speqkit-v0.10.0-darwin-arm64.tar.gz"
      sha256 "02e824d970e39300ab0b689c82e4cc4e6e760ff050ac8e65470efe0065ba9e8f"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.10.0/speqkit-v0.10.0-darwin-x64.tar.gz"
      sha256 "e345c7584bbb04f8ee1296711ed076f78b662e8e8c31dccc70215efec0d07319"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.10.0/speqkit-v0.10.0-linux-arm64.tar.gz"
      sha256 "a6d054052ca50ea32d1f85479845656405b54b43e7219e81f70f4c106f1ac893"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.10.0/speqkit-v0.10.0-linux-x64.tar.gz"
      sha256 "40857a8c4b256f762efab407b2054702ef8ea2b60f542b2a4845c2a119f6b4d1"
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
