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
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.1/speqkit-v0.6.1-darwin-arm64.tar.gz"
      sha256 "d53207a5715cca30f5f72c364e6859c40952e823f5e4e663dad68b643ade69a6"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.1/speqkit-v0.6.1-darwin-x64.tar.gz"
      sha256 "86bc86b79ba7ae4892b4f4af4ffa43377a524165ec2d2cb09f477818de8db109"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.1/speqkit-v0.6.1-linux-arm64.tar.gz"
      sha256 "2fdbea2ac72b7dc99722da5d167f13d161fa48f4d2d83100ecdc3e4c98bb305c"
    end
    on_intel do
      url "https://github.com/speqkit/speqkit/releases/download/v0.6.1/speqkit-v0.6.1-linux-x64.tar.gz"
      sha256 "ac236cfdcb2b6989a989e9a648701b69dd68e5047d9ea10439301028a1050e03"
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
