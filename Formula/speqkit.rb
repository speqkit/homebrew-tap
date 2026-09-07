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
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.7.0/speqkit-v0.7.0-darwin-arm64.tar.gz"
      sha256 "3a7c74a4e504806280de33e64bec97ab9f2bb87d3e8cca89df22467f5bd8f114"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.7.0/speqkit-v0.7.0-darwin-x64.tar.gz"
      sha256 "d80b0a05c0421300bebb266aa77734b6141c1c737f5de0f1b9cf7a956f8ddff1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.7.0/speqkit-v0.7.0-linux-arm64.tar.gz"
      sha256 "39d6c16ffe8571dc99cdedbd73bebaf45a17dc28c496eb6bfe9fb0088aba585e"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.7.0/speqkit-v0.7.0-linux-x64.tar.gz"
      sha256 "8442992c880458429d606ac6a386fabd1bfef5bb8100d3ee6bf59238acf216de"
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
