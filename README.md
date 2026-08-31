# speqkit/homebrew-tap

The Homebrew tap for [speqkit](https://github.com/speqkit/speqkit) — a test
framework that is mostly plugins.

```sh
brew install speqkit/tap/speqkit
```

You install `speqkit`; the command you type is `speq`.

## This repository is written to by a robot

`Formula/speqkit.rb` is rendered by
[`scripts/render-formula.mjs`](https://github.com/speqkit/speqkit/blob/main/scripts/render-formula.mjs)
during a release and pushed here by
[`release.yml`](https://github.com/speqkit/speqkit/blob/main/.github/workflows/release.yml).
Nothing here is edited by hand: the URLs and checksums in the formula come from
the four archives that release actually built, and the renderer refuses to
produce a formula at all if any of the four platforms is missing.

A tap that is right for three platforms and quietly absent on the fourth is
worse than no tap — `brew install` would work for the maintainer and fail for
whoever bought the other laptop.

Bug reports and pull requests belong in
[speqkit/speqkit](https://github.com/speqkit/speqkit/issues).

## License

MIT, the same as speqkit.
