# homebrew-planbooq

Homebrew tap for [Planbooq](https://app.planbooq.com/) — desktop kanban for vibe coding in the age of parallel AI code generation.

## Install

```sh
brew install --cask jaequery/planbooq/planbooq
```

That's it. Homebrew handles the Gatekeeper quarantine for you, so the app opens without "damaged" warnings even though it's not yet signed with an Apple Developer ID.

## Upgrade

```sh
brew upgrade --cask planbooq
```

Releases are published continuously from `main` in [jaequery/planbooq](https://github.com/jaequery/planbooq); this tap is auto-updated by CI on every successful build.

## Uninstall

```sh
brew uninstall --cask planbooq
brew untap jaequery/planbooq
```

## Manual install (no Homebrew)

Grab the DMG from the [latest release](https://github.com/jaequery/planbooq/releases/latest). After dragging Planbooq into `/Applications`, run:

```sh
xattr -dr com.apple.quarantine /Applications/Planbooq.app
```

to clear the browser-applied quarantine flag. (Or just use the brew install above and skip this.)
