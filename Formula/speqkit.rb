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
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.8.0/speqkit-v0.8.0-darwin-arm64.tar.gz"
      sha256 "27f9803026260cbcc2d3c6ee15bd259f0efb0d76df7a474767661aea49d9bf90"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.8.0/speqkit-v0.8.0-darwin-x64.tar.gz"
      sha256 "429cb801acaae3cf0c2ffc2eb8668175f6142ee55658174815df9d72433eb886"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.8.0/speqkit-v0.8.0-linux-arm64.tar.gz"
      sha256 "5327105eef81d2b3e3210c55182b7c0602aee615f04607b0e2c13271c9a0731d"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.8.0/speqkit-v0.8.0-linux-x64.tar.gz"
      sha256 "754ae3f6a1c31adcfcd3633d8bd28be6bcb490108c643be7d00788ff20516fdf"
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
