# Avocado Linux Homebrew Tap

Homebrew formulae for [Avocado Linux](https://github.com/avocado-linux) tools.

## Usage

```bash
brew tap avocado-linux/tap
brew install avocado-cli
```

Upgrade later with `brew upgrade avocado-cli`.

## Formulae

- `avocado-cli` — [avocado-linux/avocado-cli](https://github.com/avocado-linux/avocado-cli), the Avocado CLI. Binary tarball formula; supported on macOS (x86_64, arm64) and Linux (x86_64 gnu, aarch64 musl).

## Maintenance

The `avocado-cli` formula is automatically updated by the `bump-homebrew-tap` job in [avocado-linux/avocado-cli/.github/workflows/release.yml](https://github.com/avocado-linux/avocado-cli/blob/main/.github/workflows/release.yml) on each stable tag push. The job rewrites `version` and the four per-platform `sha256` lines and commits directly to `main`.
